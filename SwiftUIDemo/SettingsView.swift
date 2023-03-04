//
//  SettingsView.swift
//  SwiftUIDemo
//
//  Created by Rjvi on 04/03/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List(players) {
                currentPlayer in
                NavigationLink(destination: PlayerDetail() ) {
                    PlayerRow().frame(height: 100)
                }
            }
            .navigationBarTitle(Text("Players"))
        }
    }
}

struct PlayerRow: View {
    var body: some View {
        Text("Hello Player ")
    }
}


struct PlayerDetail: View {
    var body: some View {
        Text("Hello Player ")
    }
}


struct Player: Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var team: String
    var age: Int
    var height: String
    var weight: Int
}

struct Team {
    var color: Color
    var imageName: String
}

let players = [
    Player(id: 0, name: "Andre Iguodala", imageName: "andre", team: "goldenState", age: 35, height: "6' 6\"", weight: 215)
]

