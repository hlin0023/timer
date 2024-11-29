//
//  ViewController.swift
//  WorkoutTimer
//
//  Created by Huiying Lin on 29/11/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var timer :Timer?
    var counter = 0 // count for timer

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() {
        counter += 1
        print("Timer fired!", counter)
    }
    
    @IBAction func killTimer(_ sender: Any) {
        timer?.invalidate()
        timer = nil
        
        print("This is second \(counter) s")
        counter = 0
    }
    
}



