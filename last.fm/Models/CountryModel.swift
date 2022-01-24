//
//  CountryModel.swift
//  last.fm
//
//  Created by admin on 20.1.22..
//

import Foundation

public struct CountryModel: Codable {
    
    struct LocalizedName: Codable {
        let official: String
        let common: String
    }
    
    struct Name: Codable {
        
        struct NativeName: Codable {
            let eng: LocalizedName
            let hmo: LocalizedName
            let tpi: LocalizedName
        }
        
        let common: String
        let official: String
    }
    
    let name: Name
    let flag: String?
    let cca2: String
}

extension CountryModel: Identifiable {
    public var id: String {
        return cca2
    }
}
