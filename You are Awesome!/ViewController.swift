//
//  ViewController.swift
//  You are Awesome!
//
//  Created by Nathan Lee on 1/22/18.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    //MARK: - Properties
    
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var awesomeImage: UIImageView!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    let numberOfImages = 5
    let numberOfSounds = 4
    
    //MARK: - Functions
    
    // Code below executes when the app's view first loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        //can we load in the file soundName?
        if let sound = NSDataAsset(name: soundName){
            //check if sound.data is a sound file
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch{
                //if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound")
            }
            
        }
            //if NSDataAsset can't read it, tell the user/report the error
        else{
            print("ERROR: file \(soundName) didn't load")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int{
        var newIndex = -1
        repeat{
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex
    }
    
    //MARK: - Actions
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if(soundNumber > -1 && !soundSwitch.isOn){
            awesomePlayer.stop()
        }
    }
    
    //lots of things that happen when you press the button
    @IBAction func showMessagePressed(_ sender: UIButton) {
        
        let messages = ["You are Fantastic!",
                        "You are Great!",
                        "You are Amazing!",
                        "When the Genius Bar needs help, they call you!",
                        "You Brighten My Day!",
                        "You are Da Bomb!",
                        "I can't wait to use your app!",
                        "Fabulous? That's You!"]
        
        //show a random message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //show a random image
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "\(imageNumber)")
        
        //play a random sound
        if soundSwitch.isOn == true{
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
            
        }
        
    }
    
    
    
}

