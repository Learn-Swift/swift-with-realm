//
//  AppDelegate.swift
//  swift-with-realm
//
//  Created by Duc Nguyen on 12/28/15.
//  Copyright © 2015 ND NINJA. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		window = UIWindow(frame: UIScreen.mainScreen().bounds)
		window?.backgroundColor = UIColor.whiteColor() // [1]

		let viewController = ViewController(nibName: nil, bundle: nil) // [2]
		let navController = UINavigationController(rootViewController: viewController) // [3]

		window?.rootViewController = navController // [4]
		window?.makeKeyAndVisible()
		return true
	}

	func applicationWillResignActive(application: UIApplication) {
			}

	func applicationDidEnterBackground(application: UIApplication) {

	}

	func applicationWillEnterForeground(application: UIApplication) {

	}

	func applicationDidBecomeActive(application: UIApplication) {

	}

	func applicationWillTerminate(application: UIApplication) {
		
	}


}

