//
//  ViewController.swift
//  Counter
//
//  Created by Олеся Орленко on 03.03.2025.
//

import UIKit
import Foundation


class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var historeText: UITextView!
    private var counter: Int = 0
    private var history: [String] = []
    private var date = Date()
    private var dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        counter += 1
        updateCounterLabel()
        history.append("\(updateDate()): значение изменено на +1")
        updateHistoryText()
    }
    
    @IBAction func minusButtonDidTap(_ sender: Any) {
        if counter > 0{
            counter -= 1
            updateCounterLabel()
            history.append("\(updateDate()): значение изменено на -1")
            updateHistoryText()
        }
    }

    @IBAction func zeroButtonDidTap(_ sender: Any) {
        if counter > 0{
            counter = 0
            updateCounterLabel()
            history.append("\(updateDate()): значение сброшено")
            updateHistoryText()
        }
        else{
            history.append("\(updateDate()): попытка уменьшить значение счётчика ниже 0")
            updateHistoryText()
        }
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "\(counter)"
    }
    
    private func updateHistoryText() {
        let formattedHistoryText = history.joined(separator: "\n")
                historeText.text = "История изменений:\n\(formattedHistoryText)"
    }
    
    private func updateDate() -> String{
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}
