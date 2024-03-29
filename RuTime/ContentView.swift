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
                    Image(ruYears > 0 ? .heart : ruYears == 0 ? .neutral : .negative)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .listRowInsets(EdgeInsets())
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

#Preview {
    ContentView()
}
