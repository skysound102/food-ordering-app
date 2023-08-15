//
//  DishView.swift
//  TestApp
//
//  Created by Артем on 17.07.2023.
//

import SwiftUI
 var naming = [String]()
 var price2 = [Int]()


struct ShoppingView: View {
   @State var code = [String]()
    @State var code2 = [Int]()
  
    var body: some View {
      
   
          
                VStack{
                    ForEach((code) , id: \.self) { i in
                    Text("jj")
                    Text(i)
                }
                
            }.onAppear {
                print("hello9")
                self.code = naming
                self.code2 = price2
                 guard let a = UserDefaults.standard.object(forKey: "name") else {return}
                guard let a2 = UserDefaults.standard.object(forKey: "price") else {return}
                 
                 naming = a as? [String] ?? [""]
                price2 = a2 as? [Int] ?? [0]
                 print(a as? [String] ?? [""])
                self.code = naming
                self.code2 = price2
             }
          
            
        
    }
}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingView()
    }
}
