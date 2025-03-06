//
//  ViewController.swift
//  Counter
//
//  Created by Олеся Орленко on 03.03.2025.
//

import UIKit
import Foundation


final class ViewController: UIViewController {

    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var counterButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var zeroButton: UIButton!
    @IBOutlet weak private var historeText: UITextView!
    private var counter: Int = 0
    private var history: [String] = []
    private var dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
    }
    
    @IBAction private func buttonDidTap(_ sender: Any) {
        counter += 1
        updateCounterLabel()
        history.append("\(updateDate()): значение изменено на +1")
        updateHistoryText()
    }
    
    @IBAction private func minusButtonDidTap(_ sender: Any) {
        if counter > 0{
            counter -= 1
            updateCounterLabel()
            history.append("\(updateDate()): значение изменено на -1")
            updateHistoryText()
        }
    }

    @IBAction private func zeroButtonDidTap(_ sender: Any) {
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
        let formattedDate = dateFormatter.string(from: Date())
        return formattedDate
    }
}
