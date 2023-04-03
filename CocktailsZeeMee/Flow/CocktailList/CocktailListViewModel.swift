//
//  CocktailListViewModel.swift
//  CocktailsZeeMee
//
//  Created by Kostiantyn Nevinchanyi on 4/2/23.
//

import SwiftUI
import Combine

final class CocktailListViewModel: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    let networkService: NetworkServable
    
    @Published var searchText = String()
    @Published var cocktails: [Cocktail]
    
    
    init(networkService: NetworkServable = NetworkService(),
         cocktails: [Cocktail] = []) {
        self.networkService = networkService
        self.cocktails = cocktails
        listenForSearchChanges()
    }
    
    private func listenForSearchChanges() {
        $searchText
            .debounce(for: 0.7, scheduler: RunLoop.current)
            .sink { [weak self] cocktailText in
                guard let self else { return }
                Task(priority: .background) {
                    await self.requestCocktails(for: cocktailText)
                }
            }
            .store(in: &cancellables)
    }
    
    private func requestCocktails(for name: String) async {
        do {
            let result: Drinks = try await networkService.request(
                endpoint: Endpoint.searchCocktail(name: name),
                timeoutInterval: 10.0
            )
            await MainActor.run {
                self.cocktails = result.drinks
            }
        } catch {
            print(error) // I would like to show error, but there is no this case in design
        }
    }
}
