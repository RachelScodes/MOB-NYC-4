//
//  ViewController.swift
//  AudioExample
//
//  Created by William Martin on 12/9/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

// Make sure you import these two frameworks into your app.
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {
    
    var player : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPlayTapped(sender: UIButton) {
        if let resourceUrl = NSBundle.mainBundle().URLForResource("01 Bloom", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOfURL: resourceUrl)
                player.numberOfLoops = 1
                player.play()
            } catch {
                print("OOPS!")
            }
        }
    }

}

