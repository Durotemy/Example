//
//  Task.swift
//  Example
//
//  Created by Emmanuel Durotimi on 25/02/2026.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var title: String;
    var isCompleted: Bool = false;
    
}
