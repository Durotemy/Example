//
//  ContentView.swift
//  Example
//
//  Created by Emmanuel Durotimi on 24/02/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var taskCount: Int =  0
    @State private var tasks = [Task(title: "Learn Spanish"), Task(title: "Read a book"),
        
                                
    ]
    @State private var newTaskTitle = "";
    @State private var showAlert = false;
    var body: some View {
        VStack {
            
            Text("Hello, world howdy! ").font(.largeTitle).fontWeight(.bold)
            Text("Stay beautiful").font(.subheadline).foregroundStyle(.secondary)
            
            Text("Tasks: \(tasks.count)")
                            .font(.title2)
            
            HStack {
                TextField("Enter new Task", text: $newTaskTitle).textFieldStyle(.roundedBorder)
                
                Button("Add Text"){
                    if newTaskTitle.isEmpty {
                            showAlert = true
                        } else {
                            addTask()
                        }
                    
                }.buttonStyle(.borderedProminent)
            }
            
//            HStack{
//                Button("Tap Increase") {
//                            print("Button tapped")
//                    taskCount += 1
//                        }
//                        .padding()
//                        .buttonStyle(.borderedProminent)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                
//                Button("Tap Decrease") {
//                            print("Button tapped")
//                    taskCount -= 1
//                        }
//                        .padding()
//                        .buttonStyle(.borderedProminent)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                
//            }
            .alert("Cannot be empty",
                   isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Please enter a task title before adding.")
            }
            List{
                ForEach(tasks) { task in
                    HStack{
                        /*@START_MENU_TOKEN@*/Text(task.title)/*@END_MENU_TOKEN@*/
                        Spacer()
                        Image(systemName:"checkmark.rectangle.portrait").foregroundStyle(.brown)
                        Button {
                            removeTask(task)
                        } label: {
                            Image(systemName: "trash.square")
                                .foregroundStyle(.brown)
                        }.buttonStyle(.plain)
                    }
                }
            }
            
            
        }
        .padding()
    }
    private func addTask(){
        let newTask = Task(title: newTaskTitle)
        tasks.append(newTask);
        
        newTaskTitle = "";
    }
    
    private func removeTask(_ task: Task) {
        tasks.removeAll { $0.id == task.id }
    }
}

#Preview {
    ContentView()
}
