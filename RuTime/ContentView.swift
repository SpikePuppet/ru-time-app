//
//  ContentView.swift
//  RuTime
//
//  Created by Rhys Johns on 25/3/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var humanTime: Double = 0
    @State private var timeUnits = 0;
    @State private var isRounded = false
    
    @FocusState private var isHumanYearsFocused: Bool
    
    private var units = ["Seconds", "Minutes", "Hours", "Days", "Weeks", "Years"]
    // She experiences this many years per day
    private var humanYearsPerDayRuExperiences: Double = 80 / 3
    private var ruYears: Double {
        let time = convertRuConstantToTimeUnit(ruYearConstant: humanYearsPerDayRuExperiences, timeUnit: timeUnits) * humanTime
        if (isRounded) {
            return time.rounded()
        }
        return time;
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Choose time unit") {
                    Picker("Time units", selection: $timeUnits) {
                        ForEach(0..<6) {
                            Text("\(units[$0])")
                        }
                    }.pickerStyle(.navigationLink)
                }
                Section("Enter human timespan") {
                    TextField("Human years", value: $humanTime, format: .number).keyboardType(.decimalPad).focused($isHumanYearsFocused)
                }
                Section("Time in Ru years") {
                    Text("\(ruYears, specifier: isRounded ? "%.0f" : "%.6f")")
                    Button(isRounded ? "Un-wound it pwease" : "Wound it pwease") {
                        isRounded.toggle()
                    }
                }
                Section {
                    if (ruYears > 0) {
                        Image(.heart).resizable().aspectRatio(contentMode: .fit).listRowInsets(EdgeInsets())
                    } else if (ruYears == 0) {
                        Image(.neutral).resizable().aspectRatio(contentMode: .fit).listRowInsets(EdgeInsets())
                    } else {
                        Image(.negative).resizable().aspectRatio(contentMode: .fit).listRowInsets(EdgeInsets())
                    }
                }
                
            }
            .navigationTitle("Ru time Converter")
            .toolbar {
                if isHumanYearsFocused {
                    Button("Done") {
                        isHumanYearsFocused = false
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

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

#Preview {
    ContentView()
}
