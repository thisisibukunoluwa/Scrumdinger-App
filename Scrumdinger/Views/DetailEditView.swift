//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Ibukunoluwa Akintobi on 01/08/2023.
//

import SwiftUI

struct DetailEditView:View {
    @Binding var scrum:DailyScrum
    @State private var newAttendeeName = ""
    var body:some View {
        Form {
            Section(header:Text("Meeting Info")) {
                TextField("title", text:$scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble,in:5...30,step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes)")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header:Text("Attendees")) {
                ForEach(scrum.attendees) {
                    attendee in Text(attendee.name)
                }
                .onDelete {
                    indices in scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text:$newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name:newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName:"plus.circle.fill")
                            .accessibilityLabel("Add Attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews : PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}


