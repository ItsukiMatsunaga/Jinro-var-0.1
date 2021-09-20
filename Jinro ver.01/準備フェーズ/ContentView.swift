//
//  ContentView.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/09/29.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @State var start = false
    @State var rule = false
    var body: some View {
        NavigationView{
            ZStack{
                //BackGround
                Rectangle()  //赤
                    .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                    .edgesIgnoringSafeArea(.all)  //全体にする
                
                Rectangle()  //グレー
                    .foregroundColor(Color(red: 119/255, green: 136/255, blue: 153/255))
                    .rotationEffect(Angle(degrees: 121))
                    .edgesIgnoringSafeArea(.all)
                
                //Tittle
                VStack{
                    Text("人狼ドッチ")
                        .font(.system(size: 50))
                        .frame(width: 300, height: 100, alignment: .center)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20.0)
                        .padding(.top)
                        .onAppear(){
                            playSoundroup(sound: "open", type: "mp3")
                        }
                        
                    Text("ver.01")
                        .padding()
                    Spacer()
                    
                    //スタートボタ
                    Button(action: {
                        playSound(sound: "bottun", type: "mp3")
                        
                        self.start.toggle()
                        }){
                        Text("スタート")
                            .bold()
                            .font(.system(size: 30))
                            .frame(width: 190, height: 100, alignment: .center)
                            .foregroundColor(.black)
                            .background(Color.red.opacity(0.6))
                            .cornerRadius(20.0)
                            .padding()
                    }
                    Spacer()
                NavigationLink(destination:PlayerNumber(),isActive: $start){
                    
                }
                    
                    Button(action: {
                        playSound(sound: "bottun", type: "mp3")
                        self.rule.toggle()
                        }){
                        Text("ルール")
                            .bold()
                            .font(.system(size: 30))
                            .frame(width: 190, height: 100, alignment: .center)
                            .foregroundColor(.black)
                            .background(Color.red.opacity(0.6))
                            .cornerRadius(20.0)
                            .padding()
                    }

                    Spacer()
                }
                .padding()
            }
        }.navigationBarBackButtonHidden(true)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
