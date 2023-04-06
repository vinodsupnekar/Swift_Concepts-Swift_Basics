//ch 5. Functions
//***** Overloading :- Functions can have the same name with different parameters. This is called overloading.

//func printMultipleOf(multiplier: Int, andValue: Int)
//func printMultipleOf(multiplier: Int, and value: Int)
//func printMultipleOf(_ multiplier: Int, and value: Int)
//func printMultipleOf(_ multiplier: Int, _ value: Int)

//This is called overloading and lets you define similar functions using a single name.

//This is usually achieved through a difference in the parameter list:
//
//A different number of parameters.
//Different parameter types.
//Different external parameter names, such as the case with printMultipleOf.



func infiniteLoop() -> Never {
  while true {
  }
}

/// Calculates the average of three values
/// - Parameters:
///   - a: The first value.
///   - b: The second value.
///   - c: The third value.
/// - Returns: The average of the three values.
func calculateAverage(of a: Double, and b: Double, and c: Double) -> Double {
  let total = a + b + c
  let average = total / 3
  return average
}
calculateAverage(of: 1, and: 3, and: 5)


//Key points
//You use a function to define a task that you can execute as many times as you like without writing the code multiple times.
//Functions can take zero or more parameters and optionally return a value.
//You can add an external name to a function parameter to change the label you use in a function call, or you can use an underscore to denote no label.
//Parameters are passed as constants, unless you mark them as inout, in which case they are copied-in and copied-out.
//Functions can have the same name with different parameters. This is called overloading.
//Functions can have a special Never return type to inform Swift that this function will never exit.
//You can assign functions to variables and pass them to other functions.
//Strive to create functions that are clearly named and have one job with repeatable inputs and outputs.
//Function documentation can be created by prefixing the function with a comment section using ///.



// Mini Exersize
let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

struct Calender {
   
    
    var month: String
    
    var monthsUntilWinterBreak: Int {
        months.firstIndex(of: "December")! -
            months.firstIndex(of: self.month)!
    }
}

var cal = Calender(month: "February")
cal.monthsUntilWinterBreak

//Introducing initializers

 //Initializers are special methods you call to create a new instance. They omit the func keyword and even a name, and instead, they use init. An initializer can have parameters, but it doesn’t have to.


struct SimpleDate {
  // 1
  var month = "January"
  var day = 1
  
  //2
  
  func monthsUntilWinterBreak() -> Int {
    months.firstIndex(of: "December")! -
    months.firstIndex(of: month)!
  }
    
    //3
    mutating func advance() {
      day = day % 12 + 1
    }

}

//Here’s what’s happening in that code:
//
//Both properties now have an assignment with a reasonable default value: January 1st.
//Both initializers, init() and init(month:day:) have been removed. …Look ma’, no initializers!
//Even though the initalizers are gone, you can still use both initializer styles:

let newYearsDay = SimpleDate() // As all var have default value, this empty initialisez is called
newYearsDay.month // January
newYearsDay.day // 1

let valentinesDay = SimpleDate(month: "February", day: 14)
valentinesDay.month // February
valentinesDay.day // 14

///Introducing mutating methods

//Methods in structures cannot change the values of the instance without being marked as mutating. You can imagine a method in the SimpleDate structure that advances to the next day:



// Keeping the compiler-generated initializer using extensions

//With the SimpleDate structure, you saw that once you added your own init(), the compiler-generated memberwise initializer disappeared. It turns out that you can keep both if you add your init() to an extension to SimpleDate:

struct SimpleDate2 {
  var month = "January"
  var day = 1
    
  
  func monthsUntilWinterBreak() -> Int {
    months.firstIndex(of: "December")! -
    months.firstIndex(of: month)!
  }
  
  mutating func advance() {
    day += 1
  }
}

extension SimpleDate2 {
  init(month: Int, day: Int) {
    self.month = months[month-1]
    self.day = day
  }
}

let date1 = SimpleDate2(month: "May", day: 10)

let date2 = SimpleDate2(month: 12, day: 25)



// mini exersise

struct Circle {
  
  var radius = 0.0

  var area: Double {
    get {
     radius * radius
    }
    set {
        radius += newValue
    }
  }

    mutating func grow(byFactor ft: Double) {
        area = ft
    }
}

var crl = Circle()
crl.radius = 10
crl.area
crl.area = 5
crl.area



//Key points
//Methods are functions associated with a type.
//Methods are the behaviors that define the functionality of a type.
//A method can access the data of an instance by using the keyword self.
//Initializers create new instances of a type. They look a lot like methods that are called init with no return value.
//A type method adds behavior to a type instead of the instances of that type. To define a type method, you prefix it with the static modifier.
//You can open an existing structure and add methods, initializers and computed properties to it by using an extension.
//By adding your own initializers in extensions, you can keep the compiler’s member-wise initializer for a structure.
//Methods can exist in all the named types — structures, classes and enumerations.
