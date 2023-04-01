
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
