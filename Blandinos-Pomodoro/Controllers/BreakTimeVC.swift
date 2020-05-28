//
//  BreakTimeVC.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/26/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit
import AVFoundation

class BreakTimeVC: UIViewController {
    var player = AVAudioPlayer()
    var myBreakTimer = TimerBrain()
    @IBOutlet weak var breaksOverButton: UIButton!
    @IBOutlet weak var breakTimeLabel: UILabel!
    @IBOutlet weak var breakDescriptionLabel: UILabel!
    var mainTime = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch myBreakTimer.breakNumber {
        case 1:
            breakDescriptionLabel.text = "Break 1:"
        case 2:
            breakDescriptionLabel.text = "Break 2:"
        case 3:
            breakDescriptionLabel.text = "Break 3:"
        case 4:
            breakDescriptionLabel.text = "Lunch:"
        default:
            break
        }
        breaksOverButton.isHidden = true
        mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
    }
    @objc func updateWorkTime() {
        if myBreakTimer.breakTime >= 0 {
            breakTimeLabel.text =  myBreakTimer.timeToString(typeOfTime: "break")
            if myBreakTimer.breakTime == 0 {
                playAlarm()
            }
        } else {
            breaksOverButton.isHidden = false
            mainTime.invalidate()
        }
        
    }
    
    func playAlarm() {
        
        let url = Bundle.main.url(forResource: "alarms_sound", withExtension: "mp3")
        
        if let goodUrl = url {
            do {
                player = try AVAudioPlayer(contentsOf: goodUrl)
                player.play()
            } catch {
                print("something went wrong with audio player")
            }
        } else {
            print("something went wrong with audio file")
        }
    }
    @IBAction func breaksOverPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
