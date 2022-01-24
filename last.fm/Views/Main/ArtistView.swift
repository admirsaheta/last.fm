//
//  ArtistView.swift
//  last.fm
//
//  Created by admin on 22.1.22..
//

import SwiftUI



struct ArtistView: View {
    
 
    @StateObject var viewModel: ArtistsViewModel


    var body: some View {
        if viewModel.artists.isEmpty {
            
            VStack{
                ProgressView()
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(
                Color("mainbackgroundcolor").ignoresSafeArea(.all, edges: .all)
            )
            
            
        } else {
            ScrollView(.vertical){
                LazyVStack{
                    ForEach(viewModel.artists, id: \.id){ artist in
                        NavigationLink(destination: ArtistDetailsView(
                            viewModel: .init(artist: artist)
                        )){
                            
                            VStack(alignment: .leading){
                                HStack{
                                    
                                    Text(artist.name)
                                    
                                    Spacer()
                                    
                                }
                            }
                            
                            
                        }
                        .frame(alignment: .leading)
                        
                        Divider()
                        
                    }
                    .padding(.horizontal)
                }
                
            }
            .navigationTitle("Top Artists (\(viewModel.artists.count))")
            .preferredColorScheme(.dark)
            .background(
                Color("mainbackgroundcolor").ignoresSafeArea(.all, edges: .all)
            )
        }
        
    }
    
    
    
}

        
        


//            List(viewModel.artists, id: \.id) { artist in
//                NavigationLink(destination: ArtistDetailsView(
//                    viewModel: .init(artist: artist)
//                )){
//                Text(artist.name)
//                }
//            }
//            .navigationTitle("Top Artists (\(viewModel.artists.count))")
//            .preferredColorScheme(.dark)
        
      

   
