//
//  SearchBar.swift
//  last.fm
//
//  Created by admin on 21.1.22..
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    private var backgroundColor: UIColor = .systemBackground
    @Binding var text: String
    
    
    init(text: Binding<String>) {
        self._text = text
    }

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
          
          
        }
    }
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.autocapitalizationType = .none
        searchBar.barTintColor = backgroundColor
        searchBar.setShowsCancelButton(true, animated: true)
       
  
         
        
        
        return searchBar
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       searchBar.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
        
        
        
    }
}

extension SearchBar {
    func backgroundColor(_ color: Color) -> SearchBar {
        var view = self
        view.backgroundColor = UIColor(color)
        return view
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
