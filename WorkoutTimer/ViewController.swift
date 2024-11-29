//
//  ViewController.swift
//  WorkoutTimer
//
//  Created by Huiying Lin on 29/11/2024.
//

import UIKit

class ViewController: UIViewController {
//    var listenerType: ListenerType
    
//    func onTimeChange(change: DatabaseChange, time: Int) {
//        <#code#>
//    }
    
    
    @IBOutlet weak var timeCount: UILabel!
    var timer :Timer?
    var counter = 0 // count for timer
    var toavg = 0 // count for timer
    weak var databaseController: DatabaseProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController
        
    }

    
    
    @IBAction func start(_ sender: Any) {
        if timer == nil{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
//        else{}
    }
    
    @objc func fireTimer() {
        counter += 1
        print("Timer fired!", counter)
        timeCount.text = secondsToHoursMinutesSeconds(counter)
        
    }
    
    @IBAction func killTimer(_ sender: Any) {
        displayMessage(title: "End", msg: "Your timer will be stoped ")
        
        timer?.invalidate()
        timer = nil
        
        print("This is second \(secondsToHoursMinutesSeconds(counter)) s")
        toavg = counter
        counter = 0
//        print(secondsToHoursMinutesSeconds(100000))
        print(toavg)
    }
    
    @IBAction func savetime(_ sender: Any) {
        
        print(toavg)
        print(databaseController as Any)
//        databaseController!.addTime(counts: toavg)
//        
        
    }
    
    // pop up windows display message
    func displayMessage(title: String, msg: String) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    

    func secondsToHoursMinutesSeconds(_ seconds: Int) -> String {
        return "\(seconds / 3600):\((seconds % 3600) / 60):\((seconds % 3600) % 60)"
    }
    
}



