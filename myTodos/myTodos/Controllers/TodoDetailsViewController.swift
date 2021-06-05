//
//  TodoDetailsViewController.swift
//  myTodos
//
//  Created by omokagbo on 24/05/2021.
//

import UIKit
import RealmSwift

class TodoDetailsViewController: UIViewController {
  
  private let persistenceService = RealmPersistenceService()
  
  @IBOutlet var titleField: UITextField!
  @IBOutlet var detailField: UITextView!
  
  // swiftlint:disable:next force_try
  private let realm = try! Realm()
  
  var todoTitle = ""
  var todoDetail = ""
  var todo: Todos?
  var deletionHandler: (() -> Void)?
  var updateHandler: (() -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleField.text = todoTitle
    detailField.text = todoDetail
    titleField.becomeFirstResponder()
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash,
                                                        target: self,
                                                        action: #selector(didTapDeleteButton))
  }
  
  @objc func didTapDeleteButton() {
    if let myTodo = self.todo {
      persistenceService.deleteData(todo: myTodo)
      deletionHandler?()
      navigationController?.popToRootViewController(animated: true)
    }
  }
  
  @IBAction func didTapUpdateButton(_ sender: UIButton) {
    
    if let myTodo = self.todo,
       let titleText = titleField.text,
       let detailText = detailField.text,
       !titleText.isEmpty,
       !detailText.isEmpty {
      persistenceService.updateData(todo: myTodo, title: titleText, detail: detailText)
      navigationController?.popToRootViewController(animated: true)
    }
    
  }
  
}
