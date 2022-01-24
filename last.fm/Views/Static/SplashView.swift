//
//  SplashView.swift
//  last.fm
//
//  Created by admin on 20.1.22..
//


import Foundation
import Swift
import SwiftUI
import AuthenticationServices

struct SplashView: View {
    
    // MARK: Vars
    
    @State var animate = false
    @State var endSplash = false
    
    
    
    
    
    // MARK: Body Section
    
    var body: some View {
        
        // MARK: Main Z-Stack
        
        GeometryReader { proxy in
            
            ZStack{
                
                // MARK: Load after ->
                
                CountriesView()
                    .padding(proxy.safeAreaInsets)
                
                // MARK: Secondary Z-Stack ->
                
                ZStack{
                    
                    Color("mainbackgroundcolor")
                    
                    Image("splashbg")
                        .resizable()
                        .ignoresSafeArea(.all, edges: .all)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                    
                    Image("splashicon")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: animate ? .fill : .fit)
                        .frame(width: animate ? nil : 45, height: animate ? nil : 45)
                    
                    // Skaliranje
                    
                        .scaleEffect(animate ? 3 : 1)
                    
                    // Width: Prevencija da ne over-scaleuje
                        .frame(width: UIScreen.main.bounds.width)
                }
                
                .onAppear(perform: animateSplash)
                .opacity(endSplash ? 0 : 1)
                
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    
    func animateSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(Animation.easeInOut(duration: 0.45)){
                animate.toggle()
            }
            withAnimation(Animation.easeInOut(duration: 0.35)){
                endSplash.toggle()
            }
        }
    }
    
    
}
