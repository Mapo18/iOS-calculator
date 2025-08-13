//
//  iOS_CalculatorApp.swift
//  iOS-Calculator
//
//  Created by Maria Peña Ocampo on 30/07/25.
//

import SwiftUI

@main
struct iOS_CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            VerticalButtonStack(viewModel: ViewModel(), data: Matrix.firstSectionData, columns:Matrix.firstSectionGrid(390*0.25), width:390)

        }
    }
}
