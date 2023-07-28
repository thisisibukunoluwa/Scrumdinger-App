//
//  Theme.swift
//  Scrumdinger
//
//  Created by Ibukunoluwa Akintobi on 25/07/2023.
//

import SwiftUI

enum Theme :String {
case bubblegum
case buttercup
case indigo
case lavender
case magenta
case navy
case orange
case oxblood
case periwinkle
case poppy
case purple
case seafoam
case sky
case tan
case teal
case yellow
    var accentColor:Color {
        switch self {
        case .bubblegum , .buttercup, .lavender, .orange,.periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo , .magenta, .navy, .oxblood,.purple: return .white
        }
    }
    // creates a color using the enumerations rawValue 
    var mainColor: Color {
        Color(rawValue) 
    }
    // capitalizes the enumeration rawValue
    var name : String {
        rawValue.capitalized
    }
}
