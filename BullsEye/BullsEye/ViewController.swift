//
//  ViewController.swift
//  BullsEye
//
//  Created by Jia Jie Chan on 12/9/22.
//

import UIKit

//Working on this file from SPH MacBook. Fri 16 Sep 10:13 AM

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue = Int.random(in: 1...100)
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewGame()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let message = "You earned \(points) points"
        let title: String
         if difference == 0 {
           title = "Perfect!"
            points += 100
         } else if difference < 5 {
           title = "You almost had it!"
             if difference == 1 {
                   points += 50
                 }
         } else if difference < 10 {
           title = "Pretty good!"
         } else {
           title = "Not even close..."
         }
        score += points

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(
          title: "OK",
          style: .default) {_ in
          self.startNewRound()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        round += 1
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
        roundLabel.text = "\(round)"
        scoreLabel.text = "\(score)"
    }


}

