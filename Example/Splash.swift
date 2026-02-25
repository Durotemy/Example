//
//  Splash.swift
//  Example
//
//  Created by Emmanuel Durotimi on 26/02/2026.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            Image(systemName: "car.side.hill.down.fill")
                .font(.system(size: 80))
                .foregroundColor(.white)
//            Text("Splash screen for Ios")
//                .font(.largeTitle)
//                .foregroundColor(.white)
        }
    }
}
