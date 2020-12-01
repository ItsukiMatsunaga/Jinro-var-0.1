//
//  voting_result.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/11/10.
//

import SwiftUI

struct voting_result: View {
    //****************************************
    
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var isActiveSubView = false
    @State var result:String = ""
    @State var name01:String = ""                        //名前を入れる
    @State var name01_Job:String = ""
    @State var next = false
    @State var Cnt = 0                          //投票数
    @State var Count = 0
    @State var name02:String = ""                        //名前を入れる
    @State var name02_Job:String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    var body: some View {
        ZStack{
            Rectangle()//赤
                .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("投票の結果")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20.0)
                    .onAppear(){
                            if p1.Vote>Cnt{
                                name01 = p1.name
                                control.JugJob01 = p1.M_job
                                Cnt = p1.Vote
                            }
                            if p2.Vote>Cnt{
                                name01 = p2.name
                                control.JugJob01 = p2.M_job
                                Cnt = p2.Vote
                            }
                            if p3.Vote>Cnt{
                                name01 = p3.name
                                control.JugJob01 = p3.M_job
                                Cnt = p3.Vote
                            }
                            if p4.Vote>Cnt{
                                name01 = p4.name
                                control.JugJob01 = p4.M_job
                                Cnt = p4.Vote
                            }
                        if p2.Vote == Cnt && p2.name != name01 && p2.Vote != 0{
                            name02="・"+p2.name
                            control.JugJob02 = p2.M_job
                        }
                        if p3.Vote == Cnt && p3.name != name01 && p3.Vote != 0{
                            name02="・"+p3.name
                            control.JugJob02 = p3.M_job
                        }
                        if p4.Vote == Cnt && p4.name != name01 && p4.Vote != 0{
                            name02="・"+p4.name
                            control.JugJob02 = p4.M_job
                        }
                    }
                Spacer()
                
                Text("\(name01)\(name02)\nが追放されました")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20.0)
                    .onAppear(){
                        control.JugPly01 = name01
                        control.JugPly02 = name02
                    }
                    
                
                Spacer()
                    Button(action: {
                        playSound(sound: "bottun", type: "mp3")
                        self.next.toggle()
                    }){
                        Text("OK")
                            .font(.system(size: 30))
                            .frame(width: 150, height: 90, alignment: .center)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(20.0)
                            .padding(.bottom,20)
                            .foregroundColor(.black)
                    }
                Spacer()
            }
        NavigationLink(destination:Result(p1:p1,p2:p2,p3:p3,p4:p4,job_rule: job_rule,control:control),isActive:$next) {
        }
        }.navigationBarBackButtonHidden(true)
    }
}

struct voting_result_Previews: PreviewProvider {
    static var previews: some View {
        voting_result(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
