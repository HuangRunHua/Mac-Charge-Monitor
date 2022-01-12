//
//  DeviceStatus.swift
//  Mac Charge Monitor
//
//  Created by Runhua Huang on 2022/1/9.
//

import Foundation
import SwiftUI

class DeviceStatus: NSObject, ObservableObject {
    @Published var isCharged: Bool = false
    @Published var deviceInfo: DeviceInfo = DeviceInfo(deviceName: "MacBook Air", batteryPercentage: "60", isCharging: true, remaining: "06:08")
    @Published var isMacSleep: Bool = false
    
    @objc func onWakeNote(note: NSNotification) {
        print("Wake!!!!!!!!!!!!!!")
        isMacSleep = false
    }

    @objc func onSleepNote(note: NSNotification) {
        print("Sleep!!!!!!!!!!!!!!!!")
        isMacSleep = true
    }

    func fileNotifications() {
        NSWorkspace.shared.notificationCenter.addObserver(
            self, selector: #selector(onWakeNote(note:)),
            name: NSWorkspace.didWakeNotification, object: nil)

        NSWorkspace.shared.notificationCenter.addObserver(
            self, selector: #selector(onSleepNote(note:)),
            name: NSWorkspace.willSleepNotification, object: nil)
    }
}
