//
//  ContentView.swift
//  SwiftUILesson
//
//  Created by Lina Tsymbal on 05.04.2024.
//

import SwiftUI

struct SimpleCalculatorView: View {
    
    @StateObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Text("Simple Calculator")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    HStack {
                        TextField("Number 1", text: $viewModel.number1)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .keyboardType(.decimalPad)
                        
                        TextField("Number 2", text: $viewModel.number2)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .keyboardType(.decimalPad)
                    }
                }
                .padding(.horizontal)
                
                HStack(spacing: 20) {
                    ForEach(CalculatorOperation.allCases, id: \.self) { operation in
                        Button(action: {
                            viewModel.calculate(operation: operation)
                        }) {
                            Text(operation.rawValue)
                                .font(.title)
                                .frame(width: 70, height: 70)
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(35)
                                .shadow(radius: 10)
                        }
                    }
                }
                
                Text("Result: \(viewModel.result)")
                    .font(.title2)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.top, 20)
                
                Spacer()
                
                NavigationLink(destination: OperationsHistoryView(operations: viewModel.operationsHistory)) {
                    Text("Show History")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }
            .padding()
            .navigationBarTitle("Calculator", displayMode: .inline)
            .background(Color(.systemBackground))
        }
    }
}

struct SimpleCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleCalculatorView()
    }
}

enum CalculatorOperation: String, CaseIterable {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}


