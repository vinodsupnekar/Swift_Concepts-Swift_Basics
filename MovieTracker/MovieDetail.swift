//
//  ContentView.swift
//  MovieTracker
//
//  Created by Rjvi on 04/03/23.
//

import SwiftUI

struct MovieDetail: View {
    
    @State var movie: Movie
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var movieStorage: MovieStorage

    let newMovie : Bool
    
    var body: some View {
        List {
            Section{
                SectionTitle(title: "Title")

                TextField("Movie Title", text: $movie.title)
                
            }
            Section {
                SectionTitle(title: "Rating")

                HStack {
                    Spacer()
                    Text(String(repeating: "*", count: Int(movie.rating))).foregroundColor(.yellow).font(.title)
                Spacer()
                }
                Slider(value: $movie.rating, in: 1...5, step: 1)

            }
            Section {
                SectionTitle(title: "User Exp")
                Toggle(isOn: $movie.seen) {
                    if movie.title == "" {
                    Text("Has seen the movie")
                } else {
                    Text("Has seen the  \(movie.title)")
                }
                }
            }
            Section {
                Button(action: {
                    if self.newMovie {
                        self.movieStorage.movies.append(movie)
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    HStack {
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                }.disabled(movie.title.isEmpty)
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(), movieStorage: MovieStorage(), newMovie: true)
    }
}

struct SectionTitle: View {
    var title: String
    var body: some View {
        Text(title).font(.caption).foregroundColor(.blue)
    }
}
