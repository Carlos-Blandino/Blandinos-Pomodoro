//
//  BreakTimeVC.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/26/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit

class BreakTimeVC: UIViewController {
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
        breaksOverButton.isEnabled = false
        mainTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWorkTime), userInfo: nil, repeats: true)
        
        
        // Do any additional setup after loading the view.
    }
    @objc func updateWorkTime() {
        if myBreakTimer.breakTime != 0 {
            breakTimeLabel.text =  myBreakTimer.timeToString(typeOfTime: "break")
        } else {
            breaksOverButton.isEnabled  = true
            
            mainTime.invalidate()
        }
        
    }
    
    @IBAction func breaksOverPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
