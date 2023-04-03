//
//  CocktailDetailsView.swift
//  CocktailsZeeMee
//
//  Created by Kostiantyn Nevinchanyi on 4/3/23.
//

import SwiftUI

struct CocktailDetailsView: View {

    @StateObject var viewModel: CocktailDetalsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        AsyncImage(url: viewModel.cocktail.thumbnailURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {}
                            .frame(maxWidth: .infinity, maxHeight: 220.0)
                            .clipped()
                            .overlay(bannerView().padding(),
                                     alignment: .bottomLeading)
                        
                        LazyVStack(alignment: .leading) {
                            Text("Instructions")
                                .modifier(HeaderModifier())
                            
                            Text(viewModel.cocktail.instructions)
                        }
                        .padding()
                        
                        LazyVStack(alignment: .leading) {
                            Text("^[\(viewModel.ingredients.count) ingredient](inflect: true)")
                                .modifier(HeaderModifier())
                            
                            ForEach(viewModel.ingredients) { ingredient in
                                HStack(spacing: 0) {
                                    if let measure = ingredient.measure {
                                        Text(measure + " ")
                                            .bold()
                                    }
                                    Text(ingredient.name)
                                    
                                    Spacer()
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        if let glass = viewModel.glass {
                            LazyVStack(alignment: .leading) {
                                Text("Glass needed")
                                    .modifier(HeaderModifier())
                                
                                Text(glass)
                            }
                            .padding()
                        }
                    }
                }
                
                Divider()
                
                Button(action: {
                    viewModel.share()
                }, label: {
                    LazyVStack {
                        HStack {
                            Image("share.icon")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                            
                            Text("Share")
                                .font(.system(size: 20, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .padding(Constants.spacing16x)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(.mainBlue)
                            .padding()
                    )
                })
                .navigationTitle(viewModel.cocktail.name)
            }
            .navigationBarItems(leading: Button {
                viewModel.dismiss()
            } label: {
                Image("chevron.down.icon")
            }, trailing: Button {
                viewModel.share()
            } label: {
                Image("share.icon")
            })
        }
    }
    @ViewBuilder
    private func bannerView() -> some View {
        Text(viewModel.cocktail.category.uppercased())
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.white)
            .padding(6)
            .background(
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .foregroundColor(.mainGreen)
            )
    }
}

struct CocktailDetalsView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetailsView(viewModel: CocktailDetalsViewModel())
    }
}
