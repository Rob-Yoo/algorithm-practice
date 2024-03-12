import Foundation

typealias ConvertInfo = (word: String, convertedCount: Int)

struct Queue {
    var array = [ConvertInfo?]()
    var head = 0
    
    var count: Int { return array.count - head }
    var isEmpty: Bool { return count == 0 }
    
    mutating func enqueue(_ element: ConvertInfo) {
        self.array.append(element)
    }
    
    mutating func dequeue() -> ConvertInfo? {
        guard !self.isEmpty, let element = array[head] else {
            return nil
        }
        
        array[head] = nil
        head += 1
        
        if (head > 50) {
            self.array.removeFirst(head)
            head = 0
        }
        
        return element
    }
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var result = Int.max
    var queue = Queue()
    var visited = Array(repeating: false, count: words.count)
    
    queue.enqueue((word: begin, convertedCount: 0))
    while(!queue.isEmpty) {
        let (word, convertedCount) = queue.dequeue()!

        if (word == target) {
            result = min(convertedCount, result)
            continue
        }
        
        for i in 0..<words.count {
            if(!visited[i] && isConvertable(word, words[i])) {
                visited[i] = true
                queue.enqueue((word: words[i], convertedCount: convertedCount + 1))
            }
        }
    }
    
    if (result == Int.max) { result = 0 }
    
    return result
}

func isConvertable(_ from: String, _ to: String) -> Bool {
    var cnt = 0

    for (f, t) in zip(from, to) {
        if (f != t) {
            cnt += 1
        }
    }
    
    if (cnt == 1) {
        return true
    }
    
    return false
}