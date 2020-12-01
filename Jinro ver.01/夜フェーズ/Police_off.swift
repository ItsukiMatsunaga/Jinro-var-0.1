//
//  Police_off.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/29.
//

import SwiftUI

struct Police_off: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var isActiveSubView = false
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
                Text("残り\(timeRemaining_s)秒")
                    .font(.system(size: 25))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20.0)
                    .onAppear(){
                        playSound(sound: "night", type: "mp3")
                    }
                    .onReceive(timer_s){ _ in
                        if timeRemaining_s == 4{
                            playSound(sound: "countdown", type: "mp3")
                        }
                        if timeRemaining_s > 0 && timestop == true{
                            timeRemaining_s -= 1
                        }else if timeRemaining_s == 0{
                            self.timestop.toggle()
                            self.isActiveSubView.toggle()
                            self.timer_s.upstream.connect().cancel()  //キャンセル
                        }
                    }
                NavigationLink(destination:DJ_rule(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control: control),isActive: $isActiveSubView) {
                    EmptyView()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Police_off_Previews: PreviewProvider {
    static var previews: some View {
        Police_off(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(), job_rule: Control.Job_rule(), control: Control())
    }
}
