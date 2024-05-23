//
//  OperationsHistoryView.swift
//  SwiftUILesson
//
//  Created by Lina Tsymbal on 11.04.2024.
//

import SwiftUI

struct OperationsHistoryView: View {
    
    var operations: [String]
    var body: some View {
        List(operations, id: \.self) { operation in
                Text(operation)
        }
        .navigationTitle("Operations History")
    }
}

#Preview {
    OperationsHistoryView(operations: ["1 + 1", "2 / 5"])
}
