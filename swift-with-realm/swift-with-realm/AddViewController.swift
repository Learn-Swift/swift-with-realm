//
//  AddViewController.swift
//  swift-with-realm
//
//  Created by Duc Nguyen on 12/28/15.
//  Copyright © 2015 ND NINJA. All rights reserved.
//

import UIKit
import Realm

class AddViewController: UIViewController, UITextFieldDelegate {
	var textField: UITextField?
	var newItemText: String?

	override func viewDidLoad() { // [1]
		super.viewDidLoad()
		view.backgroundColor = UIColor.whiteColor()
		setupTextField()
		setupNavigationBar()
	}

	override func viewDidAppear(animated: Bool) { // [2]
		super.viewDidAppear(animated)
		textField?.becomeFirstResponder()
	}

	func setupTextField() { // [3]
		textField = UITextField(frame: CGRectZero)
		textField?.placeholder = "Type in item"
		textField?.delegate = self
		view.addSubview(textField!)
	}

	func setupNavigationBar() { // [4]
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "doneAction")
	}

	override func viewDidLayoutSubviews() { // [5]
		super.viewDidLayoutSubviews()
		let padding = CGFloat(11)
		textField?.frame = CGRectMake(padding, self.topLayoutGuide.length + 50, view.frame.size.width - padding * 2, 100)
	}

	func doneAction() { // [6]
		let realm = RLMRealm.defaultRealm() // [6.1]
		if self.textField?.text!.utf16Count > 0 { // [6.2]
			let newTodoItem = ToDoItem() // [6.3]
			newTodoItem.name = self.textField!.text!
			realm.transactionWithBlock(){ // [6.4]
				realm.addObject(newTodoItem)
			}
		}
		dismissViewControllerAnimated(true, completion: nil) // [7]
	}

	func textFieldShouldReturn(textField: UITextField!) -> Bool { // [8]
		doneAction()
		textField.resignFirstResponder()
		return true
	}
}
