//
//  ViewController.swift
//  BullsEye
//
//  Created by Jia Jie Chan on 12/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue = Int.random(in: 1...100)
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)" + "\nThe target is: \(targetValue)"
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
    }


}

