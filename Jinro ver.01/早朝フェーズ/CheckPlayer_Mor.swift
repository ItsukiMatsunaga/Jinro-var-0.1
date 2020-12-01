//
//  CheckPlayer_Mor.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/26.
//

import SwiftUI

struct CheckPlayer_Mor: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State private var showingAlert = false
    @State var isActiveSubView1 = false
    @State var isActiveSubView2 = false
    @State var isActiveSubView3 = false
    @State private var name:String = ""                        //名前を入れる
    @State private var name_Job:String = ""                        //名前を入れる
    @State private var Buttonuse = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    
    var body: some View {
        ZStack{
            //Background
            Rectangle()//赤
                .foregroundColor(Color(red: 135/255, green: 206/255, blue: 235/255))
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
                        case 0:
                            name = p1.name
                            name_Job = p1.M_job
                        case 1:
                            name = p2.name
                            name_Job = p2.M_job
                        case 2:
                            name = p3.name
                            name_Job = p3.M_job
                        case 3:
                            name = p4.name
                            name_Job = p4.M_job
                        default:
                            break
                        }
                    }
                
                Spacer()
                
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
                        if name_Job == "人狼"{
                            self.isActiveSubView1.toggle()
                        }else if name_Job == "占い師"{
                            self.isActiveSubView2.toggle()
                        }else{
                            self.isActiveSubView3.toggle()
                        }
                      }})   // 破壊的変更用
                }
                NavigationLink(destination:CheckJinro(p1:p1,p2:p2,p3:p3,p4:p4,job_rule: job_rule,control:control),isActive: $isActiveSubView1) {
                    EmptyView()
                }
                NavigationLink(destination:CheckFortune(p1:p1,p2:p2,p3:p3,p4:p4,job_rule: job_rule,control:control),isActive: $isActiveSubView2) {
                    EmptyView()
                }
                NavigationLink(destination:CheckOther(p1:p1,p2:p2,p3:p3,p4:p4,job_rule: job_rule,control:control),isActive: $isActiveSubView3) {
                    EmptyView()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct CheckPlayer_Mor_Previews: PreviewProvider {
    static var previews: some View {
        CheckPlayer_Mor(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
