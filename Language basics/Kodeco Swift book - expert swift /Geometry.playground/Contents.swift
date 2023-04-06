import Foundation
import UIKit
//struct StructPoint {
//  var x, y: Double
//
//}
//
//extension StructPoint {
//    init(_ dict: [String: Any]) {
//        self.init(x: 10, y: 20)
//    }
//}
//
//class ClassPoint {
//  var x, y: Double
//  init(x: Double, y: Double) { (self.x, self.y) = (x, y) }
//}
//
//let str = StructPoint(["": 100])

//
//func fibonnacci(_ n: Int) {
//    var i = 0
//    var j = 1
////    print(i)
//    print(j)
//    var counter = 1
//    var sum = 0
//    while counter < n {
//        sum = i + j
//        print( sum)
//        i = j
//        j = sum
//        counter += 1
//    }
//}
//
//fibonnacci(6)

//0 1 1 2 3
//j 1 2 3
//i 1 1 2

let myStringVariable = "25"

let myIntVar = Int(myStringVariable)

print(myIntVar ?? 0)

let myStringvariable = "ejeej"

let myIntegervariable = Int(myStringvariable) ?? 0

print(myIntegervariable as Any )


let myString: NSString = "25"

print(myString )

let mm = myString.integerValue

print(mm)

print((25).truncatingRemainder(dividingBy: 10))

let kk = 2 << 3
print(kk)

let pp = 300 * 10 / 5 + 2
print(pp)

var variableNumber = 1_000_000
print(variableNumber)

//Type and Operations:-

// 1. Implicit converion is not allowed
var integer: Int = 100
var decimal: Double = 12.5
integer = Int(decimal) // manually specify the Int here



let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
let totalCost: Double = hourlyRate * Double(hoursWorked)

// Character and Strings.
let characterA: Character = "a"

let stringDog: String = "gss"
//The right-hand side of this expression is what’s known as a string literal; it’s the Swift syntax for representing a string.


var message = "Hello" + " my name is "
let name = "Lorenzo"
message += name // "Hello my name is Lorenzo"


let exclamationMark: Character = "!"
message += String(exclamationMark) // "Hello my name is Lorenzo!"


// Int
//An Int is represented with 64-bits on most modern hardware and with 32-bits on older — or more resource-constrained — systems.

//For whole numbers, you can use the explicit signed types Int8, Int16, Int32 and Int64. These types consume 1, 2, 4 and 8 bytes of storage, respectively. Each of these types use 1-bit to represent the sign.

//If you are only dealing with non-negative values, there are a set of explicit unsigned types that you can use. These include UInt8, UInt16, UInt32 and UInt64. While you cannot represent negative values with these, the extra 1-bit lets you represent values that are twice as big as their signed counterparts.

let range: ClosedRange = 0...10
let range2: ClosedRange = 11...20

print(range.first!) // 0
print(range.last!) // 10

let chosenNumber = 3
if 0..<10 ~= chosenNumber {
    print("\(chosenNumber) is a single digit.")
}

let range1: Range = 0..<10
print(range1.first!) // 0
print(range1.last!) // 9
///     // Prints "3 is a single digit."

let names = ["Antoine", "Maaike", "Jaap"]
let range3: CountableClosedRange = 0...2
print(names[0...]) // ["Antoine", "Maaike", "Jaap"]


//let neededNames = 2
//var collectedNames: [String] = []
//for index in 0... {
//    guard collectedNames.count != neededNames else { break }
//    collectedNames.append(names[index])
//}
//print(collectedNames)

//let title = "A Swift Blog"
//let range11 = title.range(of: "Swift")!
//let convertedRange = NSRange(range11, in: title)
//let attributedString = NSMutableAttributedString(string: title)
//
//attributedString.setAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], range: convertedRange)
//print(attributedString)

let emojiText = "?launcher"
let endIndex = emojiText.index(emojiText.startIndex, offsetBy: emojiText.count)
let rangeQw: Range<String.Index> = emojiText.startIndex..<endIndex
print(emojiText[rangeQw])


