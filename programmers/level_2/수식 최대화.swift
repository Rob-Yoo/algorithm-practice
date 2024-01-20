import Foundation

var operators = [String]()
var permutatedOperators = [[String]]()
var expressionArr = [String]()

func solution(_ expression:String) -> Int64 {
    var result: Int64 = 0

    parseExpression(expression.map { String($0) })
    permutatedOperators = permutation(operators, operators.count)
    result = findMaxResult()
    return result
}

func parseExpression(_ expression: [String]) {
    var number = ""

    for token in expression {
        if (token == "*" || token == "-" || token == "+") {
            expressionArr.append(number)
            expressionArr.append(token)
            
            if (!operators.contains(token)) { operators.append(token) }
            number = ""
        } else {
            number += token
        }
    }
    expressionArr.append(number)
}

func permutation(_ operators: [String], _ number: Int) -> [[String]] {
    var permutationArray = [[String]]()
    var visited = Array(repeating: false, count: operators.count)
    
    func dfs(_ subArray: [String]) {
        if (subArray.count == number) {
            permutationArray.append(subArray)
            return
        }
        
        for i in 0..<operators.count {
            if (!visited[i]) {
                visited[i] = true
                dfs(subArray + [operators[i]])
                visited[i] = false
            }
        }
    }
    dfs([])
    
    return permutationArray
}

func findMaxResult() -> Int64 {
    var result: Int64 = -1

    for operators in permutatedOperators { // 모든 연산자 우선 순위 조합 탐색
        var expressions = expressionArr

        for _operator in operators { // 연산자 우선 순위에 따른 탐색
            expressions = compute(expressions, _operator)
        }

        let computedResult = Int64(expressions[0])!
        result = max(result, abs(computedResult))
    }
    
    return result
}

func compute(_ expressions: [String], _ _operator: String) -> [String] {
    var newExpressions = [String]()
    var leftOperand: Int64 = 0
    var shouldCompute = false

    for expression in expressions {
        if (expression == _operator) {
            leftOperand = Int64(newExpressions.popLast()!)!
            shouldCompute.toggle()
        } else {
            if (shouldCompute) {
                let rightOperand = Int64(expression)!
                let computedResult = computeExpression(leftOperand, rightOperand, _operator)
                newExpressions.append(computedResult)
                shouldCompute.toggle()
            } else {
                newExpressions.append(expression)   
            }
        }
    }
    
    return newExpressions
}

func computeExpression(_ left: Int64, _ right: Int64, _ _operator: String) -> String {
    var result: Int64 = 0

    if (_operator == "*") {
        result = left * right
    } else if (_operator == "+") {
        result = left + right
    } else {
        result = left - right
    }
    
    return String(result)
}