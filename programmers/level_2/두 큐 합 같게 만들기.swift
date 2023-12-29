import Foundation

extension Int64 {
    var isOdd: Bool { return self % 2 != 0 }
}

struct Queue {
    private var queue: [Int?] = []
    private var head: Int = 0
    
    var sum: Int64 = 0
    var count: Int { return queue.count - head }
    var isEmpty: Bool { return count == 0 }
    
    mutating func enqueue(_ element: Int) {
        queue.append(element)
        sum += Int64(element)
    }
    
    mutating func dequeue() -> Int? {
        guard !isEmpty, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1

        if head > 50 {
          queue.removeFirst(head)
          head = 0
        }

        sum -= Int64(element)
        return element
    }
}

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var q1 = Queue()
    var q2 = Queue()
    var result = 0

    queue1.forEach { q1.enqueue($0) }
    queue2.forEach { q2.enqueue($0) }
    if ((q1.sum + q2.sum).isOdd) { return -1 }
    while (q1.sum != q2.sum) {
        if (q1.isEmpty || q2.isEmpty) { return -1 }
        if (result > (queue1.count + queue2.count) * 2) { return -1 }
        if (q1.sum > q2.sum) {
            q2.enqueue(q1.dequeue()!)
        } else {
            q1.enqueue(q2.dequeue()!)
        }
        result += 1
    }
    
    return result
}