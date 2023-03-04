//
//  Movie.swift
//  MovieTracker
//
//  Created by Rjvi on 04/03/23.
//

import Foundation

struct Movie: Identifiable {
     var id = UUID()
     var title = ""
     var rating = 3.0
     var seen = false
}

class MovieStorage: ObservableObject {
    @Published var movies = [Movie]()
}
