//
//  PersistenceService.swift
//  myTodos
//
//  Created by omokagbo on 24/05/2021.
//

import Foundation
import RealmSwift

// swiftlint:disable:next force_try
private var realm = try! Realm()

protocol PersistenceService {
  func saveData(title: String, detail: String)
  func deleteData(todo: Todos)
  func updateData(todo: Todos, title: String, detail: String)
}

class RealmPersistenceService: PersistenceService {
  
  func saveData(title: String, detail: String) {
    
    realm.beginWrite()
    let newTodo = Todos()
    newTodo.title = title
    newTodo.details = detail
    realm.add(newTodo)
    // swiftlint:disable:next force_try
    try! realm.commitWrite()
    
  }
  
  func updateData(todo: Todos, title: String, detail: String) {
    
    realm.beginWrite()
    let newTodo = todo
    newTodo.title = title
    newTodo.details = detail
    realm.add(newTodo)
    // swiftlint:disable:next force_try
    try! realm.commitWrite()
    
  }
  
  func deleteData(todo: Todos) {
    
    realm.beginWrite()
    realm.delete(todo)
    // swiftlint:disable:next force_try
    try! realm.commitWrite()
    
  }
  
}
