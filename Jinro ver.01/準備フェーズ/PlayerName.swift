//
//  PlayerName.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/08.
//

import SwiftUI




struct PlayerName: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var next = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    var body: some View {
        
        
        ZStack{
            //BackGround
            Rectangle()  //赤
                .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)  //全体にする
            
            //プレイヤー入力名（４人）
            VStack{
                Text("プレイヤー名入力")
                    .font(.system(size: 30))
                    .frame(width: 300, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,20)
                Spacer()
                
                //プレイヤー１
                TextField("プレイヤー１", text: $p1.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())  // 入力域のまわりを枠で囲む
                    .font(.system(size:25))
                    .keyboardType(.namePhonePad)
                    .frame(width: 300, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.all,50)
                    
                
                //プレイヤー2
                TextField("プレイヤー２", text: $p2.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())  // 入力域のまわりを枠で囲む
                    .font(.system(size:25))
                    .keyboardType(.namePhonePad)
                    .frame(width: 300, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.all,50)
                    
                
                //プレイヤー3
                TextField("プレイヤー３", text: $p3.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())  // 入力域のまわりを枠で囲む
                    .keyboardType(.namePhonePad)
                    .font(.system(size:25))
                    .frame(width: 300, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.all,50)
                    
                
                //プレイヤー４
                TextField("プレイヤー４", text: $p4.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())  // 入力域のまわりを枠で囲む
                    .keyboardType(.namePhonePad)
                    .font(.system(size:25))
                    .frame(width: 300, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.all,50)
                    
                
                Spacer()
                
                //OKボタン
                Button(action: {
                    self.next.toggle()
                    playSound(sound: "bottun", type: "mp3")
                }){
                    Text("OK")
                        .font(.system(size: 30))
                        .frame(width: 150, height: 90, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20)
                        .padding(.bottom,20)
                        .foregroundColor(.black)
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
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            NavigationLink(destination:CheckPlayer(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control:control),isActive:$next){
                EmptyView()
            }
        }.navigationBarBackButtonHidden(true)
    }
}


struct PlayerName_Previews: PreviewProvider {
    static var previews: some View {
            PlayerName(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())

    }
}
    
