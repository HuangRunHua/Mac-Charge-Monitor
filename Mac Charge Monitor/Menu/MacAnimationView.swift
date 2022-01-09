//
//  BluetoothAnimationView.swift
//  MiAirSEConnector
//
//  Created by Qian on 2022/1/8.
//

import SwiftUI
import AVKit
import Cocoa

struct MacAnimationView: View {
    
    @State var queuePlayer = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "macbookair", ofType: "mov")!))
    
    @EnvironmentObject var deviceStatus: DeviceStatus
    
    var body: some View {
        AVPlayerControllerRepresented(player: queuePlayer)
            .onAppear {
                queuePlayer.play()
            }
            .onChange(of: deviceStatus.deviceInfo.isCharging) {newValue in
                if newValue {
                    queuePlayer.seek(to: CMTime.zero)
                    queuePlayer.play()
                }
            }
    }
}

struct MacAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MacAnimationView().environmentObject(DeviceStatus())
    }
}


