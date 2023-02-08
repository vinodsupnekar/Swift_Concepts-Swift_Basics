
//var x : String? = "Test"
//let a: String = x!
//
//if case let a? = x {
//  print(a)
//}

//1. Example
let capitals = ["Paris", "Rome", nil, "Madrid"]
for  capital in capitals {
    print(capital)
}
//o/p:-
/*Optional("Paris")
 Optional("Rome")
 nil
 Optional("Madrid")*/

//With optional pattern:-
for case let capital? in capitals {
    print(capital)
}
//o/p:-
/*Paris
 Rome
 Madrid*/

//2.Example of basic optinal switch:-
let capital: String? = "London"
switch capital {
case .none:
    print("value is nil")
case let capital?:
    print("value is \(capital)")
}
// value is London

//Above code can we made more redable/easy to use using optional patterns:-
switch capital {
case .none:
    print("value is nil")
case let capital?:
    print("value is \(capital)")
}

// value is London


public class ThermometerClass {
  private(set) var temperature: Double = 0.0
  public func registerTemperature(_ temperature: Double) {
    self.temperature = temperature
  }
}

let thermometerClass = ThermometerClass()
thermometerClass.registerTemperature(56.0)

public struct ThermometerStruct {
    private(set) var temperature: Double = 0.0
  public mutating func registerTemperature(_ temperature: Double) {
    self.temperature = temperature
  }
}

//let thermometerStruct = ThermometerStruct()
//thermometerStruct.registerTemperature(55)
// Above let thermometerStruct gives compiler error as it cannot be modified as class let variable.
//To fix this make thermometerStruct as var


//*****
//Closure uses variavle inside caprute list, copies it.
//var thing = "cars"
//
//let closure = { [thing] in
//  print("I love \(thing)")
//}
//
//thing = "airplanes"

//closure()

//o/p = I love cars

//Closure without capture list stores reference to a variable.
var thing = "cars"

let closure = {
  print("I love \(thing)")
}

thing = "airplanes"

closure() // Prints: "I love airplanes"


