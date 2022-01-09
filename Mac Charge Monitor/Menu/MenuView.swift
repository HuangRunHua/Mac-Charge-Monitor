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
    
    var body: some View {
        ZStack {
            MacAnimationView()
                .scaleEffect(0.9)
                .frame(width: 300)
                .offset(y: -10)

            VStack {
                Text("MacBook Air")
                    .padding(.top, 30)
                    .foregroundColor(.white)
                .font(.system(size: 30, weight: .light, design: .rounded))
                Spacer()
                
               BatteryView()
                    .scaleEffect(0.2)
                    .padding(.bottom, -60)
                    .opacity(showBattery ? 1: 0)
            }
        }.background(.black)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        showBattery = true
                    }
                }
            }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
