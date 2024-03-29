//
//  Utilities.swift
//  RuTime
//
//  Created by Rhys Johns on 29/3/2024.
//

import Foundation

func convertRuConstantToTimeUnit(ruYearConstant: Double, timeUnit: Int) -> Double {
    let hoursPerDay: Double = 24;
    let minutesPerDay: Double = hoursPerDay * 60;
    let secondsPerDay: Double = minutesPerDay * 60;
    
    switch timeUnit {
    case 0:
        return ruYearConstant / secondsPerDay
    case 1:
        return ruYearConstant / minutesPerDay
    case 2:
        return ruYearConstant / hoursPerDay
    case 3:
        return ruYearConstant
    case 4:
        return ruYearConstant * 7
    case 5:
        return ruYearConstant * 7 * 52
    default:
        return ruYearConstant
    }
}
