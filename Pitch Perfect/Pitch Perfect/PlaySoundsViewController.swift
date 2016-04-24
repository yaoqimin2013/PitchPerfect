//
//  PlayViewController.swift
//  Pitch Perfect
//
//  Created by Qimin Yao on 4/23/16.
//  Copyright © 2016 Qimin Yao. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var audioFile: AVAudioFile!
    
    
    // Temporary remove errors
    var recordedAudioURL: NSURL!
    var stopTimer: NSTimer!
    var stopButton: UIButton!
    var snailButton: UIButton!
    var chipmunkButton: UIButton!
    var rabbitButton: UIButton!
    var vaderButton: UIButton!
    var echoButton: UIButton!
    var reverbButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func playSound(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func stopSound(sender: AnyObject) {
    
    
    
    }
    
}