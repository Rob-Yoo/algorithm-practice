import Foundation

func solution(_ gems:[String]) -> [Int] {
    let numberOfAllGem = Set(gems).count
    var (l_p, r_p) = (0, 0)
    var minLengthOfSection = Int.max
    var gemCart = [String: Int]()
    var result = [Int]()
    
    while (r_p < gems.count) {
        
        while (r_p < gems.count && gemCart.count != numberOfAllGem) {
            gemCart[gems[r_p], default: 0] += 1
            r_p += 1
        }

        while (gemCart.count == numberOfAllGem) {
            if (minLengthOfSection > r_p - (l_p + 1)) {
                minLengthOfSection = r_p - (l_p + 1)
                result = [l_p + 1, r_p]
            }
            
            gemCart[gems[l_p]]! -= 1
            
            if (gemCart[gems[l_p]]! == 0) {
                gemCart[gems[l_p]] = nil
            }
            
            l_p += 1
        }
    }
    
    return result
}