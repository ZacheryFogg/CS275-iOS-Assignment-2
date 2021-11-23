//
//  ViewController.swift
//  PlusMinus
//
//  Created by Zach Fogg on 9/1/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var valueLabel: UILabel!
    
    var value: Int = 0
    
    func updateLabel(_ newValue: Int){
        if newValue == 0 {
            valueLabel.text = "zero"
        } else {
            valueLabel.text = String(newValue)
        }
        if newValue < 0 {
            valueLabel.textColor = UIColor.systemRed
        } else {
            valueLabel.textColor = UIColor.label
        }
    }
    
    @IBAction func increment(_ sender: UIButton) {
        value += 1
        updateLabel(value)
    }
    
    @IBAction func decrement(_ sender: UIButton) {
        value -= 1
        updateLabel(value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueLabel.text = "zero"
    }
}


