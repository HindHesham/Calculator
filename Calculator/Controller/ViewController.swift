
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber : Bool = true
    
    var displayValue : Double{
        get{
            let number = Double (displayLabel.text!) ?? 0
            return number
        }
        set{
            displayLabel.text = String(newValue)
            
        }
    }
    
    private var calculator = CalculatorLogic()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {            
            
            if let result = calculator.Calculate(symbol: calcMethod){
                displayValue = result
                
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle{
            
            if isFinishedTypingNumber {

                if (numValue == "."){
                    displayLabel.text = "0."
                }
                else{
                    displayLabel.text = numValue
                }
                isFinishedTypingNumber = false
                
            }else {
                if (numValue == "." && displayLabel.text!.contains(".")){
                    return
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    

}

