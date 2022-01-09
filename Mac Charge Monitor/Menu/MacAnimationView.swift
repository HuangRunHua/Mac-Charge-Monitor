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
    
    let queuePlayer = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "macbookair", ofType: "mov")!))
    
    var body: some View {
        AVPlayerControllerRepresented(player: queuePlayer)
            .onAppear {
                queuePlayer.play()
            }
    }
}

struct MacAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MacAnimationView()
    }
}


