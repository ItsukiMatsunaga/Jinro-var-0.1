//
//  PlaySound.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/11/23.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type : String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch{
            print(error)
        }
    }
}


func stopplay(){
    audioPlayer?.stop()
}


func playSoundroup(sound: String, type : String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch{
            print(error)
        }
    }
}
