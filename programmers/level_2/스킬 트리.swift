import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0
    
    for skill_tree in skill_trees {
        let userSkillTree = skill_tree.map { String($0) }
        var check = ""
        
        for userSkill in userSkillTree {
            if (skill.contains(userSkill)) {
                check += userSkill
            }
        }
        
        if (skill.hasPrefix(check)) { result += 1 }
    }
    return result
}