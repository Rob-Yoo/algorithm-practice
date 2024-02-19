import Foundation

func countFactor(_ number: Int) -> Int {
    var count = 0
    let fac = Int(sqrt(Double(number)))

    for i in 1...fac {
        if number % i == 0 {
            count += (i * i == number) ? 1 : 2
        }
    }
    
    return count
}

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    let weaponAttackArr: [Int] = (1...number).map { countFactor($0) }
    
    let limitedWeaponAttackArr: [Int] = weaponAttackArr.map { attack in
        if (attack > limit) {
            return power
        }
        
        return attack
    }
    
    let ironWeight = limitedWeaponAttackArr.reduce(0) { $0 + $1 }
    
    return ironWeight
}