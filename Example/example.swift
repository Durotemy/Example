//
//  example.swift
//  Example
//
//  Created by Emmanuel Durotimi on 24/02/2026.
//

import Playgrounds

#Playground {
    var name = "Emma";
    var age = 24;
    print("Hello, \(name)! You are \(age) years old.")
    
    var numbers: [String] = ["5", "6", "7", "8", "9", "10"]
    
    numbers.append("20");
    
    var greterThanFive: [String] = [];
    
    for number in numbers {
        if Int(number) ?? 5 > 8 {
            greterThanFive.append(number);
        }
    }
    print("greterThanFive", greterThanFive)
}


