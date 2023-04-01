
import Foundation

protocol Greetable {
  func greet() -> String
}

//extension Greetable {
//  func greet() -> String {
//    return "Hello"
//  }
//}
//
//struct GermanGreeter: Greetable {
//}
//
//let greeter = GermanGreeter()
//print(greeter.greet())

// prints:- Hello
//**************************
/**As expected, because GermanGreeter doesn’t implement its own greet method, the line above prints out “Hello”. The way this works is that the default greet implementation is copied to every type that conforms to the protocol and added to their protocol witness table. Note that the protocol itself doesn’t have a table. Only concrete types do.*/

/*
 Your greeting is obviously wrong. Translate it to German by implementing the method inside GermanGreeter:
**/

//vesrion 2 of GermanGreeter

//struct GermanGreeter: Greetable {
//    func greet() -> String {
//        return "Hallo"
//    }
//}
//
//let greeter = GermanGreeter()
//print(greeter.greet())

// o/p => Hallo
//**************************

/*So far, everything works as expected, right? Now, try to create something unexpected. Add a new method in the protocol extension:
 */
// v2 of extension Greetable

extension Greetable {
    func greet() -> String {
    return "Hello"
    }

    func leave() -> String {
      return "Bye"
    }
}

//v3 struct Greetable:-
//print(greeter.leave())
// o/p ==> "Bye"

//**************************
/**As expected, this outputs “Bye”. Translate this again by adding a new method in GermanGreeter:
*/
// v3 of GermanGreeter:-
struct GermanGreeter: Greetable {
    func greet() -> String {
        return "Hallo"
    }
    
    func leave() -> String {
      return "Tschüss"
    }
}
//let greeter = GermanGreeter()
//
//print(greeter.leave())

// o/p ==>  Tschüss

//However, if you change the declaration of greeter to use the protocol:
let greeter: Greetable = GermanGreeter()

print(greeter.leave())

// o/p ==>>  Bye

//Swift seems to entirely bypass the function you declared in the struct and calls the function from the protocol extension

/*Indeed, extension methods rely entirely on static dispatch.
There is no table involved in calling leave — Swift calls it statically on the variable’s type.

 -"greet" works as expected because by adding it to the protocol’s requirements, you forced Swift to create a protocol witness table entry for the method, enabling dynamic dispatch.
 
 -This is important because adding extension methods to protocols is quite common in Swift. It’s a great way to add additional reusable functionality to your structs and classes. But always keep in mind that if you ever want to override the extension method, you need to add it as a protocol requirement. Otherwise, you might end up with very unexpected results.
*/

//*****
// Synthesized protocol conformance
//***

/*
 If you’ve used Swift for a while, maybe you’ve noticed that there are some protocols like Codable that magically work as soon as you conform to them. This happens when Swift generates a synthesized protocol implementation for you.
 
 -Swift does this for Equatable, Hashable, Comparable and the two Codable protocols: Encodable and Decodable.

- Usually, Swift can generate conformance to a protocol only if all your properties also conform to that protocol. In the case of Hashable, for instance, all your properties need to be hashable for Swift to synthesize the required methods.
 */
struct User: Hashable {
  let name: String
  let email: String
  let id: UUID
}

//If you add a property that isn’t itself Hashable, Swift will complain and you’ll need to add your implementation.


// Equatable protocol :-
// In Swift, an Equatable is a protocol that allows two objects to be compared using the == operator. The hashValue is used to compare two instances.

// To use the hashValue, we first have to conform (associate) the type (struct, class, etc) to Hashable property. For example,

struct Employee: Equatable {
    var name: String
}

let obj1 = Employee(name: "Sabby")
let obj2 = Employee(name: "Sabby")

// compare obj1 and obj2
if obj1 == obj2 {
    print("obj1 and obj2 are equal")
}
else {
    print("obj1 and obj2 are not equal")
}

//Equatable Function:-

//In the above example, we have compared all the properties of the struct.
//
//However, sometimes we may want to compare selective properties of the type. In this case, we may use the equatable function inside the type. For example,

//static func == (lhs: Employee, rhs: Employee) -> Bool {
//    return lhs.salary == rhs.salary
//}

//Here, lhs.salary == rhs.salary will only compare the salary property of two given objects.

// Swift Hashable :-

/*In Swift, a Hashable is a protocol that provides a hashValue to our object. The hashValue is used to compare two instances.
 
 To use the hashValue, we first have to conform (associate) the type (struct, class, etc) to Hashable property. For example,

*/
//struct Employee1: Hashable {
//
//}

/*
 Here, we have conformed the Employee struct to the Hashable protocol.

 Now when we create instances of Employee, the protocol will provide hash values to the instances.
 */

//E.g
struct Employee1: Hashable {
  var name: String
}

let object1 = Employee1(name: "Sabby")
let object2 = Employee1(name: "Smith")

// print hash values
print(object1.hashValue)
print(object2.hashValue)

// o/p 754256748862435114
//     -6408043519205941253


//Compare Instances using Hashable Protocol
 
// conform Employee to Hashable
struct Employee2: Hashable {
    
    var name: String
    var salary: Int
}

// initialize two objects with different property values
let obj11 = Employee2(name: "Sabby", salary: 40000)
let obj21 = Employee2(name: "Cathy", salary: 30000)

print("Different hash value: ")
print(obj11.hashValue)
print(obj21.hashValue)

// initialize two objects with same property values
let obj31 = Employee2(name: "Lanny", salary: 50000)
let obj41 = Employee2(name: "Lanny", salary: 50000)

print("\nSame hash value: ")
print(obj31.hashValue)
print(obj41.hashValue)

/*
 Same hash value:
 -4550201890255535959
 -4550201890255535959
 **/

//In the above example, we have created a struct named Employee that conforms to the Hashable protocol.
//
//We have created two objects obj1 and obj2.
//
//let obj1 = Employee(name: "Sabby", salary: 40000)
//let obj2 = Employee(name: "Cathy", salary: 30000)
//Here, both instances have different values for properties name and salary. That's why hash values for obj1 and obj2 are different.


// Hash Function and Combine

/*
 In the above example, we have compared all the properties of the struct.

 However, sometimes we may want to compare selective properties of the type. In this case, we may use the hash function inside the type. For example,

 func hash(into hasher: inout Hasher) {
   hasher.combine(name)
 }
 
 Here, the hash() function uses hasher.combine() to specify the property that we want to compare.
 */


struct Employee3: Hashable {
  
 var name: String
 var salary: Int

 // create a hash() function to only compare  age property
 func hash(into hasher: inout Hasher) {
   hasher.combine(name)
 }

}

// initialize two objects with different values for salary property
let obj13 = Employee3(name: "Sabby", salary: 349879)
let obj23 = Employee3(name: "Sabby", salary: 123334)

print(obj13.hashValue)
print(obj23.hashValue)

// o/p :- for    hasher.combine(salary) if same salary ==> Hash value will be different.

// o/p :- for    hasher.combine(name) if same salary ==> Hash value will be same.
