//
//  Police_rule.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/26.
//

import SwiftUI

struct Police_rule: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var isActiveSubView = false
    @State private var job_01:String = ""
    @State private var job_01_rule:String = ""
    @State private var job_02:String = ""
    @State private var job_02_rule:String = ""
    @State var time_str = false
    @State var time_out = false
    @State var timeRemaining_s = 4
    let timer_s = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    var body: some View {
        ZStack{
            //BackGround
            Rectangle()  //赤
                .foregroundColor(Color(red: 80/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)  //全体にする
            
            VStack{
                Text("警察のアクション")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,0)
                    .onAppear(){
                        switch "警察"{
                        case p1.M_job:
                            control.PoliceName = p1.name
                            control.PoliceCnt = 1
                            break
                        case p2.M_job:
                            control.PoliceName = p2.name
                            control.PoliceCnt = 2
                            break
                        case p3.M_job:
                            control.PoliceName = p3.name
                            control.PoliceCnt = 3
                            break
                        case p4.M_job:
                            control.PoliceName = p4.name
                            control.PoliceCnt = 4
                            break
                        default:
                        break
                        }
                    }
                Spacer()
                Text("全員が目を閉じた後、OKボタンを押して、警察の方は１５秒以内にアクションしてください。")
                    .font(.system(size: 25))
                    .frame(width: 350, height:160, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20.0)
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
                    self.time_str.toggle()
                    playSound(sound: "countdown", type: "mp3")
                }){
                    Text("OK")
                        .font(.system(size: 30))
                        .frame(width: 150, height: 90, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                        .padding(.bottom,20)
                        .foregroundColor(.black)
                    if p1.M_job == "警察" || p2.M_job == "警察" || p3.M_job == "警察" || p4.M_job == "警察"{
                        NavigationLink(destination:Police_on(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control: control),isActive: $isActiveSubView) {
                        }
                        
                    }else{
                        NavigationLink(destination:Police_off(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control: control),isActive: $isActiveSubView){
                            
                        }
                    }
                }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Police_rule_Previews: PreviewProvider {
    static var previews: some View {
        Police_rule(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(), job_rule: Control.Job_rule(), control: Control())
    }
}
