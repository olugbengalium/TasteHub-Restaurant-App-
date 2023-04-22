//
//  Extension.swift
//  TasteHub
//
//  Created by Gbenga Abayomi on 21/04/2023.
//

import Foundation
import  SwiftUI
extension View {
    func encapulate(color: Color, foregroundColor: Color = .black) -> some View {
        return self
            .padding(7)
            .padding(.horizontal, 5)
            .background(Capsule().fill(color))
            .foregroundColor(foregroundColor)
    }
    
    func encapulate(borderColor: Color) -> some View {
        return self
            .padding(7)
            .padding(.horizontal, 5)
            .overlay(Capsule().stroke(borderColor))
    }
}
struct MyButtonStyle: ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .fontWeight(.heavy)
            .background(isSelected ? Color.orange : Color.orange)
            .foregroundColor(isSelected ? Color.white : Color.red)
            .clipShape(Capsule())
    }
}
