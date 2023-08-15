//
//  File.swift
//  TestApp
//
//  Created by Артем on 26.07.2023.
//

import SwiftUI


struct URLImage2 : View {
    let urlString : String
    @State var data : Data?
    
    var body : some View {
        if let data = data , let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
              
                .resizable()
                .frame(width: 100 , height: 100)
        } else {
            Image("")
                .frame(width: 100 , height: 100)
                .background(Color.gray)
                .onAppear() {
                    fetchData()
                }
        }
    }
    
    
    func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
struct URLImage3 : View {
    let urlString : String
    @State var data : Data?
    
    var body : some View {
        if let data = data , let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
              
                .resizable()
                .frame(width: 200 , height: 200)
        } else {
            Image("")
                .frame(width: 300 , height: 300)
                .background(Color.gray)
                .onAppear() {
                    fetchData()
                }
        }
    }
    
    
    func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
