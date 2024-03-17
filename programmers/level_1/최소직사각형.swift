import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var sizes = sizes
    var (maxW, maxH) = (-1, -1)
    
    for size in sizes {
        var size = size
        if (size[0] < size[1]) {
            size.swapAt(0, 1)
        }
        
        maxW = max(maxW, size[0])
        maxH = max(maxH, size[1])
    }
    
    return maxW * maxH
}