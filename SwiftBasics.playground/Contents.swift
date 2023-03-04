
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


//struct TestStruct {
//   var someWhere: Int
//
//   init(dict: [String: Int]) {
//    self.init(someVarible: dict[“someVar”]!)
//   }
//}


//struct TestStruct {
//    var someWhere: Int
//}
//
//extension TestStruct {
//    init(dict: [String: Int]) {
//        self.init(someWhere : dict ["someVar"]! )
//    }
//}


//struct TestStruct {
//    var someWhere: Int
//    var dict: [String: Int]
//    init(_ someWhere:Int, _ dict: [String: Int])
//    { self.init(someWhere, dict)
//    }
//}

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

let a = [1...100]
print(a)
//
//class Solution {
//    func firstBadVersion(_ n: Int) -> Int {
//        let a = [1...n]
//        return getBadVersion(a, 0, n-1)
//    }
//
//    func getBadVersion(a:[Int] ,left: Int, right: Int) -> Int {
//        let middle = left + (right - left)/2
//        if left > right {
//            return -1
//        } else if isBadVersion(a[middle]) {
//            //check if its previous version is also bad, if yes then return , else call api.
//            let middlePreviousOne = middle - 1
//            if middlePreviousOne >= 0 {
//               if isBadVersion(a[middlePreviousOne]) {
//                   return middle
//               } else {
//                    getBadVersion(a, left,middle - 1)
//               }
//            }
//        } else {
//            getBadVersion(a, middle + 1, right)
//        }
//
//    }
//}
