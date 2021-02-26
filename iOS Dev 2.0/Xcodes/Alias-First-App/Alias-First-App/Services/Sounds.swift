//
//  Sounds.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 26.02.2021.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?

enum Sounds {
    case noTimeLeft
    case left10Sec
    case correctWord
    case unCorrectWord
    
    public func play() {
        switch self {
            
            case .noTimeLeft:
                let path = Bundle.main.path(forResource: "noTimeLeft", ofType: "wav")!
                let url = URL(fileURLWithPath: path)
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.play()
                } catch {
                    print("No File")
                }
            case .left10Sec:
                let path = Bundle.main.path(forResource: "left10Sec", ofType: "wav")!
                let url = URL(fileURLWithPath: path)
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.play()
                } catch {
                    print("No File")
                }
            case .correctWord:
                let path = Bundle.main.path(forResource: "correctWord", ofType: "wav")!
                let url = URL(fileURLWithPath: path)
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.play()
                } catch {
                    print("No File")
                }
            case .unCorrectWord:
                let path = Bundle.main.path(forResource: "unCorrectWord", ofType: "wav")!
                let url = URL(fileURLWithPath: path)
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.play()
                } catch {
                    print("No File")
                }
            
        }
    }
}
