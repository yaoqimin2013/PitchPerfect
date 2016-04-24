//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Qimin Yao on 4/23/16.
//  Copyright © 2016 Qimin Yao. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    
    @IBOutlet weak var microphone: UIButton!
    @IBOutlet weak var record: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(animated: Bool) {
        applyDefaultSettings()
    }
    
    @IBAction func playMicrophone(sender: AnyObject) {
    
        microphoneDidPlay()
        
        print("play microphone")
    
    }
    
    
    @IBAction func record(sender: AnyObject) {
    
        applyDefaultSettings()
        
        print("play record")
    }
    
    func applyDefaultSettings() -> Void {
        microphone.enabled = true
        record.enabled = false
    }
    
    func microphoneDidPlay() -> Void {
        microphone.enabled = false
        record.enabled = true
    }
}

