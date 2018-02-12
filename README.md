# Generic-NSCache
## A generic NSCache that you can use without the headache of Optionals

### Usage

create an instance of cache manager and save your file , here i am using UIImage as the object type you can use whatever type you want just make sure your type is a subclass of AnyObject

```
let cacheManager = GenericCache<UIImage>()
cacheManager.saveObject(obj1: image, name: unwrappedFilename)
```

thats it !! your file is saved

now to retrieve it

```
cacheManager.fetchObject(name: unwrappedFilename)
```

#### Note:-
i know you will get an optional UIImage and that you have to check for an optional but i have reduced a type cast and moreover 
UIImageView takes an optional uiimage so you dont even need this cast. :p
