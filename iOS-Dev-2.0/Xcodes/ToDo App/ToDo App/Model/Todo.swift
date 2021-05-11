//
//  Todo.swift
//  ToDo App
//
//  Created by Сергей Непомящий on 26.01.2021.
//

import Foundation

struct Todos: Codable {
    let items: [Todo]
}


struct Todo: Codable {
    let item: String
    let priority: Int
}

