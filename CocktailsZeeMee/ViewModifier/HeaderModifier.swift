//
//  HeaderModifier.swift
//  CocktailsZeeMee
//
//  Created by Kostiantyn Nevinchanyi on 4/3/23.
//

import SwiftUI

struct HeaderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textCase(.uppercase)
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.gray)
    }
}
