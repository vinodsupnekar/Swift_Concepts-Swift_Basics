//
//  MovieList.swift
//  MovieTracker
//
//  Created by Rjvi on 04/03/23.
//

import SwiftUI

struct MovieList: View {
    
    @ObservedObject var movieStorage = MovieStorage()
    var body: some View {
        NavigationView {
            List(movieStorage.movies) { movie in
            NavigationLink(
                destination: MovieDetail(movie: movie, movieStorage: movieStorage, newMovie: false)) {
            Text(movie.title)
            }}.navigationTitle("Movies").navigationBarItems(trailing: NavigationLink(destination: MovieDetail(movie:Movie(), movieStorage: movieStorage, newMovie: true)){
                Image(systemName: "plus")
            })
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
