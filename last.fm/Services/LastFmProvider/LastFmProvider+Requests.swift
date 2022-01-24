//
//  LastFmProvider+Requests.swift
//  last.fm
//
//  Created by admin on 21.1.22..
//

import Foundation

extension LastFmProvider {
    
    func fetchTopArist(byCountry country: String) async throws -> [ArtistModel] {
        let response = try await fetch(
            method: .geo.gettopartists,
            query: ["country" : country],
            decode: LastFmProvider.Responses.geo.gettopartists.self
        )
        return response.topartists.artist
    }
    
    func fetchArtistInfo(byName name: String) async throws -> ArtistModel {
        let response = try await fetch(
            method: .artist.getInfo,
            query: ["artist" : name],
            decode: LastFmProvider.Responses.artist.getInfo.self
        )
        return response.artist
    }
    
}
