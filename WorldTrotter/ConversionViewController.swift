//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Zach Fogg on 10/12/21.
//

import UIKit

class ConversionViewController: UIViewController {
    
    var conversionView = UIView()
    
    override func loadView() {
        view = conversionView
        // Create Labels
        let fLabel = UILabel()
        fLabel.text = "212"
        fLabel.font = fLabel.font.withSize(70)

        let degFaLabel = UILabel()
        degFaLabel.text = "degrees Fahrenheit"
        degFaLabel.font = degFaLabel.font.withSize(36)

        let isLabel = UILabel()
        isLabel.text = "is really"
        isLabel.font = isLabel.font.withSize(36)

        let cLabel = UILabel()
        cLabel.text = "100"
        cLabel.font = cLabel.font.withSize(70)

        let degCaLabel = UILabel()
        degCaLabel.text = "degrees celcius"
        degCaLabel.font = degCaLabel.font.withSize(36)

        let labelArray = [fLabel, degFaLabel, isLabel, cLabel, degCaLabel]

        // Add Views to StackView
        let stackView = UIStackView(arrangedSubviews: labelArray)
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add StackView to View
        view.addSubview(stackView)
        
        // Constrain StackView
        let topConstraint = stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let horzConstraint = stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        topConstraint.isActive = true
        horzConstraint.isActive = true

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let colorOptions = [UIColor.systemRed, UIColor.systemBlue, UIColor.systemCyan, UIColor.systemPink]
        let color = Int.random(in: 0..<colorOptions.count)
        view.backgroundColor = colorOptions[color]
    }


}

