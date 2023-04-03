//
//  Endpoint.swift
//  CocktailsZeeMee
//
//  Created by Kostiantyn Nevinchanyi on 4/2/23.
//

import Foundation


protocol EndpointInterface {
    var url: URL? { get }
}

enum Endpoint: EndpointInterface {
    case searchCocktail(name: String)
    case details(drinkId: String)
    
    // example: www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita
    var baseUrl: String { "https://www.thecocktaildb.com" }
    var path: String {
        switch self {
        case .searchCocktail(let name): return "/api/json/v1/1/search.php?s=\(name)"
        case .details(let drinkId): return "/api/json/v1/1/lookup.php?i=\(drinkId)"
        }
    }
    var url: URL? {
        URL(string: baseUrl + path)
    }
}
