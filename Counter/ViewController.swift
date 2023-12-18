//
//  ViewController.swift
//  Counter
//
//  Created by a.n.lazarev on 14.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counter: UILabel!
    
    @IBOutlet weak var history: UITextView!
    
    @IBOutlet weak var buttonIncrease: UIButton!
    
    @IBOutlet weak var buttonDecrease: UIButton!
    
    @IBOutlet weak var reset: UIButton!
    
    var number = 0
    
    let formatter = DateFormatter()

    var counterText = "Значение счетчика: "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        history.text = "История изменений: \n\n"
        history.isScrollEnabled = true
        history.isEditable = false
        // Do any additional setup after loading the view.
    }
    
    func returnData() -> String {
        let currentDate = formatter.string(from: Date())
        return "\(currentDate): "
    }
    
    @IBAction func clickIncreaseButton(_ sender: Any) {
        number += 1
        history.text.append(returnData() + "значение изменено на +1 \n")
    }
    
    @IBAction func clickDecreaseButton(_ sender: Any) {
        if number > 0 {
            number -= 1
            history.text.append(returnData() + "значение изменено на -1 \n")
        } else {
            history.text.append(returnData() + "попытка уменьшить значение счётчика ниже 0 \n")
        }
    }
        
    @IBAction func clickResetButton(_ sender: Any) {
        number = 0
        history.text.append(returnData() + "значение сброшено \n")
    }
        
        
    @IBAction func updateOnTap(_ sender: Any) {
        counter.text = counterText + "\(number)"
    }
}

