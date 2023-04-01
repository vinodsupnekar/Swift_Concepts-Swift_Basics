//
//  SeatBooking.swift
//  DemoActors
//
//  Created by Rjvi on 09/03/23.
//

import Foundation

public class SeatBooking {
    
    let barrierQueue = DispatchQueue(label: "concurrentBookFlightQueue", attributes: .concurrent)
    let lock = NSLock()
    
    public init() {
    }
    
    public func bookFlight() {
        let flight = Flight()
        let queueone = DispatchQueue(label: "queue1")
        let queueTwo = DispatchQueue(label: "queue2")
        
        queueone.async {
//            self.lock.lock()
            let bookedSeat = flight.bookSeat()
            print("booked seat \(bookedSeat)")
//            self.lock.unlock()
        }
        
        queueTwo.async {
//            self.lock.lock()

            let availableSeat = flight.getAvailableSeats()
            print("available seats \(availableSeat)")
//            self.lock.unlock()

        }
    }
}

