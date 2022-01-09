//
//  ContentView.swift
//  Mac Charge Monitor
//
//  Created by Runhua Huang on 2022/1/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
            _ = getBatteryState()
        }
    }
    
    func getBatteryState() -> [String?] {
        let task = Process()
        let pipe = Pipe()

        task.launchPath = "/usr/bin/pmset"
        task.arguments = ["-g", "batt"]
        task.standardOutput = pipe
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
        
        // The array that contains all the thing about battery status
        let batteryArray = output.components(separatedBy: ";")
        
        // The battery usage source
        let source = output.components(separatedBy: "'")[1]
        
        // The charging or discharging status
        let state = batteryArray[1].description.trimmingCharacters(in: NSCharacterSet.whitespaces).description.capitalized
        
        // Get the mac battery percentage
        let percent = String.init(batteryArray[0].description.components(separatedBy: ")")[1].description.trimmingCharacters(in: NSCharacterSet.whitespaces))
        
        // Get the remaining time
        var remaining = String.init(batteryArray[2].dropFirst().split(separator: " ")[0])
        if (remaining == "(no") {
            remaining = "Calculating"
        }
        print("1. ---------------------------")
        print(source)
        print("2. ---------------------------")
        print(state)
        print("3. ---------------------------")
        print(percent)
        print("4. ---------------------------")
        print(remaining)
        return [source, state, percent, remaining]
    }

            
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
