//
//  CocktailsZeeMeeApp.swift
//  CocktailsZeeMee
//
//  Created by Kostiantyn Nevinchanyi on 4/1/23.
//

import SwiftUI

@main
struct CocktailsZeeMeeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CocktailListView()
            }
            .environment(\.colorScheme, .light)
        }
    }
}
