import Foundation

class Person {
    var firstName: String
    var lastName: String
    
    init(firstname: String, lastname: String) {
        self.firstName = firstname
        self.lastName = lastname
    }
    
    var fullname: String {
        "\(firstName) \(lastName)"
    }
}

let john = Person(firstname: "wer", lastname: "erty")
