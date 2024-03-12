//
//  Styles.swift
//  NetworkScanner
//
//  Created by 0xNeverC0RE on 12/03/2024.
//

import Foundation
import SwiftUI


struct PBStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: configuration.fractionCompleted! * 300, height: 5)
                .foregroundColor(.white)
                .animation(.linear)
        }
        .frame(height: 20)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
