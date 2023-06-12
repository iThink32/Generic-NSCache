import Foundation

final class CacheableKey<T: Hashable>: NSObject{
    let value: T
    init(value: T){
        self.value = value
    }
    
    override var hash: Int{
        return self.value.hashValue
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let castedValue = object as? CacheableKey<T> else{
            return false
        }
        return castedValue.value == self.value
    }
}

final class CacheableValue<T>: NSDiscardableContent{
    let value: T
    private var accessCounter = true
    init(value: T){
        self.value = value
    }
    
    func beginContentAccess() -> Bool{
        return self.accessCounter
    }

    func endContentAccess(){
        self.accessCounter = false
    }

    func discardContentIfPossible(){
        
    }

    func isContentDiscarded() -> Bool{
        return self.accessCounter == false
    }
}

final class GenericInMemoryCache<T: Hashable,V>{
    private let cache = NSCache<CacheableKey<T>, CacheableValue<V>>()
    
    subscript(key: T) -> V?{
        set{
            guard let unwrappedValue = newValue else{
                return
            }
            let value = CacheableValue(value: unwrappedValue)
            let key = CacheableKey(value: key)
            self.cache.setObject(value, forKey: key)
        }
        get{
            let key = CacheableKey(value: key)
            guard let reqdValue: CacheableValue<V> = self.cache.object(forKey: key) else{
                return nil
            }
            return reqdValue.value
        }
    }
}
