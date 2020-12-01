//
//  CheckFortune.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/26.
//

import SwiftUI

struct CheckFortune: View {
    
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var isActiveSubView = false
    @State private var showingAlert = true
    @State private var name01:String = ""                       //名前を入れる
    @State private var name02:String = ""                       //名前を入れる
    @State private var name03:String = ""                       //名前を入れる
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
                Text("誰か１人のメインカードを\n確認することができます。")
                    .font(.system(size: 25))
                    .frame(width: 350, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,20)
                Spacer()
                
                /********************************************************/
                NavigationLink(destination: FortuneResult(p1:p1,p2:p2,p3:p3,p4:p4, job_rule: job_rule,control:control),isActive: $isActiveSubView) {
                        EmptyView()
                    Button(action: {
                        switch name01{
                        case p1.name:
                            control.FortuneCnt = 1
                        case p2.name:
                            control.FortuneCnt = 2
                        case p3.name:
                            control.FortuneCnt = 3
                        case p4.name:
                            control.FortuneCnt = 4
                        default:
                            break
                        }
                        self.isActiveSubView.toggle()
                    }) {
                        Text("\(name01)")
                            .font(.system(size: 30))
                            .frame(width: 250, height: 100, alignment: .center)
                            .background(Color.white.opacity(0.9))
                            .border(Color.black,width: 7)
                            .foregroundColor(.black)
                            .onAppear(){
                                switch control.PlayerCnt{
                                case 1:
                                    name01 = p2.name
                                    name02 = p3.name
                                    name03 = p4.name
                                case 2:
                                    name01 = p1.name
                                    name02 = p3.name
                                    name03 = p4.name
                                case 3:
                                    name01 = p1.name
                                    name02 = p2.name
                                    name03 = p4.name
                                case 4:
                                    name01 = p1.name
                                    name02 = p2.name
                                    name03 = p3.name
                                default:
                                    break
                                }
                            }
                        }
                }
                
                /********************************************************/
                Spacer()
                
                NavigationLink(destination: FortuneResult(p1:p1,p2:p2,p3:p3,p4:p4, job_rule: job_rule,control:control),isActive: $isActiveSubView) {
                    EmptyView()
                    Button(action: {
                        switch name02{
                        case p1.name:
                            control.FortuneCnt = 1
                        case p2.name:
                            control.FortuneCnt = 2
                        case p3.name:
                            control.FortuneCnt = 3
                        case p4.name:
                            control.FortuneCnt = 4
                        default:
                            break
                        }
                        self.isActiveSubView.toggle()
                    }) {
                        Text("\(name02)")
                            .font(.system(size: 30))
                            .frame(width: 250, height: 100, alignment: .center)
                            .background(Color.white.opacity(0.9))
                            .border(Color.black,width: 7)
                            .foregroundColor(.black)
                        }
                    }
                
                Spacer()
                /********************************************************/
                NavigationLink(destination: FortuneResult(p1:p1,p2:p2,p3:p3,p4:p4, job_rule: job_rule,control:control),isActive: $isActiveSubView) {
                    EmptyView()
                    Button(action: {
                        switch name03{
                        case p1.name:
                            control.FortuneCnt = 1
                        case p2.name:
                            control.FortuneCnt = 2
                        case p3.name:
                            control.FortuneCnt = 3
                        case p4.name:
                            control.FortuneCnt = 4
                        default:
                            break
                        }
                        self.isActiveSubView.toggle()
                    }) {
                        Text("\(name03)")
                            .font(.system(size: 30))
                            .frame(width: 250, height: 100, alignment: .center)
                            .background(Color.white.opacity(0.9))
                            .border(Color.black,width: 7)
                            .foregroundColor(.black)
                        }
                    }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct CheckFortune_Previews: PreviewProvider {
    static var previews: some View {
        CheckFortune(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
