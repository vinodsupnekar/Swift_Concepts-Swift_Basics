import Combine
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

let subscription = Timer.publish(every: 0.1, on: .main, in: .common)
    .autoconnect()
    .print("stream")
    .throttle(for: .seconds(1), scheduler: DispatchQueue.main, latest: true)
    .sink { (output) in
        print("finished stream in with output \(output)")
    } receiveValue: { value in
        print("received Values \(value)")
    }

RunLoop.main.schedule(after: .init(Date(timeIntervalSinceNow: 5))) {
    print("-- cancel subscription")
    subscription.cancel()
}

