import UIKit
import XCTest

var str = "Hello, playground"

class ControlFlow {
static func removeSpecificCharacters(_ charString: String) -> String{
    let charactersToRemove: [Character] = ["a", "e", "i", "o", "u"]
    var filteredString = ""
    for character in charString {
        if charactersToRemove.contains(character) {
            continue
        }
        filteredString.append(character)
    }
    return filteredString
}
}

class ControlFlowTests: XCTestCase {
    func test_removeCharaters_doesNotRemoveCharacterWhenNotAVowels() {
        let input = "sd"
        let str = ControlFlow.removeSpecificCharacters(input)
        print("str, \(str)")
        XCTAssertEqual(str, input)
    }
    
    func test_removeCharaters_doesRemoveAllVowelCharacters() {
        let input = "asdieou"
        let str = ControlFlow.removeSpecificCharacters(input)
        print("str, \(str)")
        XCTAssertEqual(str, "sd")
    }
    
}


//ControlFlowTests.defaultTestSuite.run()



class SwicthControlFlow {
    func breakInSwitch(_ numberSymbol: Character) -> Int {
//        let numberSymbol: Character = "三"  // Chinese symbol for the number 3
        var possibleIntegerValue: Int?
        switch numberSymbol {
        case "1", "١", "一", "๑":
            possibleIntegerValue = 1
        case "2", "٢", "二", "๒":
            possibleIntegerValue = 2
        case "3", "٣", "三", "๓":
            possibleIntegerValue = 3
        case "4", "٤", "四", "๔":
            possibleIntegerValue = 4
        default:
            break
        }
        return possibleIntegerValue ?? -1
    }
}

class SwicthControlFlowTests: XCTestCase {

    func test_breakDoesNotStopExecution() {
        let numberSymbolToConvert: Character = "S"
        let possibleIntegerValue = -1
        let sut = SwicthControlFlow()
        let convertedValue = sut.breakInSwitch(numberSymbolToConvert)
        XCTAssertEqual(possibleIntegerValue, convertedValue)
        
    }
    
    func test_breakStopExecutionForAllCases() {
        let possibleIntegerValues:[Int] = [1,2,3,4]
        ["一","二", "三","四"].enumerated().forEach { (index,str) in
            let sut = SwicthControlFlow()
            let convertedValue = sut.breakInSwitch(Character(str))
            XCTAssertEqual(possibleIntegerValues[index], convertedValue)
        }
    }
    
    func test_breakDoesStopExecutionForMultipleInputs() {
        let possibleIntegerValues:[Int] = [-1,-1,-1,-1]
        ["100","-1", "0","5"].enumerated().forEach { (index,str) in
            let sut = SwicthControlFlow()
            let convertedValue = sut.breakInSwitch(Character(str))
            XCTAssertEqual(possibleIntegerValues[index], convertedValue)
        }
    }
}

var strWithChar = "ass"
var exclamationMark: Character = Character(String("a"))
strWithChar.append(exclamationMark)
var ss = String(exclamationMark)
ss.append(strWithChar)

//SwicthControlFlowTests.defaultTestSuite.run()



func iterateOnChar(_ str: String) {
var startIndex = str.startIndex
var endIndex = str.endIndex

while startIndex < endIndex {
    endIndex = str.index(before: endIndex)
    print("char at index \(str[startIndex])  char at end Index \(str[endIndex])")
    startIndex = str.index(after: startIndex)
}
}
iterateOnChar("abc")


let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
