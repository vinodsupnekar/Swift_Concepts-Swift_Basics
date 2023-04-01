
import Foundation

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}

var aa = SmallRectangle()
aa.height = 15

print("aa \(aa.height)")

@propertyWrapper struct Capitalized {
    private  var _value: String
    
    public var wrappedValue: String {
        set { _value = wrappedValue.capitalized }
        get {
            return _value
        }
    }
    
    

//    init(wrappedValue: String) {
//        self.wrappedValue = wrappedValue.capitalized
//    }
}

@propertyWrapper struct Capitalized2 {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }
    
}

public struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}

// John Appleseed
var user = User(firstName: "john", lastName: "appleseed")

// John Sundell
user.lastName = "sundell"

print("name \(user.lastName)")


// A property’s properties


@propertyWrapper struct UserDefaultsBacked<Value> {
    var wrappedValue: Value {
        get {
            let value = storage.value(forKey: key) as? Value
            return value ?? defaultValue
        }
        set {
            storage.setValue(newValue, forKey: key)
        }
    }

    private let key: String
    private let defaultValue: Value
    private let storage: UserDefaults

    init(wrappedValue defaultValue: Value,
         key: String,
         storage: UserDefaults = .standard) {
        self.defaultValue = defaultValue
        self.key = key
        self.storage = storage
    }
}

extension UserDefaultsBacked where Value: ExpressibleByNilLiteral {
    init(key: String, storage: UserDefaults = .standard) {
        self.init(wrappedValue: nil, key: key, storage: storage)
    }
}

struct SettingsViewModel {
    @UserDefaultsBacked(key: "mark-as-read")
    var autoMarkMessagesAsRead = true

    @UserDefaultsBacked(key: "search-page-size")
    var numberOfSearchResultsPerPage = 20

    @UserDefaultsBacked(key: "signature")
    var messageSignature: String?
}


