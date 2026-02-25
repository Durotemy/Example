//
//  ContentView.swift
//  Example
//
//  Created by Emmanuel Durotimi on 24/02/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var taskCount: Int =  0
    var body: some View {
        VStack {
            
            Text("Hello, world howdy! ").font(.largeTitle).fontWeight(.bold)
            Text("Stay beautiful").font(.subheadline).foregroundStyle(.secondary)
            
            Text("Tasks: \(taskCount)")
                            .font(.title2)
            HStack{
                Button("Tap Me Increase") {
                            print("Button tapped")
                    taskCount += 1
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                
                Button("Tap Me Decrease") {
                            print("Button tapped")
                    taskCount -= 1
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                
            }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
