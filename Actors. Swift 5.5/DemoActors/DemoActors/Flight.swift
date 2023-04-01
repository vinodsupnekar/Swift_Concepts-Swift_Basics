//
//  Flight.swift
//  DemoActors
//
//  Created by Rjvi on 09/03/23.
//

import Foundation

actor Flight {
    private let company = "Vistara"
    private var availableSeats = ["1A", "1B", "1C"]

    
    func getAvailableSeats() -> [String]{
            return availableSeats
    }
    
    func bookSeat() -> String {
            let bookedSeat = availableSeats.first ?? ""
            availableSeats.removeFirst()
            return bookedSeat
    }
}
