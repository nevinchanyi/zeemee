//
//  CocktailListView.swift
//  CocktailsZeeMee
//
//  Created by Kostiantyn Nevinchanyi on 4/1/23.
//

import SwiftUI

struct CocktailListView: View {
    
    @StateObject private var viewModel = CocktailListViewModel()
    @StateObject private var detailsViewModel = CocktailDetalsViewModel()
    
    var body: some View {
        ScrollView {
            HStack {
                Image("search.icon")
                
                TextField(text: $viewModel.searchText) {
                    Text("Search cocktail")
                }
                
                if !viewModel.searchText.isEmpty {
                    Button {
                        viewModel.searchText = ""
                    } label: {
                        Image("clear.icon")
                    }
                }
                
            }
            .padding()
            .background(Color.lightGrey.cornerRadius(7))
            .padding()
            
            ForEach(viewModel.cocktails) { cocktail in
                CocktailCellView(cocktail: cocktail)
                    .onTapGesture {
                        detailsViewModel.push(cocktail: cocktail)
                    }
            }
            .sheet(isPresented: $detailsViewModel.present, content: {
                CocktailDetailsView(viewModel: detailsViewModel)
            })
        }
        .navigationTitle("Search")
    }
}

struct CocktailListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CocktailListView()
        }
    }
}
