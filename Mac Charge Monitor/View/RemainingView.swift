//
//  RemainingView.swift
//  Mac Charge Monitor
//
//  Created by Runhua Huang on 2022/1/10.
//

import SwiftUI

struct RemainingView: View {
    
    @EnvironmentObject var deviceStatus: DeviceStatus
    
    var body: some View {
        if deviceStatus.isCharged {
            if deviceStatus.deviceInfo.remaining == "Calculating" {
                Text("\(deviceStatus.deviceInfo.remaining) time for charging full")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .light, design: .default))
                .padding(.top, -10)
                .padding(.bottom, 20)
            } else {
                Text("\(deviceStatus.deviceInfo.remaining) remaining until fully charged")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .light, design: .default))
                .padding(.top, -10)
                .padding(.bottom, 20)
            }
            
        } else {
            Text("\(deviceStatus.deviceInfo.remaining) remaining to use")
                .foregroundColor(.gray)
                .font(.system(size: 15, weight: .light, design: .default))
            .padding(.top, -10)
            .padding(.bottom, 20)
        }
    }
}

struct RemainingView_Previews: PreviewProvider {
    static var previews: some View {
        RemainingView().environmentObject(DeviceStatus())
    }
}
