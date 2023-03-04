//
//  ContentView.swift
//  MovieTracker
//
//  Created by Rjvi on 04/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var title = ""
    @State var rating = 3.0
    @State var seen = false
    
    var body: some View {
        List {
            Section{
       TextField("Movie Title", text: $title)
            }
            Section {
                HStack {
                    Spacer()
                    Text(String(repeating: "*", count: Int(rating))).foregroundColor(.yellow).font(.title)
                Spacer()
                }
                Slider(value: $rating, in: 1...5, step: 1)

            }
            Section {
                Toggle(isOn: $seen){
                    if title == "" {
                        Text("Has seen the movie")
                    } else {
                        Text("Has seen the  \(title)")

                    }
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
