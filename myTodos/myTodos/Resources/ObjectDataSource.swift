//
//  ObjectDataSource.swift
//  myTodos
//
//  Created by omokagbo on 24/05/2021.
//

import UIKit

class ObjectDataSource: NSObject {
  private var todos = [Todos]()
  let rootVC = RootViewController()
  
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
