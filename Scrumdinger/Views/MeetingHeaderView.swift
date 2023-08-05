//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Ibukunoluwa Akintobi on 04/08/2023.
//

import SwiftUI

struct MeetingHeaderView : View {
    let secondsElapsed:Int
    let secondsRemaining:Int
    let theme :Theme
    private var totalSeconds:Int {
        secondsElapsed + secondsRemaining
    }
    private var progress:Double {
        guard totalSeconds > 0 else {return 1}
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    private var minutesRemaining:Int {
        secondsRemaining / 60
    }
    var body :some View {
        VStack {
            ProgressView(value:progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack{
                VStack(alignment:.leading){
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment:.trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill").labelStyle(.trailingIcon)
                }
            }
            Circle()
                .strokeBorder(lineWidth: 24)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time Remaining")
        .accessibilityValue("10 minutes")
        .padding([.top,.horizontal])
    }
}

struct MeetingHeaderView_Previews:PreviewProvider {
    static var previews :some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme:.bubblegum).previewLayout(.sizeThatFits)
    }
}
