
struct StructPoint {
  var x, y: Double
    
}

extension StructPoint {
    init(_ dict: [String: Any]) {
        self.init(x: 10, y: 20)
    }
}

class ClassPoint {
  var x, y: Double
  init(x: Double, y: Double) { (self.x, self.y) = (x, y) }
}

let str = StructPoint(["": 100])

