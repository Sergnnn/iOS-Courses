//
//  NetworkService.swift
//  ToDo App
//
//  Created by Сергей Непомящий on 26.01.2021.
//

import Foundation

typealias OnApiSucces = (Todos) -> Void
typealias OnApiError = (String) -> Void

struct NetworkService {
    static let shared = NetworkService()
    
    let URL_BASE = "http://localhost:3003"
    let URL_ADD_TODO = "/add"
    
    let session = URLSession(configuration: .default)
    
    func getTodos(onSuccess: @escaping OnApiSucces, onError: @escaping (String) -> Void) { // error could be OnApiError
        let url = URL(string: "\(URL_BASE)")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    if response.statusCode == 200 {
                        // parse succseful resut
                        let items = try JSONDecoder().decode(Todos.self, from: data)
                        //
                        onSuccess(items)
                    } else {
                        // Show error to uesr
                        let err = try JSONDecoder().decode(APIError.self, from: data)
                        onError(err.message)
                    }
                    
                }
                catch {
                    onError(error.localizedDescription)
                }
            
            }
            
            
        }
        task.resume()
        
    }
    
    func addTodo(todo: Todo, onSuccess: @escaping OnApiSucces, onError: @escaping (String) -> Void) {
        let url = URL(string: "\(URL_BASE)\(URL_ADD_TODO)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // GET, PUT, POST, DELETE for some different api
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        
        do {
            let body = try JSONEncoder().encode(todo)
            request.httpBody = body
            
            let task = session.dataTask(with: request) { (data, respone, error) in
                
                DispatchQueue.main.async {
                    if let error = error {
                        onError(error.localizedDescription)
                        return
                    }
                    
                    guard let data = data, let respons = respone as? HTTPURLResponse else {
                        onError("Failed to get data from server")
                        return
                    }
                    
                    do {
                        if respons.statusCode == 200 {
                            let items = try JSONDecoder().decode(Todos.self, from: data)
                            onSuccess(items)
                        } else {
                            let err = try JSONDecoder().decode(APIError.self, from: data)
                            onError(err.message)
                        }
                    } catch {
                        onError(error.localizedDescription)
                    }
                
                }
                
               
    
            }
            task.resume()
            
        } catch {
            onError(error.localizedDescription)
        }
        
        
    }
    
}
