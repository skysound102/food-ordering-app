//
//  ContentView.swift
//  TestApp
//
//  Created by Артем on 11.07.2023.
//

import SwiftUI


struct URLImage : View {
    let urlString : String
    @State var data : Data?
    
    var body : some View {
        if let data = data , let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
              
                .resizable()
                .frame(width: 400 , height: 150)
        } else {
            Image("")
                .frame(width: 200 , height: 100)
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

struct GeneralView: View {
    @StateObject var viewModel = ViewModel()
    @State var isclick = false
   
        
    var body: some View {
        
        
        NavigationView {
            VStack{
                ForEach((viewModel.courses) , id: \.id) { categories in
                    ZStack {
                                                NavigationLink(destination: ListOfDishesView()){
                        URLImage(urlString: categories.imageURL , data: nil)
                                                        .cornerRadius(40)
                                                   
                    }
                                          
                        Text(categories.name)
                            .foregroundColor(.black)
                            .font(.bold(.body)())
                            .padding(10)
                        
                    }
                }
            }
            
            .onAppear() {
               print("k")
                viewModel.fetch()
               
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
