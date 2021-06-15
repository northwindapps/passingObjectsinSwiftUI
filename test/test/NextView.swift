//
//  ContentView.swift
//  test
//
//  Created by yujin on 2021/06/10.
//

import SwiftUI

struct NextView: View {
    @State var viewloaded = false
    var text:String?
    @EnvironmentObject var shipping : ShippingClass
    func enterData(){
        shipping.username = "Uncle Leo"
        shipping.email = "Jerry Seinfeld"
        shipping.package = "Audio"
        shipping.updated = true
    }
    var body: some View {
        Text("Good night, \(text!)")
                .padding().onAppear(){viewloaded = true}
            
            if viewloaded{
                Text("Good night, Jerry, and here's your package.").padding().onAppear(){enterData()}
            }
    }
}
