//
//  ArtistsViewModel.swift
//  last.fm
//
//  Created by admin on 23.1.22..
//

import Foundation
import Resolver

class ArtistsViewModel: ObservableObject {
    @Injected private var lastFmProvider: LastFmProvider
    let country: CountryModel
    
    @Published private(set) var artists = [ArtistModel]()
    
    init(country: CountryModel) {
        self.country = country
        Task {
            do {
                artists = try await lastFmProvider.fetchTopArist(byCountry: country.name.common)
                
        
            }
            catch {
                // handle error
                print(error)
            }
        }
    }
    
 
}
