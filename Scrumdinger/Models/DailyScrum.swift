//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Ibukunoluwa Akintobi on 25/07/2023.
//

import Foundation


struct DailyScrum {
    var title:String
    var attendees:[String]
    var lengthinMinutes:Int
    var theme:Theme
}

extension DailyScrum {
    static let sampleData: [DailyScrum] = [
    
    DailyScrum(
        title: "Design",
        attendees: ["Cathy", "Daisy", "Simon","Jonathan"],
        lengthinMinutes: 10,
        theme: .yellow
    ),
    DailyScrum(
        title: "App Dev",
        attendees: ["Katie", "Gray", "Euna","Luis","Darla"],
        lengthinMinutes: 5,
        theme: .orange
    ),
    DailyScrum(
        title: "Web Dev",
        attendees: ["Chella", "Chris", "Christina","Tayo", "Abigail", "Aga", "Chad", "Jenn", "Sarah"],
        lengthinMinutes: 10,
        theme: .yellow
    ),
    ]
}