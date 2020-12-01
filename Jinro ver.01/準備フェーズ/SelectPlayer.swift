//
//  SelectPlayer.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/06.
//

import SwiftUI

struct SelectPlayer: View {
    //****************************************
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var next = false
    //****************************************
    var body: some View {
            ZStack{
                //BackGround
                Rectangle()  //赤
                    .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                    .edgesIgnoringSafeArea(.all)  //全体にする
                
                VStack{
                    
                    Text("役職内訳")
                        .font(.system(size: 30))
                        .frame(width: 300, height: 100, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                        .padding(.top,10)
                        
                    
                    //４人の場合
                    VStack{
                        Text("人狼 x 2")
                            .padding(.bottom,5)
                        Text("市民 x 2")
                            .padding(.bottom,5)
                        Text("占い師 x 1")
                            .padding(.bottom,5)
                        Text("警察 x 1")
                            .padding(.bottom,5)
                        Text("DJ x 1")
                            .padding(.bottom,5)
                        Text("おばけ x 1")
                            .padding(.bottom,5)
                    }.font(.system(size: 30))
                    .frame(width: 300, height:320, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding()
                    
                    
                    
                    //５人の場合
                    
                    //６人の場合
                    
                    
                    //OKボタン
                    Button(action: {
                        self.next.toggle()
                        playSound(sound: "bottun", type: "mp3")
                    }){
                        Text("OK")
                            .font(.system(size: 30))
                            .frame(width: 150, height: 90, alignment: .center)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(20)
                            .padding()
                    }
                    //戻るボタン
                    HStack {
                        Button(action: {
                            playSound(sound: "bottun", type: "mp3")
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
                    }
                    
                    
                    
                    Spacer()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .frame(width:330, height: 840)
                NavigationLink(destination: PlayerName(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control()),isActive:$next){
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}

struct SelectPlayer_Previews: PreviewProvider {
    static var previews: some View {
        SelectPlayer()
    }
}
