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
        
        print(myBreakTimer.breakNumber)
        switch myBreakTimer.breakNumber {
        case 1:
            breakDescriptionLabel.text = "First Break:"
        case 2:
            breakDescriptionLabel.text = "Second Break:"
        case 3:
            breakDescriptionLabel.text = "Third Break:"
        case 4:
            breakDescriptionLabel.text = "Lunch Break:"
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func breaksOverPressed(_ sender: UIButton) {
      
        self.dismiss(animated: true, completion: nil)
    }
}
