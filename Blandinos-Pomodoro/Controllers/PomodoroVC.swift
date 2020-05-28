//
//  ViewController.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/14/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit
import AVFoundation

class PomodoroVC: UIViewController {
    
    var player = AVAudioPlayer()
    
    var myTimer: TimerBrain?
    
    var mainTime = Timer()
    
    var buttonState = false
    
    @IBOutlet weak var timerDescriptionLabel: UILabel!
    
    @IBOutlet weak var workTimeLabel: UILabel!
    
    @IBOutlet weak var timerOneButton: UIButton!
    
    @IBOutlet weak var timerTwoButton: UIButton!
    
    @IBOutlet weak var timerThreeButton: UIButton!
    
    @IBOutlet weak var timerFourButton: UIButton!
    
    @IBOutlet weak var startBreakButton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        resetView()
    }
    
    func resetView() {
        
        myTimer!.breakTime = (myTimer?.breakOne!)! * Int(60)
        myTimer!.timer = (myTimer?.timerOne!)! * Int(60)
        timerOneButton.isEnabled = true
        timerTwoButton.isEnabled = true
        timerThreeButton.isEnabled = true
        timerFourButton.isEnabled = true
        
        timerOneButton.setTitle("\(myTimer!.timerOne!)/\(myTimer!.breakOne!)", for: .normal)
        timerTwoButton.setTitle("\(myTimer!.timerTwo!)/\(myTimer!.breakTwo!)", for: .normal)
        timerThreeButton.setTitle("\(myTimer!.timerThree!)/\(myTimer!.breakThree!)", for: .normal)
        timerFourButton.setTitle("\(myTimer!.timerFour!)/\(myTimer!.lunchBreak!)", for: .normal)
        workTimeLabel.text = myTimer?.timeToString(typeOfTime: "work")
        //startBreakButton.isEnabled = false
        startBreakButton.isHidden = true
        myTimer?.breakNumber = 0
        timerDescriptionLabel.text = "Timer:"
        
        
    }
    
    @IBAction func timerOnePressed(_ sender: UIButton) {
        if buttonState == false {
            myTimer!.breakTime = (myTimer?.breakOne!)! * Int(60)
            myTimer!.timer = (myTimer?.timerOne!)! * Int(60)
            mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
            myTimer?.breakNumber = 1
            buttonState = true
            timerOneButton.isEnabled = true
            timerTwoButton.isEnabled = false
            timerThreeButton.isEnabled = false
            timerFourButton.isEnabled = false
            timerDescriptionLabel.text = "Timer 1:"
        }
        
    }
   
    @IBAction func timerTwoPressed(_ sender: UIButton) {
        if buttonState == false {
            myTimer!.breakTime = (myTimer?.breakTwo!)! * Int(60)
            myTimer!.timer = (myTimer?.timerTwo!)! * Int(60)
            mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
            myTimer?.breakNumber = 2
            buttonState = true
            timerOneButton.isEnabled = false
            timerTwoButton.isEnabled = true
            timerThreeButton.isEnabled = false
            timerFourButton.isEnabled = false
            timerDescriptionLabel.text = "Timer 2:"
        }
    }
    
    @IBAction func timerThreePressed(_ sender: UIButton) {
        if buttonState == false {
            myTimer!.breakTime = (myTimer?.breakThree!)! * Int(60)
            myTimer!.timer = (myTimer?.timerThree!)! * Int(60)
            mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
            myTimer?.breakNumber = 3
            buttonState = true
            timerOneButton.isEnabled = false
            timerTwoButton.isEnabled = false
            timerThreeButton.isEnabled = true
            timerFourButton.isEnabled = false
            timerDescriptionLabel.text = "Timer 3:"
        }
    }
    
    @IBAction func timerFourPressed(_ sender: UIButton) {
        if buttonState == false {
            myTimer!.breakTime = (myTimer?.lunchBreak!)! * Int(60)
            myTimer!.timer = (myTimer?.timerFour!)! * Int(60)
            mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
            myTimer?.breakNumber = 4
            buttonState = true
            timerOneButton.isEnabled = false
            timerTwoButton.isEnabled = false
            timerThreeButton.isEnabled = false
            timerFourButton.isEnabled = true
            timerDescriptionLabel.text = "Timer 4:"
        }
    }
    
    @objc func updateWorkTime(){
        if myTimer!.timer >= 0 {
            workTimeLabel.text = myTimer?.timeToString(typeOfTime: "work")
            if myTimer?.timer == 0 {
                playAlarm()
            }
        } else {
            //startBreakButton.isEnabled  = true
            startBreakButton.isHidden = false
            mainTime.invalidate()
        }
    }
    
    
    @IBAction func startBreakPressed(_ sender: UIButton) {
        buttonState = false
        performSegue(withIdentifier: "breakTimeVCSeque", sender: self)
        switch myTimer!.breakNumber {
        case 1:
            myTimer!.breakTime = (myTimer?.breakTwo!)! * Int(60)
            myTimer!.timer = (myTimer?.timerTwo!)! * Int(60)
 
        case 2:
            myTimer!.breakTime = (myTimer?.breakThree!)! * Int(60)
            myTimer!.timer = (myTimer?.timerThree!)! * Int(60)
         
        case 3:
            myTimer!.breakTime = (myTimer?.lunchBreak!)! * Int(60)
            myTimer!.timer = (myTimer?.timerFour!)! * Int(60)
  
        case 4:
            myTimer!.breakTime = (myTimer?.breakOne!)! * Int(60)
            myTimer!.timer = (myTimer?.timerOne!)! * Int(60)
 
            resetView()
        default:
            break
        }
        
        //startBreakButton.isEnabled = false
        startBreakButton.isHidden = true
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
    
    @IBAction func reset(_ sender: UIButton) {
        
        if buttonState == true {
            mainTime.invalidate()
            resetView()
            buttonState = false
        }
        
    }
    
    @IBAction func unwindFromStartBreakVC(storyboard: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "breakTimeVCSeque" {
            let destinationVC = segue.destination as! BreakTimeVC
            destinationVC.myBreakTimer = myTimer!
        }
    }
    
}

