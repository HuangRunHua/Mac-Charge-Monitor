//
//  DeviceStatus.swift
//  Mac Charge Monitor
//
//  Created by Runhua Huang on 2022/1/9.
//

import Foundation

class DeviceStatus: NSObject, ObservableObject {
    @Published var isCharged: Bool = false
    @Published var deviceInfo: DeviceInfo = DeviceInfo(deviceName: "MacBook Air", batteryPercentage: "60", isCharging: true)
}
