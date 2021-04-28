//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let dict: [String : Double] = ["Soft" : 300.0,
                                "Medium" : 480.0,
                                "Hard" : 720.0]
    var totalTime = 0.0
    var secondsPassed = 0.0
    
    var timer = Timer()
    
    @IBOutlet weak var titleChange: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = dict[hardness]!
        
        progressView.progress = 0.0

        secondsPassed = 0.0
        titleChange.text = hardness
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if(secondsPassed < totalTime) {
            secondsPassed += 1
            progressView.progress = Float(secondsPassed / totalTime)
        } else {
            titleChange.text = "DONE!"
            progressView.progress = 1
        }
    }
}
