//
//  ViewController.swift
//  Counter
//
//  Created by a.n.lazarev on 14.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counter: UILabel!
    
    @IBOutlet private weak var history: UITextView!
    
    @IBOutlet private weak var buttonIncrease: UIButton!
    
    @IBOutlet private weak var buttonDecrease: UIButton!
    
    @IBOutlet private weak var reset: UIButton!
    
    private var number = 0
    
    private let formatter = DateFormatter()

    private var counterText = "Значение счетчика: "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        history.text = "История изменений: \n\n"
        history.isScrollEnabled = true
        history.isEditable = false
        // Do any additional setup after loading the view.
    }
    
    private func returnData() -> String {
        let currentDate = formatter.string(from: Date())
        return "\(currentDate): "
    }
    
    @IBAction private func clickIncreaseButton(_ sender: Any) {
        number += 1
        history.text.append(returnData() + "значение изменено на +1 \n")
    }
    
    @IBAction private func clickDecreaseButton(_ sender: Any) {
        if number > 0 {
            number -= 1
            history.text.append(returnData() + "значение изменено на -1 \n")
        } else {
            history.text.append(returnData() + "попытка уменьшить значение счётчика ниже 0 \n")
        }
    }
        
    @IBAction private func clickResetButton(_ sender: Any) {
        number = 0
        history.text.append(returnData() + "значение сброшено \n")
    }
        
        
    @IBAction private func updateOnTap(_ sender: Any) {
        counter.text = counterText + "\(number)"
    }
}

