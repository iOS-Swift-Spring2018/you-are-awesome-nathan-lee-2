//
//  ViewController.swift
//  You are Awesome!
//
//  Created by Nathan Lee on 1/22/18.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    // Code below executes when the app's view first loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showMessagePressed(_ sender: UIButton) {
        if messageLabel.text == "You are Awesome!"{
            messageLabel.text = "You are Great!"
            messageLabel.textColor = UIColor.blue
        }
        else if messageLabel.text == "You are Great!"{
            messageLabel.text = "You are Amazing!"
            messageLabel.textColor = UIColor.red
        }
        else{
            messageLabel.text = "You are Awesome!"
            messageLabel.textColor = UIColor.green
        }

       
    }
    
    
    
}

