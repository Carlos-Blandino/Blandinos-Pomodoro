//
//  SettingsVC.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/23/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var lunchTimeSlider: UISlider!
    @IBOutlet weak var breakTimeSlider: UISlider!
    @IBOutlet weak var workTimeSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
       
    }
    
    @IBAction func workTimeChange(_ sender: UISlider) {
        //String(format: "%.2f", workTimeSlider.value) to have 2 decimal places but for now we use none
        print("Work: ", Int(workTimeSlider.value))
    }
    
    @IBAction func breakTimeChange(_ sender: UISlider) {
        print("Break: ", Int(breakTimeSlider.value))
    }
    
    @IBAction func lunchTimeChange(_ sender: UISlider) {
        print("Lunch: ", Int(lunchTimeSlider.value))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
