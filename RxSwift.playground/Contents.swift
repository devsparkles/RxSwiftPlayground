
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
import RxSwift
import RxCocoa

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
    let array: Variable<[Int]> = Variable([1, 2, 3])
    array.asObservable()
        .subscribe(onNext: {
            print($0)
            }
            
    )
    .addDisposableTo(disposeBag)
    
    
}

exampleOf(description: "filter"){
    let disposeBag =  DisposeBag()
    let numbers = Observable.generate(initialState: 1, condition: { $0 < 101 }, iterate: {$0 + 1 })
    
    numbers.filter({ (number) -> Bool in
        guard number > 1 else { return false }
        var isPrime = true
        
        (2..<number).forEach {
            if number % $0 == 0 {
                isPrime = false
            }
        }
        return isPrime
    }).toArray()
        .subscribe(onNext: { (ee) in
            print(ee)
        }, onError: { (err) in
            print(err)
        }, onCompleted: {
            print("#line  -> filter : onCompleted")
        }, onDisposed: {
         print("#line  -> filter : onDisposed")
        })
    
}




