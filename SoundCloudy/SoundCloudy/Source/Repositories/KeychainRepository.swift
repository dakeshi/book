import Foundation
import KeychainSwift
import RxSwift

class KeychainRepository {
    
    // MARK: - Attributes
    
    private let keychain: KeychainSwift
    
    
    // MARK: - Init
    
    init(keychain: KeychainSwift = KeychainSwift()) {
        self.keychain = keychain
        
    }
    
    
    // MARK: - Public
    
    func rxSet(data: NSData, key: String) -> Observable<Bool> {
        return Observable.create({ (subscriber) -> Disposable in
            let saved = self.keychain.set(data, forKey: key)
            subscriber.onNext(saved)
            subscriber.onCompleted()
            return NopDisposable.instance
        })
    }
    
    func rxGet(key: String) -> Observable<NSData> {
        
    }
    
    
}