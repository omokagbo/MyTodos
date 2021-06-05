//
//  Todos.swift
//  myTodos
//
//  Created by omokagbo on 24/05/2021.
//

import Foundation
import RealmSwift

class Todos: Object {
  
  @objc dynamic var title = ""
  @objc dynamic var details = ""
  
  convenience init(title: String, details: String, dueDate: Date) {
    self.init()
    self.title = title
    self.details = details
  }
  
}
