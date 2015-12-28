//
//  ToDoItem.swift
//  swift-with-realm
//
//  Created by Duc Nguyen on 12/28/15.
//  Copyright © 2015 ND NINJA. All rights reserved.
//

import Foundation
import Realm

class ToDoItem: RLMObject {
	dynamic var name = ""
	dynamic var finished = false
}