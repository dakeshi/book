import Foundation


// MARK: - DataConvertible

protocol DataConvertible {
    
    func toData() -> NSData!
    init?(fromData data: NSData)
    
}

extension DataConvertible where Self:DictionaryConvertible {
    
    func toData() -> NSData! {
        return NSKeyedArchiver.archivedDataWithRootObject(self.toDict())
    }
    
    init?(fromData data: NSData) {
        if let dictionary = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? Dictionary {
            self = dictionary
        }
        return nil
    }
    
}


// MARK: - Dictionary extension (DataConvertible)

extension Dictionary: DataConvertible {
    
    func toData() -> NSData! {
        return NSKeyedArchiver.archivedDataWithRootObject(self as! AnyObject)
    }
    
    init?(fromData data: NSData) {
        if let dictionary = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? Dictionary {
            self = dictionary
        }
        return nil
    }
    
}


// MARK: - String extension (DataConvertible)

extension String: DataConvertible {
    
    func toData() -> NSData! {
        return self.dataUsingEncoding(NSUTF8StringEncoding)
    }
    
    init?(fromData data: NSData) {
        if let string = String(data: data, encoding: NSUTF8StringEncoding) {
            self = string
        }
        return nil
    }
    
}