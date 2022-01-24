//
//  ArtistDetailsViewModel.swift
//  last.fm
//
//  Created by admin on 24.1.22..
//

import Foundation
import Resolver

class ArtistDetailsViewModel: ObservableObject {
    
    @Injected private var lastFmProvider: LastFmProvider
    @Published private(set) var artist: ArtistModel
    
    
    @Published private(set) var artists = [ArtistModel]()
    
    
    
    init(artist: ArtistModel) {
        self.artist = artist
        Task{
            do{
                self.artist = try await lastFmProvider.fetchArtistInfo(byName: artist.name)
            
            } catch {
                print(error)
            }
        }
    }
}
