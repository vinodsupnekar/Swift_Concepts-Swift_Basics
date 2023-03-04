//
//  MovieList.swift
//  MovieTracker
//
//  Created by Rjvi on 04/03/23.
//

import SwiftUI

struct MovieList: View {
    
    var movies = [Movie(), Movie(), Movie()]
    var body: some View {
        List(movies) { movie in
            Text(movie.title)
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
