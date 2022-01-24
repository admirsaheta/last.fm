//
//  CountriesView.swift
//  last.fm
//
//  Created by admin on 20.1.22..
//

import SwiftUI
import KeyboardAware

struct CountriesView: View {
    
    @StateObject var viewModel = CountryViewModel()
    
    
    @State private var searchText = ""
    @State private var selection: CountryModel.ID? = nil
    
    private var countries: [CountryModel] {
        let searchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if searchText.isEmpty {
            return viewModel.countries
        }
        let regex = try! NSRegularExpression(pattern: "\(searchText)", options: .caseInsensitive)
        print(regex)
        return viewModel.countries.filter({
            let toCheck = $0.name.common
            let match = regex.matches(in: toCheck, range: NSRange(location: 0, length: toCheck.count))
            return match.count > 0
        })
    }
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Spacer()
                    Section(header:
                                SearchBar(text: $searchText)
                                .backgroundColor(Color("mainbackgroundcolor"))
                            
                            
                    )
                    {
                        
                        if viewModel.countries.isEmpty{
                            VStack{
                                ProgressView()
                            }
                        } else {
                            
                            ForEach(countries) { country in
                                NavigationLink(
                                    destination: ArtistView(
                                    viewModel: .init(country: country)),
                                    tag: country.id,
                                    selection: $selection)
                                {
                                    EmptyView()
                                }
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(country.flag ?? "")
                                        Text(country.name.common)
                                            .foregroundColor(.white)
                                        
                                    }
                                    Divider()
                                }
                                .padding(.horizontal)
                    
                                .onTapGesture {
                                    selection = country.id
                                }
                                
                            }
                            
                        }
                        
                        
                        
                    }
                    
                }
                
                
                
            }
            .onAppear {
                Task {
                    await viewModel.fetchCountries()
                }
            }
            
            .navigationTitle("Countries")
            .preferredColorScheme(.dark)
            .background(
                Color("mainbackgroundcolor").ignoresSafeArea(.all, edges: .all)
            )
           
            
            
        }
        .accentColor(.white)
        
        
        
        
        
        
    }
    
}

