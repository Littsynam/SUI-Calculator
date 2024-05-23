//
//  CalculatorViewModel.swift
//  SwiftUILesson
//
//  Created by Lina Tsymbal on 11.04.2024.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var number1: String = ""
    @Published var number2: String = ""
    @Published var result: String = "0"
    @Published var operationsHistory: [String] = []
    
    func calculate(operation: CalculatorOperation) {
        guard let num1 = Double(number1), let num2 = Double(number2) else {
            result = "Error"
            return
        }
        
        switch operation {
        case .addition:
            result = String(num1 + num2)
        case .subtraction:
            result = String(num1 - num2)
        case .multiplication:
            result = String(num1 * num2)
        case .division:
            result = num2 != 0 ? String(num1 / num2) : "Error"
        }
        
        operationsHistory.append("\(number1) \(operation.rawValue) \(number2) = \(result)")
    }
}
