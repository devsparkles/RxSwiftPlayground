
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
import RxSwift


exampleOf(description: "just"){
    let observable = Observable.just("Hello, World")
    observable.subscribe { (event: Event<String>) in
        print(event)
    }
}


exampleOf(description: "just"){
    let observable = Observable.just("Hello, World")
    observable.subscribe { (event: Event<String>) in
        print(event)
    }
}
