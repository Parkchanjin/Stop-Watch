//
//  ViewController.swift
//  Stop Watch 02
//
//  Created by D7703_04 on 2019. 4. 4..
//  Copyright © 2019년 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    var time = 0
    //Timer 객체 생성
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(time)
    }

    @IBAction func startBtnPressed(_ sender: Any) {
        //isValid : 활동 중이면 false, 활동하지 않으면 true
//        if (myTimer.isValid) {
 //           return;
  //      }
        
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        //startButton.isEnabled = false
        
        changeButtonState(start: false, pause: true, stop: true)
    }
    
    @IBAction func pauseBtnPressed(_ sender: Any) {
        // Timer가 정지, 재개 가능
        myTimer.invalidate()
        
        changeButtonState(start: true, pause: false, stop: true)
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        myTimer.invalidate()
        time = 0
        timeLabel.text = String(time)
        changeButtonState(start: true, pause: false, stop: false)
    }
    
    @objc func updateTime() {
        time+=1
        timeLabel.text = String(time)
    }

    func changeButtonState(start : Bool, pause : Bool, stop : Bool) {
        startButton.isEnabled = start
        pauseButton.isEnabled = pause
        resetButton.isEnabled = stop
    }
}

