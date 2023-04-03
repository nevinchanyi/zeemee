//
//  Cocktail.swift
//  CocktailsZeeMee
//
//  Created by Kostiantyn Nevinchanyi on 4/2/23.
//

import Foundation


struct Cocktail: Decodable {
    let id: String
    let name: String // GG
    let category: String // "Ordinary Drink"
    let instructions: String // Pour the Galliano liqueur over ice. Fill the remainder of the glass with ginger ale and thats all there is to it. You now have a your very own GG.
    let thumbnail: String //"https:\/\/www.thecocktaildb.com\/images\/media\/drink\/vyxwut1468875960.jpg"
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case category = "strCategory"
        case instructions = "strInstructions"
        case thumbnail = "strDrinkThumb"
    }
    
    var thumbnailURL: URL? {
        URL(string: thumbnail)
    }
}

extension Cocktail: Identifiable {
//    var id: String { thumbnail } //UUID().uuidString }
}
