
import Foundation


struct CalculatorLogic {
    
    private var number: Double?
    var intermidateCalculation : (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
     mutating func Calculate(symbol: String) -> Double? {
        
        if let n = number{
            
            switch symbol{
            case "+/-":
                return n *  -1
            case "%":
                return  n * 0.01
            case "AC":
                return 0
            case "=":
                let result = preformTwoNumCalculation(n2: n)
                intermidateCalculation = nil
                return result
            default:
                var result = n
                if let perviousResult = preformTwoNumCalculation(n2: n){
                    result = perviousResult
                    intermidateCalculation = (n1: result, calcMethod: symbol )
                } else{
                    intermidateCalculation = (n1: n, calcMethod: symbol )
                }
                
                
 
            }
        }
        return nil
    }
    
    private func preformTwoNumCalculation(n2: Double) -> Double?{
        
        if let n1 = intermidateCalculation?.n1, let operation = intermidateCalculation?.calcMethod {
            
            switch operation{
            case"+":
               return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case"÷":
                return n1 / n2
            default:
                fatalError("the operation passed does not match any of the cases")
            }
        }
        return nil
    }
    
}
