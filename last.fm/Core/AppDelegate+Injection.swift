//
//  AppDelegate+Injection.swift
//  last.fm
//
//  Created by admin on 21.1.22..
//

import Foundation
import Resolver
import APIProvider

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        let apiURL = APIUrl(fileURL: Bundle.main.url(forResource: "urls", withExtension: "plist")!)

        register {
            CountryProvider(
                apiURL: apiURL["restcountries"],
                urlSessionConfiguration: .default
            )
        }.scope(.application)
        
        register {
            LastFmProvider(
                apiURL: apiURL["lastfm"],
                urlSessionConfiguration: .default
            )
        }.scope(.application)
    }
}
