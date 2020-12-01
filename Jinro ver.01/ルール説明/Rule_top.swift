//
//  Rule_top.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/11/19.
//

import SwiftUI

struct Rule_top: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            //Background
            Rectangle()//赤
                .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                NavigationLink(destination: gaiyou()){
                    Text("概要")
                        .font(.system(size: 30))
                        .frame(width: 190, height: 100, alignment: .center)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(20.0)
                }
                Spacer()
                NavigationLink(destination: gamesinkou()){
                    Text("ゲーム進行")
                        .font(.system(size: 30))
                        .frame(width: 190, height: 100, alignment: .center)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(20.0)
                }
                Spacer()
                NavigationLink(destination: yakusyoku()){
                    Text("役職一覧")
                        .font(.system(size: 30))
                        .frame(width: 190, height: 100, alignment: .center)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(20.0)
                }
                Spacer()
                NavigationLink(destination: shouhai()){
                    Text("勝敗のQ&A")
                        .font(.system(size: 30))
                        .frame(width: 190, height: 100, alignment: .center)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(20.0)
                }
                
                //戻るボタン
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                    Text("戻る")
                        .font(.system(size: 30))
                        .frame(width: 150, height: 90, alignment: .center)
                        .background(Color.white.opacity(0.6))
                        .foregroundColor(.black)
                        .cornerRadius(20.0)
                    Spacer()
                        .frame(width: 180, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    })
                }.padding()

            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Rule_top_Previews: PreviewProvider {
    static var previews: some View {
        Rule_top()
    }
}
