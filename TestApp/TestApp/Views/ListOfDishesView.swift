//
//  SwiftUIView.swift
//  TestApp
//
//  Created by Артем on 16.07.2023.
//

import SwiftUI

struct ListOfDishesView: View {
    @StateObject var viewModel2 = SwiftUIView()
 
    
    @State var clickAllMenu = false
    @State var clickRise = false
    @State var clickSalades = false
    @State var withFish = false
    @State private var activateModalView = false
    
    var columns = [GridItem(.adaptive(minimum: 80))]
    
    let heights = stride(from: 1.0, through: 3.0, by: 1.1).map { PresentationDetent.fraction($0) }

    var body: some View {
        var url = ""
        var name = ""
        var description = ""
        var price = 0
        var gramm = 0
        
        NavigationView {
     
            ScrollView{
                ScrollView(.horizontal) {
                    HStack{
                        Button {
                            clickAllMenu = true
                            clickRise = false
                            clickSalades  = false
                            withFish  = false
                        } label: {
                            Text("Все меню")
                        }
                        .foregroundColor(.black)
                        .frame(width: 150 , height: 30)
                        .background(.gray)
                        
                        
                        .cornerRadius(40)
                        Button {
                            clickAllMenu = false
                            clickRise = true
                            clickSalades  = false
                            withFish  = false
                        } label: {
                            Text("С рисом")
                        }
                        .foregroundColor(.black)
                        .frame(width: 150 , height: 30)
                        .background(.gray)
                        
                        
                        .cornerRadius(40)
                        Button {
                            clickAllMenu = false
                            clickRise = false
                            clickSalades  = true
                            withFish  = false
                        } label: {
                            Text("Салаты")
                        }
                        .foregroundColor(.black)
                        .frame(width: 150 , height: 30)
                        .background(.gray)
                        
                        
                        .cornerRadius(40)
                        Button {
                            clickAllMenu = false
                            clickRise = false
                            clickSalades  = false
                            withFish  = true
                        } label: {
                            Text("С Рыбой")
                        }
                        .foregroundColor(.black)
                        .frame(width: 150 , height: 30)
                        .background(.gray)
                        
                        
                        .cornerRadius(40)
                        
                    }
                    .frame(height: 70)
                }
                LazyVGrid(columns: columns, spacing: 20){
                    
                    ForEach((viewModel2.courses2) , id: \.id) { categories in
                        
                        VStack{
                            
                            Button(action: {
                                DispatchQueue.main.async {
                                    
                                    url = categories.imageURL
                                    name = categories.name
                                    description = categories.description
                                    price = categories.price
                                    gramm = categories.weight
                                    self.activateModalView = true
                                    
                                    
                                }
                                
                            }, label: {
                                //                                    ForEach((viewModel2.courses2) , id: \.id) { i in
                                //                                        if i.tegs.rawValue == "C рыбой" {
                                //                                            URLImage2(urlString: i.imageURL)
                                //                                        }
                                //                                                .cornerRadius(10)
                                //
                                //                                        })
                                //                                        }
                                //                                    }
                                
                                URLImage2(urlString: categories.imageURL)
                                
                                    .cornerRadius(10)
                                
                            })
                            Text(categories.name)
                                .frame(width : 110 , height: 50)
                        }
                            
                        
                                .sheet(isPresented: $activateModalView) {
                                    
                                    NavigationView {
                                        VStack{
                                            HStack{
                                                Image("imageLike")
                                                    .padding(.leading , 200)
                                                Image("imageCross")
                                            }
                                            HStack{
                                                URLImage3(urlString: url)
                                                
                                            }
                                            Text(name)
                                                .font(.largeTitle)
                                            HStack {
                                                Text("\(price) руб." )
                                                Text("\(gramm) гр")
                                                    .padding(10)
                                            }
                                            
                                            Text(description)
                                            Button("Добавить в корзину") {
                                                UserDefaults.standard.set(naming, forKey: "name")
                                                UserDefaults.standard.set(price, forKey: "price")
                                                naming.append(name)
                                                price2.append(price)
                                                UserDefaults.standard.set(naming, forKey: "name")
                                                UserDefaults.standard.set(price, forKey: "price")
                                            }
                                            NavigationLink(destination: ShoppingView()) {
                                                Text("Hello")
                                            }
                                            
                                            
                                            .frame(width: 200 , height:  40)
                                            
                                            .foregroundColor(.white)
                                            .background(.blue)
                                            .cornerRadius(10)
                                            
                                        }
                                    }
                                    
                                    .presentationDetents(Set(heights))
                                    
                                }
                            
                         

                        }
   
                    }
                }
               }.padding(.horizontal)
                .onAppear() {
                    UserDefaults.standard.object(forKey: "name")
                    viewModel2.fetch2()
                    
                }
                
            }
        }
        
    


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfDishesView()
    }
}
