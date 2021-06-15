//
//  ContentView.swift
//  test
//
//  Created by yujin on 2021/06/10.
//

import SwiftUI

class ShippingClass: ObservableObject {
    @Published var username: String?
    @Published var email: String?
    @Published var package: String?
    @Published var updated: Bool?
    init(){
        username = ""
        email = ""
        package = ""
        updated = false
        print("init")
    }
}

struct ContentView: View {
    @State var viewloaded = false
    @State var movetoanotherview = false
    @StateObject var shipping = ShippingClass()
    var body: some View {
        NavigationView{
            ScrollView{
                Text("Hello, Jerry!")
                    .padding().onAppear(){
                        viewloaded = true
                }
                if viewloaded{
                    Text("Hello, Newman").padding().onAppear(){print(shipping.username as Any)}
                
                    Rectangle().frame(width: UIScreen.main.bounds.width * 0.9, height: 600, alignment: .topLeading).foregroundColor(Color.gray)
                    
                    NavigationLink("NextView",destination:NextView(text:"Newman"),isActive:$movetoanotherview)
                }
                if shipping.updated!{
                    Text("You have a Package.")
                        .padding()
                }
            }
        }.padding().environmentObject(shipping)
    }
}
