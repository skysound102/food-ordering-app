//
//  NetworkService.swift
//  TestApp
//
//  Created by Артем on 26.07.2023.
//

import SwiftUI


class SwiftUIView : ObservableObject {
    @Published var courses2 : [Dish] = []
    @Published var tag : [Teg] = []
    func fetch2() {
        guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [self] data, _, error in
            guard let data = data , error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
              
                let courses = try decoder.decode(Welcome2.self, from: data).dishes
                
          
                DispatchQueue.main.async { [self] in
                    self.courses2 = courses
                    print("result \(courses2)")
                
                }
            }
            catch {
                print(error)
               
            }
        }
        task.resume()
    }

}


class ViewModel : ObservableObject {
    @Published  var courses : [Сategory] = []

    func fetch() {
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [self] data, _, error in
            guard let data = data , error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
              
                let courses = try decoder.decode(Welcomе.self, from: data).сategories
     
                DispatchQueue.main.async {
                    self.courses = courses
                   
                }
            }
            catch {
                print(error)
       
            }
        }
        task.resume()
    }
}
