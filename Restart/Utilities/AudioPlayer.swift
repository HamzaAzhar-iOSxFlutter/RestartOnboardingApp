//
//  AudioPlayer.swift
//  Restart
//
//  Created by Hamza Azhar on 24/11/2021.
//

import Foundation
import AVFoundation
import SwiftUI

weak var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type)
        do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        audioPlayer?.play()
    } catch {
        print("Could not play the audio")
    }
}
