//
//  ContentView.swift
//  MovieTracker
//
//  Created by Rjvi on 04/03/23.
//

import SwiftUI

struct MovieDetail: View {
    
    @State var title = ""
    @State var rating = 3.0
    @State var seen = false
    
   
    var body: some View {
        List {
            Section{
                SectionTitle(title: "Title")

                TextField("Movie Title", text: $title)
                
            }
            Section {
                SectionTitle(title: "Rating")

                HStack {
                    Spacer()
                    Text(String(repeating: "*", count: Int(rating))).foregroundColor(.yellow).font(.title)
                Spacer()
                }
                Slider(value: $rating, in: 1...5, step: 1)

            }
            Section {
                SectionTitle(title: "User Exp")

                Toggle(isOn: $seen){
                    if title == "" {
                        Text("Has seen the movie")
                    } else {
                        Text("Has seen the  \(title)")

                    }
                }
            }
            Section {
                Button(action: {
                    
                }){
                    HStack {
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail()
    }
}

struct SectionTitle: View {
    var title: String
    var body: some View {
        Text(title).font(.caption).foregroundColor(.blue)
    }
}