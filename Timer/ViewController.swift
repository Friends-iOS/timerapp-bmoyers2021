//
//  ViewController.swift
//  Timer
//
//  Created by Adam Jackrel on 4/2/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let marshmallowTimes = ["White": 5, "Brown": 8, "Black": 12]
    
    var timer = Timer()
    
    let marshmallowSelector: String = "White"
    
    var totalTime: Float = 0;
    
    var secondsPassed: Float = 0
    
    var player: AVAudioPlayer!
    
    var marshmallow: String = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBAction func marshmallowSelected(_ sender: UIButton) {
        self.titleLabel.text = "What color do you want your marshmallow?"
        
        timer.invalidate()
        
        secondsPassed = 0
        
        totalTime = 0
        
        marshmallow = sender.currentTitle!
        print(marshmallow)
        
        totalTime = Float(marshmallowTimes[marshmallow]!)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        
        if (totalTime > 0){
            self.titleLabel.text = String(totalTime)
            totalTime = totalTime-1
        }
        
        else{
            self.titleLabel.text = "DONE!"
            playSound(label: "alarm_sound")
            timer.invalidate()
        }
        
    }
    
    func playSound(label : String) {
        let url = Bundle.main.url(forResource: label, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    
    }
   


}

