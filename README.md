# Generic-NSCache
### A generic NSCache

#### Usage

create an instance of GenericMemoryCache and save your file

```
private let imageCache = GenericInMemoryCache<String, UIImage>()
imageCache[identifier] = image // identifier is the url of the image or anything that conforms to hashable
```

thats it !! your file is saved

now to retrieve it

```
let cachedImage = imageCache[identifier] 
```

#### Note:-
This cache takes can store any custom object as its value. Moreover it can also store any key as its value provided it confirms to AnyHashable.
I have also implemented NSDiscardableContent so as to prevent its value from being purged on moving to the background.
