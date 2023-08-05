//
//  ScrumTimer.swift
//  Scrumdinger
//
//  Created by Ibukunoluwa Akintobi on 04/08/2023.
//
import Foundation

@MainActor
final class ScrumTimer : ObservableObject {
    struct Speaker:Identifiable {
        
        let name:String
        
        var isCompleted:Bool
        let id = UUID()
    }
    @Published var activeSpeaker = ""
    
    @Published var secondsElapsed = 0
    
    @Published var secondsRemaining = 0
    
    private(set) var speakers: [Speaker] = []
    
    private(set) var lengthInMinutes:Int
    
    var speakerChangedAction:(() -> Void)?
    
    private weak var timer:Timer?
    
    private var timerStopped = false
    
    private var frequency:TimeInterval { 1.0/60.0 }
    
    private var lengthInSeconds:Int {lengthInMinutes * 60}
    
    private var secondsPerSpeaker:Int {
        (lengthInMinutes * 60) / speakers.count
    }
    
    private var secondsElapsedForSpeaker:Int = 0
    
    private var speakerIndex:Int = 0
    
    private var speakerText: String {
        return "Speaker \(speakerIndex + 1):" + speakers[speakerIndex].name
    }
    private var startDate: Date?
    
    /**
         Initialize a new timer. Initializing a time with no arguments creates a ScrumTimer with no attendees and zero length.
         Use `startScrum()` to start the timer.
         
         - Parameters:
            - lengthInMinutes: The meeting length.
            -  attendees: A list of attendees for the meeting
        **/
    init(lengthInMinutes:Int = 0, attendees: [DailyScrum.Attendee] = []) {
        self.lengthInMinutes = lengthInMinutes
        self.speakers = attendees.speakers
        secondsRemaining = lengthInMinutes
        activeSpeaker = speakerText
    }
    //Start the timer
    func startScrum() {
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) {
            [weak self] timer in self?.update()
        }
        timer?.tolerance = 0.1
        changeToSpeaker(at:0)
    }
    //stop the timer
    func stopScrum() {
        timer?.invalidate()
        timerStopped = true
    }
    //advance the timer to the next speaker
    nonisolated func skipSpeaker (){
        Task {
            @MainActor in changeToSpeaker(at: speakerIndex + 1)
        }
    }
    private func changeToSpeaker(at index:Int) {
        if index > 0 {
            let previousSpeaker = index - 1
            speakers[previousSpeaker].isCompleted = true
        }
        secondsElapsedForSpeaker = 0
        
        guard index < speakers.count else { return }
        
        speakerIndex = index
        
        activeSpeaker = speakerText
        
        secondsElapsed = index * secondsPerSpeaker
        
        secondsRemaining = lengthInSeconds - secondsElapsed
        
        startDate = Date()
    }
    
    nonisolated private func update() {
        
        Task {
            @MainActor in guard let startDate, !timerStopped else {return}
            let secondsElapsed = Int(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970)
            secondsElapsedForSpeaker = secondsElapsed
            self.secondsElapsed = secondsPerSpeaker * speakerIndex + secondsElapsedForSpeaker
            guard secondsElapsed <= secondsPerSpeaker else {
                return
            }
            secondsRemaining = max(lengthInSeconds - self.secondsElapsed,0)
            
            if secondsElapsedForSpeaker >= secondsPerSpeaker {
                changeToSpeaker(at: speakerIndex + 1)
                speakerChangedAction?()
            }
        }
    }
    
    /**
         Reset the timer with a new meeting length and new attendees.
         
         - Parameters:
             - lengthInMinutes: The meeting length.
             - attendees: The name of each attendee.
         */
    func reset (lengthInMinutes:Int, attendees:[DailyScrum.Attendee]) {
        self.lengthInMinutes = lengthInMinutes
        self.speakers = attendees.speakers
        secondsRemaining = lengthInSeconds
        activeSpeaker = speakerText
    }
}


extension Array<DailyScrum.Attendee>  {
    var speakers :[ScrumTimer.Speaker] {
        if isEmpty {
            return [ScrumTimer.Speaker(name: "Speaker 1", isCompleted: false)]
        } else {
            return map {ScrumTimer.Speaker(name: $0.name, isCompleted: false)}
        }
    }
}
