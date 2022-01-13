//
//  MenuExtension.swift
//  Mac Charge Monitor
//
//  Created by Runhua Huang on 2022/1/13.
//

import SwiftUI

struct ClearMenu: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
            Menu(configuration)
            .foregroundColor(.white)
            .frame(width: 25, height: 20)
            .menuStyle(.borderlessButton)
        }
}
