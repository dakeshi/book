import Foundation
import UIKit
import RxSwift

let observable: Observable<String> = Observable.create { (observable) -> Disposable in
    observable.onNext("ola k ase")
    return NopDisposable.instance
}

observable.subscribeNext { (next) -> Void in
}

