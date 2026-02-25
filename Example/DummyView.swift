//
//  DummyView.swift
//  Example
//
//  Created by Emmanuel Durotimi on 26/02/2026.
//

import SwiftUI

struct DummyView: View {
    
    @State private var isActive = false
    
    var body: some View {
        Group {
            if isActive {
                ContentView()
            } else {
                SplashView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    DummyView()
}

