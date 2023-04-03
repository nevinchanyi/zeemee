//
//  CocktailCellView.swift
//  CocktailsZeeMee
//
//  Created by Kostiantyn Nevinchanyi on 4/2/23.
//

import SwiftUI

struct CocktailCellView: View {
    
    let cocktail: Cocktail
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: cocktail.thumbnailURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 68, height: 68)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
                    .frame(width: 68, height: 68)
            }
            
            VStack(alignment: .leading, spacing: Constants.spacing4x) {
                Text(cocktail.name)
                    .bold()
                
                Text(cocktail.category)
                    .textCase(.uppercase)
                    .font(.footnote.bold())
                    .foregroundColor(.mainGrey)
                
                Text(cocktail.instructions)
                    .lineLimit(2)
            }
            
            Spacer()
        }
        .padding(Constants.spacing16x)
    }
}

struct CocktailCellView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailCellView(cocktail: Mock.cocktail)
    }
}
