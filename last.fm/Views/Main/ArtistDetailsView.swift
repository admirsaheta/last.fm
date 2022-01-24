//
//  ArtistDetailsView.swift
//  last.fm
//
//  Created by admin on 24.1.22..
//

import SwiftUI
import Kingfisher

struct ArtistDetailsView: View {
    
    @StateObject var viewModel: ArtistDetailsViewModel
    
    
    
    var body: some View {
        ScrollView(.vertical){
            ZStack{
                Image("headerimg")
                    .resizable()
                    .frame(width: 600, height: 350, alignment: .center)
                
                
                LinearGradient(gradient: Gradient(colors: [.clear, Color("mainbackgroundcolor")]), startPoint: .top, endPoint: .bottom)
                VStack{
                    KFImage(URL(string: viewModel.artist.image[2].text))
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    Text(viewModel.artist.name)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.top, 20)
                    
                    
                }
            }
            
            VStack{
                
                Text(viewModel.artist.bio?.summary ?? "Something's wrong, check your connection")
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .padding(.horizontal, 120)
                    .multilineTextAlignment(.center)

            }
        
        }
        .ignoresSafeArea()
        .background(Color("mainbackgroundcolor").ignoresSafeArea(.all))
        
        
        
    }
    
}

