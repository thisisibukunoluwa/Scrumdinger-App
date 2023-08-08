//
//  History.swift
//  Scrumdinger
//
//  Created by Ibukunoluwa Akintobi on 07/08/2023.
//

import Foundation


struct History : Identifiable {
    let id : UUID
    let date :Date
    var attendees :[DailyScrum.Attendee]
    
    init(id : UUID = UUID(), date:Date = Date(), attendees: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
