
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
import RxSwift
import RxCocoa

/*
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



exampleOf(description: "distinctUntilChanged"){
    let disposeBag = DisposeBag()
    let searchString = Variable("")
    
    
    searchString.asObservable()
        .map{$0.lowercased()}
    .distinctUntilChanged()
        .subscribe(onNext: {
            print($0)
        }).addDisposableTo(disposeBag)
    
    searchString.value = "APPLE"
    searchString.value = "apple"
    searchString.value = "Banana"
    searchString.value = "APPLE"

}




exampleOf(description: "takeWhile"){
    let disposeBag = DisposeBag()
    let numbers = Observable.of(1, 2, 3, 4, 3, 2, 1)
    
    numbers.takeWhile{ $0 < 4 }
        .subscribe(onNext: {
            print($0)
        }).addDisposableTo(disposeBag)
    
}






exampleOf(description: "startWith"){
    let disposeBag = DisposeBag()
    
    Observable.of("1", "2", "3")
        .startWith("A")
        .startWith("B")
        .startWith("C","D")
        .subscribe(onNext: {
            print($0)
        })
        .addDisposableTo(disposeBag)
    
}
*/

exampleOf(description: "merge"){
    
    let disposeBag = DisposeBag()
    
    let subject1 = PublishSubject<String>()
    let subject2 = PublishSubject<String>()
    
    
    Observable.of(subject1,subject2)
    .merge()
        .subscribe(onNext: {
            print($0)
        })
    
    
    subject1.onNext("A")
    subject1.onNext("B")

    
    subject2.onNext("1")
    subject2.onNext("2")
    
    subject1.onNext("C")
    subject2.onNext("3")
}



exampleOf(description: "zip") {
    
    let disposeBag = DisposeBag()
    
    let stringSubject =    PublishSubject<String>()
    let intSubject =    PublishSubject<Int>()
    
    
    Observable.zip(stringSubject,intSubject) { stringElement, intElement in
        "\(stringElement) \(intElement)"
    }
    .subscribe(onNext: { print($0)})
  //  .addDisposableTo(disposeBag)
    
    
    stringSubject.onNext("A")
    stringSubject.onNext("B")
    
    intSubject.onNext(1)
    intSubject.onNext(3)
    intSubject.onNext(4)
    
    
    stringSubject.onNext("c")

}









