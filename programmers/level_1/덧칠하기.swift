import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var answer = 0
    var max = 0
    section.map {
        if ( $0 > max ) {
            answer += 1
            max = $0 + m - 1;
        }
    }
    return answer;
}