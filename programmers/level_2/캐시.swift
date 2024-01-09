func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache = [String]()
    var time = 0
    
    if (cacheSize == 0) {
        return 5 * cities.count
    }
    
    for city in cities.map { $0.lowercased() } {
        if let idx = cache.firstIndex(of: city) {
            cache.remove(at: idx)
            cache.append(city)
            time += 1
        } else {
            if (cache.count == cacheSize) {
                cache.removeFirst()
            }
            cache.append(city)
            time += 5
        }
    }
    
    return time
}