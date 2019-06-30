//
//  ViewController.swift
//  0630HOMEwo
//
//  Created by Akiko Sato on 2019/06/30.
//  Copyright © 2019 Akiko Sato. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class ViewController: UIViewController,FUIAuthDelegate {
    
    @IBOutlet weak var AuthButton: UIButton!
    var authUI: FUIAuth {
        get {
            return FUIAuth.defaultAuthUI()!
        }
    }
    let providers: [FUIAuthProvider] = [
    FUIGoogleAuth(),
    FUIFacebookAuth(),
    FUIPhoneAuth(authUI: FUIAuth.defaultAuthUI()!)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.authUI.delegate = self
        self.authUI.providers = providers
        AuthButton.addTarget(self,action: #selector(self.AuthButtonTapped(sender:)),for: .touchUpInside)
    }
    
    @objc func AuthButtonTapped(sender : AnyObject) {
        let authViewController = self.authUI.authViewController()
        self.present(authViewController, animated: true, completion: nil)
    }
    
    public func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if error == nil {
            self.performSegue(withIdentifier: "toTopView", sender: self)
        }
        print("ERROR")
    }

}
