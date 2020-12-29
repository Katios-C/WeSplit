//
//  ContentView.swift
//  WeSplit
//
//  Created by Екатерина Чернова on 28.12.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = "1"
    @State private var tipPersentage = 2
    
    let tipPersentages = [10, 15, 20, 25, 0]
    
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPersentages[tipPersentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let granTotal = orderAmount + tipValue
        //var amountPerPerson = 0.0
        let amountPerPerson = (granTotal / peopleCount)
       
        
        return amountPerPerson
    }
    
    var totalSum: Double {
        var totalSum = 0.0
        print(totalPerPerson)
        totalSum = (totalPerPerson * (Double(numberOfPeople) ?? 0))
        
        return totalSum
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
//                    Picker("Number of people", selection: $numberOfPeople) {
//                        ForEach(2 ..< 100) {
//                            Text("\($0) people")
//                        }
//                    }
                    HStack { Section(header: Text("Number of peple:").foregroundColor(.gray)) { TextField("Number of people", text: $numberOfPeople).keyboardType(.decimalPad)
                    }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave")) {
                    
                    Picker("Tip persentage", selection: $tipPersentage) {
                        ForEach(0 ..< tipPersentages.count) {
                            Text("\(self.tipPersentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section(header: Text("Total sum")) {
                    Text("Total sum is \(totalSum, specifier: "%.2f")")
                }
                }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

