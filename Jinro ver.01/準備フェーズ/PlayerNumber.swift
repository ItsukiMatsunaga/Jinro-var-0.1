//
//  PlayerNumber.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/05.
//

import SwiftUI

struct PlayerNumber: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var next = false
    var body: some View {
        ZStack{
            //BackGround
            Rectangle()  //赤
                .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)  //全体にする
            
            //プレイヤー人数
            VStack{
                Text("プレイヤー人数")
                    .font(.system(size: 30))
                    .frame(width: 300, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,20)
                Spacer()
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
                
                //４ボタン
                Button(action: {
                    self.next.toggle()
                    playSound(sound: "bottun", type: "mp3")
                }) {
                    Text("4")
                        .font(.system(size: 30))
                        .frame(width: 150, height: 70, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .border(Color.black,width: 7)
                        .foregroundColor(.black)
                    
                }
                Spacer()
                    .frame(width: 100, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                //5ボタン
                Button(action:{
                    self.next.toggle()
                    playSound(sound: "bottun", type: "mp3")
                }){
                    
                    Text("5")
                        .font(.system(size: 30))
                        .frame(width: 150, height: 70, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .border(Color.black,width: 7)
                        .foregroundColor(.black)
                    
                }
                Spacer()
                    .frame(width: 100, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                //6ボタン
                Button(action: {
                    self.next.toggle()
                    playSound(sound: "bottun", type: "mp3")
                }) {
                    
                    Text("6")
                        .font(.system(size: 30))
                        .frame(width: 150, height: 70, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .border(Color.black,width: 7)
                        .foregroundColor(.black)
                    
                }
                Spacer()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                     
                //戻るボタン
                HStack{
                    Button(action: {
                        playSound(sound: "bottun", type: "mp3")
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("戻る")
                            .font(.system(size: 30))
                            .frame(width: 150, height: 90, alignment: .center)
                            .background(Color.white.opacity(0.6))
                            .foregroundColor(.black)
                            .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                            Spacer()
                                .frame(width: 180, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    })
                }
                Spacer()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            NavigationLink(destination: SelectPlayer(),isActive:$next) {
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PlayerNumber_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerNumber()
        }
    }
}
