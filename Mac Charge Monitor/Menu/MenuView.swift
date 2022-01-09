//
//  MenuView.swift
//  MiAirSEConnector
//
//  Created by Qian on 2022/1/8.
//

import SwiftUI
import AVKit

struct MenuView: View {
    
    var body: some View {
        ZStack {
            MacAnimationView()
                .scaleEffect(0.9)
                .frame(width: 300)

            VStack {
                Text("MacBook Air")
                    .padding(.top, 30)
                    .foregroundColor(.white)
                .font(.system(size: 30, weight: .light, design: .rounded))
                Spacer()
            }
        }.background(.black)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
