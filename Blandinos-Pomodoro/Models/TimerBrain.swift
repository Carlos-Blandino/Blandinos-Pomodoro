//
//  TimerBrain.swift
//  Blandinos-Pomodoro
//
//  Created by Carlos Blandino on 5/27/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import Foundation

struct TimerBrain {
    
    var workTime: Int = 0
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
            if workTime >= 0 {
                
                var minutes = String(workTime/60)
                
                var seconds = String(Int(workTime) % 60)
                
                switch seconds {
                    
                case "0","1","2","3","4","5","6","7","8","9":
                    seconds = "0" + seconds
                default:
                    break
                }
                switch minutes {
                    
                case "0","1","2","3","4","5","6","7","8","9":
                    minutes = "0" + minutes
                default:
                    break
                }
                resultStr = "\(minutes):\(seconds)"
                
                workTime -= 1
            }
        } else if typeOfTime == "break" {
            
            if breakTime >= 0 {
                
                var minutes = String(breakTime/60)
                
                var seconds = String(Int(breakTime) % 60)
                
                switch seconds {
                    
                case "0","1","2","3","4","5","6","7","8","9":
                    seconds = "0" + seconds
                default:
                    break
                }
                
                switch minutes {
                    
                case "0","1","2","3","4","5","6","7","8","9":
                    minutes = "0" + minutes
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
