//
//  AVPlayerExtension.swift
//  MiAirSEConnector
//
//  Created by Runhua Huang on 2022/1/8.
//

import Foundation
import AVKit
import SwiftUI


struct AVPlayerControllerRepresented : NSViewRepresentable {
    var player : AVPlayer
    

    func makeNSView(context: Context) -> AVPlayerView {
        let view = AVPlayerView()
        view.controlsStyle = .none
        view.player = player
        return view
    }

    func updateNSView(_ nsView: AVPlayerView, context: Context) {

    }
}

