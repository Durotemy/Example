//
//  ContentView.swift
//  Example
//
//  Created by Emmanuel Durotimi on 24/02/2026.
//

import SwiftUI

struct ContentView: View {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
    
    @State private var taskCount: Int =  0;
//    @State private var apiTodos = [Todo]();
    @State private var apiTodos: [Todo] = []
    @State private var tasks = [Task(title: "Learn Spanish"), Task(title: "Read a book"),
    ]
    
    
    
    
    struct Todo: Codable, Identifiable {
        let id: Int
        let userId: Int
        let title: String
        let completed: Bool
    }
    
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
            
            
            List {
                ForEach(apiTodos) { todo in
                    HStack {
                        Text(todo.title)
                        Spacer()
                        Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(todo.completed ? .green : .gray)
                    }
                }
            }
            
            
        }
        .onAppear {
                    fetchTodos()
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
    
    private func fetchTodos() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let decoded = try? JSONDecoder().decode([Todo].self, from: data) {
                    DispatchQueue.main.async {
                        self.apiTodos = decoded
                    }
                }
            }
        }.resume()
    }
}



#Preview {
    DummyView()
}
