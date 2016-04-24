//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Qimin Yao on 4/23/16.
//  Copyright © 2016 Qimin Yao. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    
    @IBOutlet weak var recordStatus: UILabel!
    @IBOutlet weak var microphone: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        applyDefaultSettings()
    }
    
    @IBAction func playMicrophone(sender: AnyObject) {
    
        microphoneDidPlay()
    }
    
    
    @IBAction func stop(sender: AnyObject) {
    
        applyDefaultSettings()
    }
    
    func applyDefaultSettings() -> Void {
        recordStatus.text = "Record!"
        microphone.enabled = true
        stop.enabled = false
    }
    
    func microphoneDidPlay() -> Void {
        recordStatus.text = "Recording!"
        microphone.enabled = false
        stop.enabled = true
    }
}

