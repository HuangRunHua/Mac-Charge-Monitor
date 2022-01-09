//
//  GetDeviceInfo.swift
//  Mac Charge Monitor
//
//  Created by Runhua Huang on 2022/1/9.
//

import Foundation

struct GetDeviceInfo {
    func getBatteryState() -> (deviceName: String, source: String, isCharging: Bool, percentage: String, remaining: String) {
        let task = Process()
        let pipe = Pipe()
        var nameOfDevice: String = ""
        var isCharging: Bool = false

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
        // Discharging
        let state = batteryArray[1].description.trimmingCharacters(in: NSCharacterSet.whitespaces).description.capitalized
        if state != "Discharging" {
            isCharging = true
        }
        
        
        // Get the mac battery percentage
        let percent = String.init(batteryArray[0].description.components(separatedBy: ")")[1].description.trimmingCharacters(in: NSCharacterSet.whitespaces))
        
        let percentage = String(percent.dropLast())
        
        // Get the remaining time
        var remaining = String.init(batteryArray[2].dropFirst().split(separator: " ")[0])
        if (remaining == "(no") {
            remaining = "Calculating"
        }
        
        // Get device name
        if let deviceName = Host.current().localizedName {
           //print(deviceName)
            nameOfDevice = deviceName
        }
//        print("1 --> source")
//        print(source)
//        print("2 --> state")
//        print(state)
//        print("3 --> percent")
//        print(percentage)
//        print("4 --> remaining")
//        print(remaining)
        return (nameOfDevice, source, isCharging, percentage, remaining)
    }

}
