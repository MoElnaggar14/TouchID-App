//
//  ViewController.swift
//  TouchIDApp
//
//  Created by Mohammed Elnaggar on 3/21/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import UIKit
import LocalAuthentication

class AuthenticationViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        switch UIDevice.modelName {
        case .iPhone5s, .iPhone6, .iPhone6s, .iPhone6Plus, .iPhone6sPlus, .iPhone7, .iPhone7Plus, .iPhone8, .iPhone8Plus, .Simulator:
            loginButton.setTitle("Login Using Touch ID", for: .normal)
        case .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR:
            loginButton.setTitle("Login Using Face ID", for: .normal)
        default:
            loginButton.setTitle("Lohin Using PassCode", for: .normal)
        }
    }
    
    
    @IBAction func loginButtonWasPressed(_ sender: UIButton) {
        
    }


}

