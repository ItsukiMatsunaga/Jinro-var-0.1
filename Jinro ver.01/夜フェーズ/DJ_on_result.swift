//
//  DJ_on_result.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/29.
//

import SwiftUI

struct DJ_on_result: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var player:String = ""                  //プレイヤー
    @State var isActiveSubView = false
    @State var timestop = true
    @State var timecnt = true
    @State var timeRemaining_sa = 6
    let timer_sa = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    var body: some View {
        ZStack{
            //BackGround
            Rectangle()  //赤
                .foregroundColor(Color(red: 80/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)  //全体にする
            
            VStack{
                Text("\(player)\nのカードを入れ替えました")
                    .font(.system(size: 25))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20.0)
                    .padding(.bottom,70)
                    .onAppear(){
                        player = control.DJName
                        if timecnt == true{
                           timeRemaining_sa = control.DJTime
                           timecnt.toggle()
                       }
                    }
                Text("残り\(timeRemaining_sa)秒")
                    .font(.system(size:30))
                    .onReceive(timer_sa){ _ in
                        if timeRemaining_sa == 4{
                            playSound(sound: "countdown", type: "mp3")
                        }
                        if timeRemaining_sa > 0{
                            timeRemaining_sa -= 1
                        }else if timeRemaining_sa == 0 && timestop == true{
                            self.timer_sa.upstream.connect().cancel()  //キャンセル
                            self.timestop.toggle()
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

struct DJ_on_result_Previews: PreviewProvider {
    static var previews: some View {
        DJ_on_result(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(), job_rule: Control.Job_rule(), control: Control())
    }
}
