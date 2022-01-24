//
//  LastFmProvider+Responses.swift
//  last.fm
//
//  Created by admin on 21.1.22..
//

import Foundation

extension LastFmProvider {
    enum Responses {
        enum geo {}
        enum artist {}
    }
}

//geo
extension LastFmProvider.Responses.geo {
    //geo.gettopartists
    struct gettopartists: Codable {
        struct TopArtists: Codable {
            let artist: [ArtistModel]
        }
        let topartists: TopArtists
    }
}

//artist
extension LastFmProvider.Responses.artist {
    struct getInfo: Codable {
        let artist: ArtistModel
    }
}
