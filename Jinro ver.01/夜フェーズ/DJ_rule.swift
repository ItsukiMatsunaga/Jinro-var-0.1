//
//  DJ_rule.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/29.
//

import SwiftUI

struct DJ_rule: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State private var job_01:String = ""
    @State private var job_01_rule:String = ""
    @State private var job_02:String = ""
    @State private var job_02_rule:String = ""
    @State var isActiveSubView = false
    @State var time_str = false
    @State var time_out = false
    @State var timeRemaining_s = 4
    let timer_s = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var player:String = ""                  //プレイヤー１
    @State var job:String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    var body: some View {
        ZStack{
            //BackGround
            Rectangle()  //赤
                .foregroundColor(Color(red: 80/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)  //全体にする
            
            VStack{
                Text("DJのアクション")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,0)
                    .onAppear(){
                        switch "DJ"{
                        case p1.M_job:
                            control.DJName = p1.name
                            control.DJCnt = 1
                            break
                        case p2.M_job:
                            control.DJName = p2.name
                            control.DJCnt = 2
                            break
                        case p3.M_job:
                            control.DJName = p3.name
                            control.DJCnt = 3
                            break
                        case p4.M_job:
                            control.DJName = p4.name
                            control.DJCnt = 4
                            break
                        default:
                        break
                        }
                    }
                Spacer()
                Text("全員が目を閉じた後、進行役の人がOKボタンを押して、DJの方は１５秒以内にアクションしてください。")
                    .font(.system(size: 30))
                    .frame(width: 370, height:250, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,0)
                Spacer()
                Text("残り\(timeRemaining_s)秒")
                    .font(.system(size: 25))
                    .frame(width:110, height:70, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20.0)
                    .padding(.top,0)
                    .onReceive(timer_s) { _ in
                        if timeRemaining_s > 0 && time_str == true{
                            timeRemaining_s -= 1
                        }else if timeRemaining_s == 0 && time_str == true{
                            self.time_str.toggle()
                            self.isActiveSubView.toggle()
                            self.timer_s.upstream.connect().cancel()  //キャンセル
                        }
                    }
                Spacer()
                
                Button(action:{
                    playSound(sound: "countdown", type: "mp3")
                    self.time_str.toggle()
                }){
                    Text("OK")
                        .font(.system(size: 30))
                        .frame(width: 150, height: 90, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                        .padding(.bottom,20)
                        .foregroundColor(.black)
                    if p1.M_job == "DJ" || p2.M_job == "DJ" || p3.M_job == "DJ" || p4.M_job == "DJ"{
                        NavigationLink(destination:DJ_on(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control: control),isActive: $isActiveSubView) {
                        }
                        
                    }else{
                        NavigationLink(destination:DJ_off(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control: control),isActive: $isActiveSubView){
                            
                        }
                    }
                }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct DJ_rule_Previews: PreviewProvider {
    static var previews: some View {
        DJ_rule(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(), job_rule: Control.Job_rule(), control: Control())
    }
}
