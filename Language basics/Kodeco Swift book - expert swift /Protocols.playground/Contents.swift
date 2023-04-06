
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

//Heap and stack memory

// For Classes:- When you create an instance of a class, your code requests a block of memory on the heap to store the instance itself; that’s the first name and last name inside the instance on the right side of the diagram. It stores the address of that memory in your named variable on the stack; that’s the reference stored on the left side of the diagram.

//For struct :- When you create an instance of a struct (that is not part of an instance of a class), the instance itself is stored on the stack, and the heap is never involved.

// Creating another varible for class:- gets reference copied
var homeOwner = john
john.firstName = "John" // John wants to use his short name!
john.firstName // "John"
homeOwner.firstName // "John"

// == vs  ===

// Just as the == operator checks if two values are equal.
// The === identity operator compares the memory address of two references.

let imposterJohn = Person(firstname: "Johnny",
                          lastname: "Appleseed")

john === homeOwner // true
john === imposterJohn // false
imposterJohn === homeOwner // false


// Equality check on classes

class Record {
  
  var wins: Int
  var losses: Int
    
  init(wins: Int, losses: Int) {
      self.wins = wins
      self.losses = losses
  }
}

let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)

//recordA == recordB // Build error!

// john == homeOwner // Bulild error

//You can’t apply the == operator to the class you just defined.
//extension Record: Equatable {
//  static func ==(lhs: Record, rhs: Record) -> Bool {
//    lhs.wins == rhs.wins &&
//    lhs.losses == rhs.losses
//  }
//}

//recordA == recordB // No Errors!!!

class RecordStruct {
  
  var wins: Int
  var losses: Int
    
  init(wins: Int, losses: Int) {
      self.wins = wins
      self.losses = losses
  }
}

let record1 = Record(wins: 10, losses: 5)
let record2 = Record(wins: 10, losses: 5)

//record1 == record2

//Note: The compiler will often automatically write (or codegen) the function== for you.
// This automatic code generation happens for structures and enumerations that conform to Equatable when all stored properties and associated values are also Equatable.


extension Record: Comparable {
    static func == (lhs: Record, rhs: Record) -> Bool {
        return (lhs.wins == rhs.wins && lhs.losses == rhs.losses)
    }
    
  static func <(lhs: Record, rhs: Record) -> Bool {
    if lhs.wins == rhs.wins {
      return lhs.losses > rhs.losses
    }
    return lhs.wins < rhs.wins
  }
}


 let id = "id".trimmingCharacters(in: CharacterSet.letters.inverted)


struct Widget: Identifiable {
    private static var idSequence = sequence(first: 1, next: {$0 + 1})

    let id: Int

    init?() {
        guard let id = Widget.idSequence.next() else { return nil}
        self.id = id
    }
}

Widget()?.id // 1
Widget()?.id // 2
Widget()?.id // 3

struct Origin: Equatable {
    var x: Int
    var y: Int
}

struct GridPoint: Hashable {
    var x: Int
    var y: Int
    }

let kk1 = GridPoint(x: 1, y: 2)
let kk2 = GridPoint(x: 1, y: 2)

print(kk1.hashValue)
print(kk2.hashValue)

print(kk1 == kk2)


class Person2 {
  var firstName: String
  var lastName: String

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }

  var fullName: String {
    "\(firstName) \(lastName)"
  }
}

extension Person2: Equatable {
//    static func < (lhs: Person2, rhs: Person2) -> Bool {
//        if lhs.firstName == rhs.firstName {
//            return lhs.lastName < rhs.lastName
//        }
//        return lhs.firstName < rhs.firstName
//    }

    static func == (lhs: Person2, rhs: Person2) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
}


let john2 = Person2(firstName: "J", lastName: "Appleseed")

let johna = Person2(firstName: "J", lastName: "ZZ")

//johna < john2
//print(memberOf(person: john2, group: array))
let arry = [john2, johna]
arry.contains( Person2(firstName: "J", lastName: "wer"))
arry.starts(with: [johna]) // true

print(arry)


let teamA = Record(wins: 14, losses: 11)
let teamB = Record(wins: 23, losses: 8)
let teamC = Record(wins: 23, losses: 9)
var leagueRecords = [teamA, teamB, teamC]

leagueRecords.sort()
// {wins 14, losses 11}
// {wins 23, losses 9}
// {wins 23, losses 8}
leagueRecords.max() // {wins 23, losses 8}
leagueRecords.min() // {wins 14, losses 11}
leagueRecords.starts(with: [teamA, teamC]) // true
leagueRecords.contains(Record(wins: 100, losses: 100)) // true


protocol fed {
    func fedAnimal()
}

extension fed {
//    func fedAnimal() {
//        print("fedAnimal")
//    }
}

protocol cager {
    func cageIt()
}

extension cager {
    func cageIt() {
        print("cage it")
    }
}


struct Dog: fed {
    func fedAnimal() {
        print("cage it")
    }
}

struct Cat: fed {
    func fedAnimal() {
        print("cage it")
    }
}

struct Fish: fed {
    func fedAnimal() {
        print("cage it")
    }
}

struct Birds: fed {
    func fedAnimal() {
        print("cage it")
    }
}


protocol Vehicle {
  func accelerate()
  func stop()
}

class UniCycle: Vehicle {
    func accelerate() {
        <#code#>
    }
    
    func stop() {
        <#code#>
    }
    
    
}

struct Car: Vehicle {
    func accelerate() {
        <#code#>
    }
    
    func stop() {
        <#code#>
    }
    
    
}


enum Direction {
  case left
  case right
}

protocol DirectionalVehicle {
  func accelerate()
  func stop()
  func turn(_ direction: Direction)
  func description() -> String
}

protocol VehicleProperties {
  var weight: Int { get }
  var name: String { get set }
}

protocol Account {
  var value: Double { get set }
  init(initialAmount: Double)
  init?(transferAccount: Account)
}

class BitcoinAccount: Account {
  var value: Double
  required init(initialAmount: Double) {
    value = initialAmount
  }
  required init?(transferAccount: Account) {
    guard transferAccount.value > 0.0 else {
      return nil
    }
    value = transferAccount.value
  }
}


var accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30.00)
let transferAccount = accountType.init(transferAccount: account)!



// Inherictance:-
protocol WheeledVehicle: Vehicle {
  var numberOfWheels: Int { get }
  var wheelSize: Double { get set }
}



//Execrsise

protocol Area {
    var area: Double { get }
}

struct Rectangle: Area {
    let height: Double
    let width: Double
    var area: Double {
        height * width
    }
}

let rect1 = Rectangle(height: 10, width: 12)
print(rect1.area)


struct Square: Area {
    let side: Double
    
    var area: Double {
        side * side
    }
}

let square1 = Square(side: 10)

let arrayOfShapes:[Area] = [rect1 , square1]

print(arrayOfShapes.map{ $0.area })

// Property implementation on Protocol:-

class Bike: WheeledVehicle {

  var numberOfWheels = 2 // get only property  in WheeledVehicle
  var wheelSize = 16.0  // get & set property  in WheeledVehicle

  var peddling = false
  var brakesApplied = false

  func accelerate() {
    peddling = true
    brakesApplied = false
  }

  func stop() {
    peddling = false
    brakesApplied = true
  }
}

let bike = Bike()


