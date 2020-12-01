//
//  DJ_on.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/29.
//

import SwiftUI

struct DJ_on: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var isActiveSubView = false
    @State var isActiveSubView01 = false
    @State var isActiveSubView02 = false
    @State var isActiveSubView03 = false
    @State var player01:String = ""                  //プレイヤー１
    @State var player02:String = ""                  //プレイヤー２
    @State var player03:String = ""                  //プレイヤー３
    @State var ch_job = ""                  //入れ替え
    @State var timestop = true
    @State var timeRemaining_s = 15
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
                Text("誰か1人のカード入れ替えることができます")
                    .font(.system(size: 25))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20.0)
                    .onAppear(){
                        playSound(sound: "night", type: "mp3")
                        switch control.DJCnt{
                        case 1:
                            player01 = p2.name
                            player02 = p3.name
                            player03 = p4.name
                        case 2:
                            player01 = p1.name
                            player02 = p3.name
                            player03 = p4.name
                        case 3:
                            player01 = p1.name
                            player02 = p2.name
                            player03 = p4.name
                        case 4:
                            player01 = p1.name
                            player02 = p2.name
                            player03 = p3.name
                        default:
                            break
                        }
                    }
                
                Spacer()
                NavigationLink(destination:DJ_on_result(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control: control),isActive: $isActiveSubView01) {
                    EmptyView()
                    Button(action: {
                        switch player01{
                        case p1.name:
                            ch_job = p1.M_job
                            p1.M_job = p1.S_job
                            p1.S_job = ch_job
                        case p2.name:
                            ch_job = p2.M_job
                            p2.M_job = p2.S_job
                            p2.S_job = ch_job
                        case p3.name:
                            ch_job = p3.M_job
                            p3.M_job = p3.S_job
                            p3.S_job = ch_job
                        case p4.name:
                            ch_job = p4.M_job
                            p4.M_job = p4.S_job
                            p4.S_job = ch_job
                        default:
                            break
                        }
                        control.DJName = player01
                        self.isActiveSubView01.toggle()
                        self.timestop.toggle()
                        control.DJTime = timeRemaining_s - 1
                        self.timer_s.upstream.connect().cancel()  //キャンセル
                    }) {
                            Text("\(player01)")
                                .font(.system(size: 30))
                                .frame(width: 320, height: 100, alignment: .center)
                                .background(Color.white.opacity(0.9))
                                .border(Color.black,width: 7)
                                .foregroundColor(.black)
                                .padding(.top,0)
                    }
                }
                Spacer()
                NavigationLink(destination:DJ_on_result(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control: control),isActive: $isActiveSubView02) {
                    EmptyView()
                    Button(action: {
                        switch player02{
                        case p1.name:
                            ch_job = p1.M_job
                            p1.M_job = p1.S_job
                            p1.S_job = ch_job
                        case p2.name:
                            ch_job = p2.M_job
                            p2.M_job = p2.S_job
                            p2.S_job = ch_job
                        case p3.name:
                            ch_job = p3.M_job
                            p3.M_job = p3.S_job
                            p3.S_job = ch_job
                        case p4.name:
                            ch_job = p4.M_job
                            p4.M_job = p4.S_job
                            p4.S_job = ch_job
                        default:
                            break
                        }
                        control.DJName = player02
                        self.isActiveSubView02.toggle()
                        self.timestop.toggle()
                        control.DJTime = timeRemaining_s - 1
                        self.timer_s.upstream.connect().cancel()  //キャンセル
                    }) {
                            Text("\(player02)")
                                .font(.system(size: 30))
                                .frame(width: 320, height: 100, alignment: .center)
                                .background(Color.white.opacity(0.9))
                                .border(Color.black,width: 7)
                                .foregroundColor(.black)
                                .padding(.top,0)
                    }
                }
                Spacer()
                NavigationLink(destination:DJ_on_result(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control: control),isActive: $isActiveSubView03) {
                    EmptyView()
                    Button(action: {
                        switch player03{
                        case p1.name:
                            ch_job = p1.M_job
                            p1.M_job = p1.S_job
                            p1.S_job = ch_job
                        case p2.name:
                            ch_job = p2.M_job
                            p2.M_job = p2.S_job
                            p2.S_job = ch_job
                        case p3.name:
                            ch_job = p3.M_job
                            p3.M_job = p3.S_job
                            p3.S_job = ch_job
                        case p4.name:
                            ch_job = p4.M_job
                            p4.M_job = p4.S_job
                            p4.S_job = ch_job
                        default:
                            break
                        }
                        control.DJName = player03
                        self.isActiveSubView03.toggle()
                        self.timestop.toggle()
                        control.DJTime = timeRemaining_s - 1
                        self.timer_s.upstream.connect().cancel()  //キャンセル
                    }) {
                            Text("\(player03)")
                                .font(.system(size: 30))
                                .frame(width: 320, height: 100, alignment: .center)
                                .background(Color.white.opacity(0.9))
                                .border(Color.black,width: 7)
                                .foregroundColor(.black)
                                .padding(.top,0)
                    }
                }
                Spacer()
                Text("残り\(timeRemaining_s)秒")
                    .font(.system(size:40))
                    .padding(.bottom,30)
                    .onReceive(timer_s){ _ in
                        if timeRemaining_s == 4{
                            playSound(sound: "countdown", type: "mp3")
                        }
                        if timeRemaining_s > 0 && timestop == true{
                            timeRemaining_s -= 1
                        }else if timeRemaining_s == 0{
                            self.timer_s.upstream.connect().cancel()  //キャンセル
                            self.isActiveSubView.toggle()
                        }
                    }
                NavigationLink(destination:voting_rule(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control: control),isActive: $isActiveSubView) {
                    EmptyView()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct DJ_on_Previews: PreviewProvider {
    static var previews: some View {
        DJ_on(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(), job_rule: Control.Job_rule(), control: Control())
    }
}
