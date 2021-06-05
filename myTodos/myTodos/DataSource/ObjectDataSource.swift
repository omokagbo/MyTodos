//
//  ObjectDataSource.swift
//  myTodos
//
//  Created by Decagon on 25/05/2021.
//

import UIKit
import RealmSwift

class ObjectDataSource: NSObject {
  
  var todos = [Todos]()
  
  private var numberOfRows: Int {
    return todos.count
  }
  
}

extension ObjectDataSource: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfRows
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = todos[indexPath.row].title
    cell.detailTextLabel?.text = todos[indexPath.row].details
    return cell
  }
  
}
