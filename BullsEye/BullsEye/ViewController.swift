//
//  ViewController.swift
//  BullsEye
//
//  Created by Jia Jie Chan on 12/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)"
        
        let alert = UIAlertController(title: "Hello World", message: "This is my first app!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }


}

