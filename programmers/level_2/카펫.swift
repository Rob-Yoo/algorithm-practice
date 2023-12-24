import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var area = brown + yellow
    var factor = Int(sqrt(Double(area)))
    var result = [Int]()
    for height in 1...factor {
        if (area % height == 0) {
            let width = area / height
            
            if ((width - 2) * (height - 2) == yellow) {
                result.append(width)
                result.append(height)
            }
        }
    }
    
    return result
}