//
//  BatteryView.swift
//  Mac Charge Monitor
//
//  Created by Runhua Huang on 2022/1/9.
//

import SwiftUI
import Combine

struct BatteryView: View {
    
    @EnvironmentObject var deviceStatus: DeviceStatus
    
    
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                HStack(spacing: 30) {
                    HStack(spacing: -9) {
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 200, height: 90)
                                .foregroundColor(.gray)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.batteryOverlayColor, lineWidth: 5)
                                .background(Color.batteryColor)
                                .frame(width: 2*CGFloat(Int(deviceStatus.deviceInfo.batteryPercentage)!), height: 90)
                                .cornerRadius(20)
                        }
                        
                        Circle()
                            .trim(from: 0, to: 0.4)
                            .rotation(Angle.init(degrees: -72))
                            .foregroundColor(Color.batteryColor)
                            .frame(width: 20, height: 50)
                    }
                    
                    Image(systemName: "bolt.fill")
                        .scaleEffect(5)
                        .foregroundColor(.white)
                        .frame(height: 80)
                        .opacity(deviceStatus.deviceInfo.isCharging ? 1: 0)
                }
                
                HStack {
                    Text("\(deviceStatus.deviceInfo.batteryPercentage)%")
                        .foregroundColor(.white)
                        .font(.system(size: 90, weight: .light, design: .default))
                    
                    Image(systemName: "bolt.fill")
                        .scaleEffect(5)
                        .foregroundColor(.white)
                        .frame(height: 80)
                        .opacity(0)
                }
            }
        }
    }
}

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryView().environmentObject(DeviceStatus()).frame(width: 500, height: 500)
    }
}
