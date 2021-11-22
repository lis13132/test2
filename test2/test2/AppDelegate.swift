//
//  AppDelegate.swift
//  test2
//
//  Created by Oleg Makarov on 18.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationContrroller: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window =  UIWindow(frame: UIScreen.main.bounds)
        let vc = BooksViewController(nibName: "BooksViewController", bundle: nil)
        navigationContrroller = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationContrroller
        window?.makeKeyAndVisible()
        
        return true
    }

}

