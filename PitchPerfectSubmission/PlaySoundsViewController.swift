//
//  PlaySoundsViewController.swift
//  PitchPerfectSubmission
//
//  Created by Pasalapudi, Manikanta Aditya on 12/14/16.
//  Copyright © 2016 Pasalapudi, Manikanta Aditya. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioURL: URL!
    
    @IBOutlet weak var slowButton : UIButton!
    @IBOutlet weak var fastButton : UIButton!
    @IBOutlet weak var lowPitchButton : UIButton!
    @IBOutlet weak var highPitchButton : UIButton!
    @IBOutlet weak var echoButton : UIButton!
    @IBOutlet weak var reverbButton : UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        configureUI(.notPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAudio(_ sender: Any) {
        
        let senderButton = sender as! UIButton
        switch(ButtonType(rawValue: senderButton.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopAudio(_ sender : Any){
        
        stopAudioPlayer();
        
    }

    

}
