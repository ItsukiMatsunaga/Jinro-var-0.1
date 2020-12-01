//
//  CheckJinro.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/26.
//

import SwiftUI

struct CheckJinro: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var isActiveSubView1 = false
    @State var isActiveSubView2 = false
    @State private var name01:String = ""                       //名前を入れる
    @State private var name02:String = ""                       //名前を入れる
    @State private var Buttonuse = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    var body: some View {
        ZStack{
            //BackGround
            Rectangle()  //赤
                .foregroundColor(Color(red: 135/255, green: 206/255, blue: 235/255))
                .edgesIgnoringSafeArea(.all)  //全体にする
            VStack{
                Text("メインカードに人狼を選んだ\nプレイヤーは")
                    .font(.system(size: 25))
                    .frame(width: 350, height: 110, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.top)
                Spacer()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height:/*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack{
                    Text("\(name01)")
                        .font(.system(size: 30))
                        .frame(width: 300, height: 120, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20.0)
                        .padding(.bottom,50)
                    Text("\(name02)")
                        .font(.system(size: 30))
                        .frame(width: 300, height: 120, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20.0)
                        .padding(.top)
                }.onAppear(){
                    switch control.PlayerCnt{
                    case 1:
                        name01 = p1.name
                        if p2.M_job == "人狼"{
                            name02 = p2.name
                        }
                        if p3.M_job == "人狼"{
                            name02 = p3.name
                        }
                        if p4.M_job == "人狼"{
                            name02 = p4.name
                        }
                    case 2:
                        name01 = p2.name
                        if p1.M_job == "人狼"{
                            name02 = p1.name
                        }
                        if p3.M_job == "人狼"{
                            name02 = p3.name
                        }
                        if p4.M_job == "人狼"{
                            name02 = p4.name
                        }

                    case 3:
                        name01 = p3.name
                        if p2.M_job == "人狼"{
                            name02 = p2.name
                        }
                        if p1.M_job == "人狼"{
                            name02 = p1.name
                        }
                        if p4.M_job == "人狼"{
                            name02 = p4.name
                        }

                    case 4:
                        name01 = p4.name
                        if p2.M_job == "人狼"{
                            name02 = p2.name
                        }
                        if p3.M_job == "人狼"{
                            name02 = p3.name
                        }
                        if p1.M_job == "人狼"{
                            name02 = p1.name
                        }
                    default:
                        break
                    }
                }
                Spacer()
                Button(action: {
                    playSound(sound: "bottun", type: "mp3")
                    self.Buttonuse.toggle()
                    if control.PlayerCnt < 4 && control.SocyoCnt == 1{
                        self.isActiveSubView1.toggle()
                    }else if control.PlayerCnt == 4 && control.SocyoCnt == 1{
                        self.isActiveSubView2.toggle()
                    }
                }) {
                    Text("OK")
                        .font(.system(size: 30))
                        .frame(width: 150, height: 90, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        .padding()
                        .foregroundColor(.black)
                }
                Spacer()
                NavigationLink(destination:CheckPlayer_Mor(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control:control),isActive:$isActiveSubView1){
                    EmptyView()
                }
                NavigationLink(destination:CheckGiron(p1:p1,p2:p2,p3:p3,p4:p4, job_rule: job_rule,control:control),isActive:$isActiveSubView2){
                    EmptyView()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct CheckJinro_Previews: PreviewProvider {
    static var previews: some View {
        CheckJinro(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
