//
//  Network Services.swift
//  SWAPIApp
//
//  Created by Сергей Непомящий on 30.01.2021.
//

import Foundation

typealias OnApiSuccesPeople = (people) -> Void
typealias OnApiError = (String) -> Void
typealias OnApiSuccesPlanet = (planet) -> Void

struct ApiService {
    static let shared = ApiService()
    
    let URL_BASE = "https://swapi.dev/api"
    let URL_PEOPLE = "/people"
    let URL_PEOPLE_PAGE_NUMBERFROMCYCLE = "/?page="
    let URL_PLANETS = "/planets"
    
    let session = URLSession(configuration: .default)
    
    func getResultsFromURL(onSuccess: @escaping OnApiSuccesPeople, onError: @escaping OnApiError, urlStringType: String) {

        let url = URL(string: "\(urlStringType)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // GET, PUT, POST, DELETE for some different api
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let task = session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {

                if let error = error {
                    onError(error.localizedDescription)
                    return
                }

                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }

                do{
                    if response.statusCode == 200 {
                        
                        let results = try JSONDecoder().decode(people.self, from: data)
                        onSuccess(results)
                    } else {
                        let err = try JSONDecoder().decode(APIError.self, from: data)
                        print("Code is \(response.statusCode)")
                        onError(err.detail)
                    }
                }
                catch {
                    onError(error.localizedDescription)
                }

            }
        }
        task.resume()

        }
    
    func getPlanetsFromURL(onSuccess: @escaping OnApiSuccesPlanet, onError: @escaping OnApiError, urlStringType: String) {
        
        let url = URL(string: "\(urlStringType)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // GET, PUT, POST, DELETE for some different api
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let task = session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {

                if let error = error {
                    onError(error.localizedDescription)
                    return
                }

                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }

                do{
                    if response.statusCode == 200 {
                        let planets = try JSONDecoder().decode(planet.self, from: data)
                        onSuccess(planets)
                    } else {
                        let err = try JSONDecoder().decode(APIError.self, from: data)
                        print("Code is \(response.statusCode)")
                        onError(err.detail)
                    }
                }
                catch {
                    onError(error.localizedDescription)
                }

            }
        }
        task.resume()

        }
    
        
    }
    
    




