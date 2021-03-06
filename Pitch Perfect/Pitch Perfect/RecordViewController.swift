//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Qimin Yao on 4/23/16.
//  Copyright © 2016 Qimin Yao. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordStatus: UILabel!
    @IBOutlet weak var microphone: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        applyDefaultSettings()
    }
    
    @IBAction func playMicrophone(sender: AnyObject) {
    
        microphoneDidPlay()
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    
    @IBAction func stop(sender: AnyObject) {
    
        applyDefaultSettings()
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Finish recording")
        if flag {
            self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        } else {
            print("Saving of recording failed")
        }
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "stopRecording" {
            let playSoundVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundVC.recordedAudioURL = recordedAudioURL
        }
    }
    
}

