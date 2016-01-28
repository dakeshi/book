import Foundation

// MARK: - DictionaryConvertible

protocol DictionaryConvertible {
    func toDict() -> [NSObject: AnyObject]
    init?(fromDict dictionary: [NSObject: AnyObject])
}