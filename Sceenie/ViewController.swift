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
    }
}

