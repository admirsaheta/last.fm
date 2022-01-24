//
//  ArtistModel.swift
//  last.fm
//
//  Created by admin on 21.1.22..
//

import Foundation

struct ArtistModel: Codable {
    
    
    // MARK: Images
    
    
    struct ArtistImage: Codable {
        let text: String
        let size: String

        enum CodingKeys: String, CodingKey {
            case text = "#text"
            case size
        }
    }
    
    // MARK: Bio
    
    struct ArtistBio: Codable {
        var summary: String?
    }
    
    
    // MARK: Stats
    
    struct ArtistStats: Codable{
        var listeners : String?
        var playcount: String?
    }
    



    let name: String
    let bio: ArtistBio?
    let stats: ArtistStats?
    let image: [ArtistImage]


    
}





extension ArtistModel: Identifiable {
    var id: String {
        return name
    }
    
}
