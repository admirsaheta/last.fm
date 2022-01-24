//
//  CountryProvider+Requests.swift
//  last.fm
//
//  Created by admin on 21.1.22..
//

import Foundation

extension CountryProvider {
    
    /// Fetch all countries
    /// - Returns: Counties
    /// - Throws: ``last.fm/APIProvider/FetchError``
    public func fetchCountries() async throws -> [CountryModel] {
        return try await fetch(endpoint: "/all", method: .get(), decode: [CountryModel].self, cacheMethod: .persistent(60 * 60))
    }

}
