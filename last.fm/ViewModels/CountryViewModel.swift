//
//  CountryViewModel.swift
//  last.fm
//
//  Created by admin on 20.1.22..
//

import Foundation
import Combine
import Resolver
import CoreData

@MainActor
class CountryViewModel: ObservableObject {
    @Injected private var countryProvider: CountryProvider
    @Injected private var lastFmProvider: LastFmProvider
    
    @Published private(set) var countries = [CountryModel]()
    @Published private(set) var artists = [ArtistModel]()
    
    private let cache = InMemoryCache<[CountryModel]>(expirationInterval: 2 * 60)
    

    
    
    func fetchCountries() async {
        
        do {
            var countriesResponse = try await countryProvider.fetchCountries().sorted(by: {
                $0.name.common < $1.name.common
            })
            let regionCode = Locale.current.regionCode
            let currentCountryIndex = countriesResponse.firstIndex(where: { $0.cca2 == regionCode })
            if currentCountryIndex != nil {
                let currentCountry = countriesResponse[currentCountryIndex!]
                countriesResponse.remove(at: currentCountryIndex!)
                countriesResponse.insert(currentCountry, at: 0)
            }
            self.countries = countriesResponse
        }
        catch {
            // handle error
        }
    }
    
    func fetchArtistsByCountry(country: CountryModel) async {
        do {
            let response = try await lastFmProvider.fetchTopArist(byCountry: country.name.common)
            print(response)
        }
        catch {
            // handle error
            print(error)
        }
    }
}


