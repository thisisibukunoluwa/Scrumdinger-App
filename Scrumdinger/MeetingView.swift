//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Ibukunoluwa Akintobi on 24/07/2023.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack{
            ProgressView(value:5,total:15)
        }
        HStack{
            Text("Seconds Elapsed")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
