//
//  AppDelegate.swift
//  NobelLaureatesApp
//
//  Created by Alikhan Gubayev on 11.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = UINavigationController(rootViewController: ViewController())
        return true
    }
}

