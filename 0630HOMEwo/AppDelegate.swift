//
//  AppDelegate.swift
//  0630HOMEwo
//
//  Created by Akiko Sato on 2019/06/30.
//  Copyright © 2019 Akiko Sato. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    override init() {
        super.init()
        FirebaseApp.configure()
    }

    //Facebook, Google, TEL認証で呼ばれる関数
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        //Google or Facebookの認証時にtrueを返す
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        if Auth.auth().canHandle(url) {
            return true
        }
        return false
    }

    //通知を受け取ったときの処理
    func application(_ application: UIApplication, didReceiveRemoteNotification notification: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if Auth.auth().canHandleNotification(notification) {
            completionHandler(.noData)
            return
        }
        print("ERROR")
    }
}


