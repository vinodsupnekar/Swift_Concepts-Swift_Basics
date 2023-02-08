
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
