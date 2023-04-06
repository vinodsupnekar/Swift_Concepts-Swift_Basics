import Foundation
// Computed properties:-

struct TV {
  var height: Double
  var width: Double
  
  // 1
  var diagonal: Int {
    // 2
    let result = (height * height +
      width * width).squareRoot().rounded()
    // 3
    return Int(result)
  }
}

// This is called read-only computed property.

//It’s also possible to create a read-write computed property with two code blocks: a getter and a setter.

// As the computed property has no place to store a value, the setter usually sets one or more related stored properties indirectly:
struct TV2 {
    var height: Double
    var width: Double
    var diagonal: Int {
      // 1
      get {
        // 2
        let result = (height * height +
          width * width).squareRoot().rounded()
        return Int(result)
      }
      set {
        // 3
        let ratioWidth = 16.0
        let ratioHeight = 9.0
        // 4
        let ratioDiagonal = (ratioWidth * ratioWidth +
          ratioHeight * ratioHeight).squareRoot()
        height = Double(newValue) * ratioHeight / ratioDiagonal
        width = height * ratioWidth / ratioHeight
      }
    }
}

//In addition to setting the height and width directly, you can set them indirectly by setting the diagonal computed property. When you set this value, your setter will calculate and store the height and width.
var tv = TV2(height: 10, width: 20)
tv.diagonal = 70
tv.height // 34.32...
tv.width // 61.01...


//Type properties
//Imagine you’re building a game with many levels. Each level has a few attributes or stored properties:
struct Level {
  let id: Int
  var boss: String
  var unlocked: Bool
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)

//You can use a type property to store the game’s progress as the player unlocks each level. A type property is declared with the modifier static:

struct Level2 {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool
}

//Property observers

//1 On Stored property:-

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newStepValue){
             print("new Values ==> \(newStepValue)")
        }
        didSet(oldStepValue) {
            print("old Value==> \(oldStepValue)")
        }
    }
    
    var totalAvgStepsPerDay: Int {
        get {
            totalSteps / 7
        }
        set(newVal){
            print(newVal)
            totalSteps = newVal * 7
        }
    }
}

let step = StepCounter()
step.totalSteps = 100
print(step.totalAvgStepsPerDay)
step.totalAvgStepsPerDay = 50

step.totalSteps = 199


//Properties Mini-exercise, Lightbulb

struct LightBulb {
    static let maxCurrent = 40
    var isOn = false

    var current = 0 {
        
        willSet {
            if newValue > LightBulb.maxCurrent {
              print("""
                    Current is too high,
                    falling back to previous setting.
                    """)
                isOn = false
            }

        }
        didSet {
          if oldValue > LightBulb.maxCurrent {
          print("""
                  Current is too high,
                  falling back to previous setting.
                  """)
          } else {
            current = oldValue
          }
        }
      }
}

//
//In the light bulb example, the bulb goes back to a successful setting if the current gets too high. In real life, that wouldn’t work. The bulb would burn out!
//
//Your task is to rewrite the structure so that the bulb turns off before the current burns it out.
//
//Hint: You’ll need to use the willSet observer that gets called before value is changed. The value that is about to be set is available in the constant newValue. The trick is that you can’t change this newValue, and it will still be set, so you’ll have to go beyond adding a willSet observer. :]


// Installing a new bulb
var bulb = LightBulb() // Light bulb is off

// Flipping the switch
bulb.isOn = true // Light bulb is ON with 40 amps

// Using the dimmer
bulb.current = 30 // Light bulb is ON with 30 amps

// Using the dimmer to a high value
bulb.current = 50 // Light bulb is OFF

// Flipping the switch
bulb.isOn = true // Light bulb is ON with 30 amps


protocol BulbStateHolder {
    var isBulbActive: Bool { get set}
    var voltage: Int { get set}
}

class Bulb: BulbStateHolder {
    var isBulbActive: Bool
    
    var voltage: Int
    
    init() {
        isBulbActive = true
        voltage = 40
    }
    
    func changeBuldState(_ volt: Int) {
        if volt > 40 {
            isBulbActive = true
        }
    }
}

class BulbController {
    var stateBulb: BulbStateHolder?
    var bulb: Bulb?
    
    func handleBulbState() {
        if let isBulbActive = stateBulb?.isBulbActive, isBulbActive == true {
            // make changes on bulb object
        }
    }
}




//Lazy properties
 //If you have a property that might take some time to calculate, you don’t want to slow things down until you need the property. Say hello to the lazy stored property. It is useful for such things as downloading a user’s profile picture or making a serious calculation.

struct Circle {
    var piFormat = {
       print("format of pi")
    }()
  lazy var pi = {
    ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
  }()
  var radius = 0.0
  var circumference: Double {
    mutating get {
      pi * radius * 2
    }
  }
  init(radius: Double) {
    self.radius = radius
  }
}

//The calculation of pi defers until you need it. Only when you ask for the circumference property is pi calculated and assigned a value.

// You’ve noticed that pi uses a { }() self-executing closure pattern to calculate its value, even though it’s a stored property.

let pi = Circle(radius: 10)


struct IceCream {
    let name: String
    lazy var ingredients: [String] = {
      ["asas", "erf"]
    }()
}
struct Car {
  let make: String
  let color: String
    let FuelTank: String
}

struct FuelTank {
    var level: Double {
        willSet {
            if newValue < 0.1 {
                lowFuel = !lowFuel
            } else {
                lowFuel = false
            }
        }
        didSet {
            if oldValue > 1 {
                level = 1
            } else if oldValue < 0 {
                level = 0
            }
        }
        
        
    } // decimal percentage between 0 and 1
    var lowFuel: Bool
    
}

var fuleTank = FuelTank(level: -1, lowFuel: false)
fuleTank.level // -1 , oberver is not called when initialisation
fuleTank.level = 100 // here observer is called
fuleTank.level         // Now the values = 0


