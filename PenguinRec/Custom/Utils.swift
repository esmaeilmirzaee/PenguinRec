//
//  Utils.swift
//  PenguinRec
//
//  Created by Esmaeil MIRZAEE on 2020-05-03.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import Foundation

var appHasMicAccess = false

enum AudioStatus: Int, CustomStringConvertible {
    case Stopped = 0,
    Playing,
    Recording
    
    var audioName: String {
        let audioNames = [
            "Audio: Stopped",
            "Audio: Playing",
            "Audio: Recording"
        ]
        return audioNames[rawValue]
    }
    
    var description: String {
        return audioName
    }
}
