
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
import RxSwift


exampleOf(description: "just"){
    let observable = Observable.just("Hello, World")
    observable.subscribe { (event: Event<String>) in
        print(event)
    }
}


exampleOf(description: "of"){
     let observable = Observable.of(1, 2, 3)
    
    observable.subscribe {
        print($0)
    }
    observable.subscribe {
        print($0)
    }
}


exampleOf(description: "toObservable"){
    let disposeBag = DisposeBag()
    let subscription: Disposable
    var array: Variable<[Int]> = Variable([1, 2, 3])
    array.asObservable()
        .subscribe(onNext: {
            print($0)
            }
            
    )
    .addDisposableTo(disposeBag)
    
    
}
