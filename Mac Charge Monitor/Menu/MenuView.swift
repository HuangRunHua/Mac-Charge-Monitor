//
//  MenuView.swift
//  MiAirSEConnector
//
//  Created by Qian on 2022/1/8.
//

import SwiftUI
import AVKit

struct MenuView: View {
    
    @State var showBattery: Bool = false
    
    @EnvironmentObject var deviceStatus: DeviceStatus
    
    var app: AppDelegate?
    
    var body: some View {
        ZStack {
            MacAnimationView()
                .scaleEffect(0.9)
                .frame(width: 300)
                .offset(y: -10)

            VStack {
                Text(deviceStatus.deviceInfo.deviceName)
                    .padding(.top, 30)
                    .foregroundColor(.white)
                .font(.system(size: 20, weight: .light, design: .rounded))
                Spacer()
                
                BatteryView()
                    .scaleEffect(0.2)
                    .padding(.bottom, -60)
                    .opacity(showBattery ? 1: 0)
            }
        }.background(.black)
            .onAppear {
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
                    let deviceInfo = GetDeviceInfo().getBatteryState()
                    deviceStatus.deviceInfo.deviceName = deviceInfo.deviceName
                    deviceStatus.deviceInfo.batteryPercentage = deviceInfo.percentage
                    deviceStatus.deviceInfo.isCharging = deviceInfo.isCharging
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        showBattery = true
                    }
                }
            }
            .onChange(of: deviceStatus.deviceInfo.isCharging) {newValue in
                if newValue {
                    NSApp.keyWindow?.makeKeyAndOrderFront(nil)
                    NSApp.activate(ignoringOtherApps: true)

                    // Use this sentence to show menu view
                    if  let menuButton = AppDelegate.instance.statusItem?.button {
                        // Top Get Button Location for PopOver
                        AppDelegate.instance.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: .minY)
                    }
                }
            }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().environmentObject(DeviceStatus())
    }
}
