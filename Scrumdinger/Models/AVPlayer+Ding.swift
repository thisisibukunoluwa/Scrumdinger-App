//
//  AVPlayer+Ding.swift
//  Scrumdinger
//
//  Created by Ibukunoluwa Akintobi on 04/08/2023.
//

import Foundation
import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav")
            else {fatalError("Failed to find sound file")}
        return AVPlayer(url:url)
    }()
}
