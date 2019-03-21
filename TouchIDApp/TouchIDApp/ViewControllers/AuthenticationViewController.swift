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
    
    let context = LAContext()
    var authError: NSError?
    
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
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    @IBAction func loginButtonWasPressed(_ sender: UIButton) {
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: loginButton.currentTitle ?? "") { [weak self](success, authError) in
                    if success {
                        DispatchQueue.main.async {
                            self?.navigationController?.pushViewController(HomeViewController(), animated: true)
                        }
                    } else {
                        print("show Error \(authError?.localizedDescription ?? "")")
                    }
                }
            } else {
                print("show Error \(authError?.localizedDescription ?? "")")
            }
        }
        
        
    }
}

