//
//  SecondViewController.swift
//  Pass Value Work
//
//  Created by FISH on 2020/1/15.
//  Copyright © 2020 FISH. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let inputTextField = UITextField()
    
    let backButton = UIButton()
    
    var selectedIndex: Int?
    
    var pass: ((String, Int?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }
    
    func setLayout() {
        view.backgroundColor = .white
        
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        inputTextField.borderStyle = .roundedRect
        inputTextField.delegate = self
        view.addSubview(inputTextField)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.backgroundColor = .black
        backButton.titleLabel?.textColor = .white
        backButton.setTitle("Button", for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            inputTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            inputTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            inputTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputTextField.heightAnchor.constraint(equalToConstant: 40),
            
            backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        ])
    }
    
    @objc func back() {
        guard let input = inputTextField.text else { return }
        pass?(input, selectedIndex)
        navigationController?.popViewController(animated: true)
    }

}

extension SecondViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
