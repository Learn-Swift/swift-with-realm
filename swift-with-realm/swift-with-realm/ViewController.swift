//
//  ViewController.swift
//  swift-with-realm
//
//  Created by Duc Nguyen on 12/28/15.
//  Copyright © 2015 ND NINJA. All rights reserved.
//

import UIKit
import Realm

class ViewController: UITableViewController {

	var todos: RLMArray {
		get {
			return ToDoItem.allObjects()
		}
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier") // [1]
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData() // [2]
	}

	override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		return Int(todos.count) // [3]
	}

	override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell

		let index = UInt(indexPath.row)
		let todoItem = todos.objectAtIndex(index) as ToDoItem // [4]
		cell.textLabel.text = todoItem.name // [5]

		return cell
	}

}

