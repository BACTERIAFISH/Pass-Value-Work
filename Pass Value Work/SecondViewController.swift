//
//  SecondViewController.swift
//  Pass Value Work
//
//  Created by FISH on 2020/1/15.
//  Copyright © 2020 FISH. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    
    var selectedIndex: Int?
    
    var input: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputTextField.delegate = self
        
        if let input = input {
            inputTextField.text = input
        }
    }

    @IBAction func back(_ sender: UIButton) {
    }
}

extension SecondViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
