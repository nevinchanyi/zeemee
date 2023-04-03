//
//  CocktailDetailsViewModel.swift
//  CocktailsZeeMee
//
//  Created by Kostiantyn Nevinchanyi on 4/3/23.
//

import SwiftUI


final class CocktailDetalsViewModel: ObservableObject {
    
    private let networkService: NetworkServable
    @Published var present = false
    @Published var cocktail = Cocktail(id: "", name: "", category: "", instructions: "", thumbnail: "")
    @Published var ingredients = [Ingredient]()
    @Published var glass: String?
    
    
    init(networkService: NetworkServable = NetworkService()) {
        self.networkService = networkService
    }
    
    func push(cocktail: Cocktail) {
        DispatchQueue.main.async {
            self.cocktail = cocktail
            self.present = true
        }
        requestDetails(for: cocktail)
    }
    
    @MainActor
    func dismiss() {
        cocktail = Cocktail(id: "", name: "", category: "", instructions: "", thumbnail: "")
        ingredients = []
        glass = nil
        present = false
    }
    
    private func requestDetails(for cocktail: Cocktail) {
        Task(priority: .background) {
            let details: DrinkDetail = try await networkService.request( // I would like to catch error, but there is no this case in design
                endpoint: Endpoint.details(drinkId: cocktail.id),
                timeoutInterval: 10.0
            )
            let ingredients = generateIngridients(from: details)
            let glass = details.drinks.first?.strGlass
            
            await MainActor.run {
                self.ingredients = ingredients
                self.glass = glass
            }
        }
    }
    
    // I'm not proud of this solution, but I don't have a lot of free time for that
    private func generateIngridients(from details: DrinkDetail) -> [Ingredient] {
        var ingredients = [Ingredient]()
                
        for (ind, val) in details.ingredients.enumerated() {
            let ingredient = Ingredient(name: val ?? "", measure: details.measures[ind])
            ingredients.append(ingredient)
        }
        return ingredients.filter({ !$0.name.isEmpty && ($0.measure != nil || $0.measure != "") })
    }
    
    func share() {
        
    }
}
