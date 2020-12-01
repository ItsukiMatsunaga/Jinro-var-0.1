//
//  CheckPlayer_voting.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/11/10.
//

import SwiftUI

struct CheckPlayer_voting: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State private var showingAlert = false
    @State var isActiveSubView = false
    @State var name:String = ""                        //名前を入れる
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    var body: some View {
        ZStack{//Background
            Rectangle()//赤
                .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("このプレイヤーに端末を渡してください")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,0)
                    .onAppear(){
                        control.PlayerCnt += 1
                    }
                Spacer()
                //画像表示
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white.opacity(0.9))
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth:4).shadow(radius: 10))
                Spacer()
                //処理後に名前を表示させる
                Text("\(name)")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,20)
                    .onAppear(){
                        switch control.PlayerCnt{
                        case 1:
                            name = p1.name
                            
                        case 2:
                            name = p2.name
                            
                        case 3:
                            name = p3.name
                            
                        case 4:
                            name = p4.name
                        default:
                            break
                        }
                        control.TohyoName = name
                    }
                Spacer()
                //OKボタン
                    Button(action: {
                        playSound(sound: "bottun", type: "mp3")
                        self.showingAlert.toggle()
                    }) {
                        Text("OK")
                            .font(.system(size: 30))
                            .frame(width: 150, height: 90, alignment: .center)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(20)
                            .padding()
                            .foregroundColor(.black)
                    }.alert(isPresented: $showingAlert) {
                        Alert(title: Text("確認"),
                          message: Text("\(name)でよろしいですか？"),
                          primaryButton: .cancel(Text("キャンセル")),    // キャンセル用
                          secondaryButton: .default(Text("はい")){action:do {
                            self.isActiveSubView.toggle()
                          }})   // 破壊的変更用
                    }
                NavigationLink(destination:voting_on(p1:p1,p2:p2,p3:p3,p4:p4,job_rule: job_rule,control:control),isActive: $isActiveSubView) {
                    EmptyView()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct CheckPlayer_voting_Previews: PreviewProvider {
    static var previews: some View {
        CheckPlayer_voting(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
