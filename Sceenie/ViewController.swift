//
//  ViewController.swift
//  Sceenie
//
//  Created by Molnár Csaba on 2019. 09. 11..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit
import ReplayKit

class ViewController: UIViewController {
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var imagePicker: UISegmentedControl!
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var micToggle: UISwitch!
    @IBOutlet weak var recordBtn: UIButton!
    
    var recorder = RPScreenRecorder.shared()
    private var isRecording = false

    @IBAction func imagePicked(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedImageView.image = UIImage(named: "skate")
        case 1:
            selectedImageView.image = UIImage(named: "food")
        case 2:
            selectedImageView.image = UIImage(named: "cat")
        case 3:
            selectedImageView.image = UIImage(named: "nature")
        default:
            selectedImageView.image = UIImage(named: "skate")
        }
    }
    
    @IBAction func recordBtnWasPressed(_ sender: Any) {
        if !isRecording {
            startRecording()
        } else {
  //          stopRecording()
        }
    }
    
    func startRecording() {
        guard recorder.isAvailable else {
            print("recording is not avaiable at this time.")
            return
        }
        
        if micToggle.isOn {
            recorder.isMicrophoneEnabled = true
        } else {
            recorder.isMicrophoneEnabled = false
        }
        
        recorder.startRecording { (error) in
            guard error == nil else {
                print("there was an error starting the recording")
                return
            }
            
            self.micToggle.isEnabled = false
            self.recordBtn.setTitleColor(#colorLiteral(red: 0.8957869411, green: 0.2001414299, blue: 0.1402733624, alpha: 1), for: .normal)
            self.recordBtn.setTitle("Stop", for: .normal)
            self.statusLbl.text = "Recording..."
            self.statusLbl.textColor = #colorLiteral(red: 0.8957869411, green: 0.2001414299, blue: 0.1402733624, alpha: 1)
            self.isRecording = true
            
        }
    }
}






