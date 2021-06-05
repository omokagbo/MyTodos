//
//  ViewController.swift
//  myTodos
//
//  Created by omokagbo on 21/05/2021.
//

import UIKit
import RealmSwift

class RootViewController: UIViewController {
  
  private var viewModel = ViewModel()
  
  @IBOutlet var tableView: UITableView!
  
  // swiftlint:disable:next force_try
  private let realm = try! Realm()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.tableFooterView = UITableView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    refresh()
  }
  
  @IBAction func didTapAddTodo() {
    
    guard let newVC = storyboard?.instantiateViewController(identifier: "new") as? TodoEntryViewController else {
      return
    }
    
    newVC.completion = { [weak self] in
      self?.refresh()
    }
    
    newVC.title = "New Todo"
    newVC.navigationItem.largeTitleDisplayMode = .never
    navigationController?.pushViewController(newVC, animated: true)
    
  }
  
  func refresh() {
    viewModel.todos = realm.objects(Todos.self).map({ $0 })
    tableView.reloadData()
  }
  
}

extension RootViewController: UITableViewDataSource {
  
  private var numberOfRows: Int {
    return viewModel.todos.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfRows
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = viewModel.todos[indexPath.row].title
    cell.detailTextLabel?.text = viewModel.todos[indexPath.row].details
    return cell
  }
  
}

extension RootViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)
    let todo = viewModel.todos[indexPath.row]
    guard let newVC = storyboard?.instantiateViewController(identifier: "detail") as? TodoDetailsViewController else {
      return
    }
    newVC.title = "Todo Details"
    newVC.todo = todo
    newVC.todoTitle = todo.title
    newVC.todoDetail = todo.details
    newVC.deletionHandler = { [weak self] in
      self?.refresh()
    }
    navigationController?.pushViewController(newVC, animated: true)
    
  }
  
}
