//
//  TimerBrain.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/27/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import Foundation

struct TimerBrain {
    
    var timer: Int = 0
    var breakTime: Int = 0
    var timerOne: Int?
    var breakOne: Int?
    var timerTwo: Int?
    var breakTwo: Int?
    var timerThree: Int?
    var breakThree: Int?
    var timerFour: Int?
    var lunchBreak: Int?
    var breakNumber = 0
    
    mutating func timeToString(typeOfTime: String) -> String {
        var resultStr = ""
        if typeOfTime == "work" {
        if timer > 0 {
                
                let minutes = String(timer/60)
                
                var seconds = String(Int(timer) % 60)
                
                switch seconds {
                    
                case "0","1","2","3","4","5","6","7","8","9":
                    seconds = "0" + seconds
                default:
                    break
                }
                resultStr = "\(minutes):\(seconds)"
                
                timer -= 1
            }
        } else if typeOfTime == "break" {
            
            if breakTime != 0 {
                
                let minutes = String(breakTime/60)
                
                var seconds = String(Int(breakTime) % 60)
                
                switch seconds {
                    
                case "0","1","2","3","4","5","6","7","8","9":
                    seconds = "0" + seconds
                default:
                    break
                }
                resultStr = "\(minutes):\(seconds)"
                
                breakTime -= 1
            }
            
        }
        
        return resultStr
    }
}
