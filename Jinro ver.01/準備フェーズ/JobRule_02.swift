//
//  JobRule_02.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/12.
//

import SwiftUI

struct JobRule_02: View {
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
    @State var next = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    var body: some View {
        ZStack{
            //BackGround
            Rectangle()  //赤
                .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)  //全体にする
            
            
            //選ばれた役職の説明
            VStack{
                VStack{
                    Text("\(job_01)")
                        .font(.system(size: 40))
                        .padding(.bottom,20)
                    Text("\(job_01_rule)")
                }
                .font(.system(size: 25))
                .frame(width: 370, height: 300, alignment: .center)
                .background(Color.white.opacity(0.9))
                .cornerRadius(20.0)
                .padding(.top,0)
                .onAppear(){
                    switch control.PlayerCnt{
                    case 1:
                        job_01 = p1.M_job
                    case 2:
                        job_01 = p2.M_job
                    case 3:
                        job_01 = p3.M_job
                    case 4:
                        job_01 = p4.M_job
                    default:
                        break
                    }
                    switch control.PlayerCnt{
                    case 1:
                        job_01_rule = p1.M_job_rule
                    case 2:
                        job_01_rule = p2.M_job_rule
                    case 3:
                        job_01_rule = p3.M_job_rule
                    case 4:
                        job_01_rule = p4.M_job_rule
                    default:
                        break
                    }
                }
                
                
                Spacer()
                    .frame(width: 50, height: 30, alignment: .center)
                
                
                //選ばれた役職の説明
                VStack{
                    Text("\(job_02)")
                        .font(.system(size: 40))
                        .padding(.bottom,20)
                    Text("\(job_02_rule)")
                }
                .font(.system(size: 25))
                .frame(width: 370, height: 300, alignment: .center)
                .background(Color.white.opacity(0.9))
                .cornerRadius(20.0)
                .padding(.top,0)
                .onAppear(){
                    switch control.PlayerCnt{
                    case 1:
                        job_02 = p1.S_job
                    case 2:
                        job_02 = p2.S_job
                    case 3:
                        job_02 = p3.S_job
                    case 4:
                        job_02 = p4.S_job
                    default:
                        break
                    }
                    switch control.PlayerCnt{
                    case 1:
                        job_02_rule = p1.S_job_rule
                    case 2:
                        job_02_rule = p2.S_job_rule
                    case 3:
                        job_02_rule = p3.S_job_rule
                    case 4:
                        job_02_rule = p4.S_job_rule
                    default:
                        break
                    }
                }

                
                Spacer()
                
                //OKボタン
                Button(action: {
                    playSound(sound: "bottun", type: "mp3")
                    self.next.toggle()
                }) {
                        Text("OK")
                            .font(.system(size: 30))
                            .frame(width: 150, height: 90, alignment: .center)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(20)
                            .padding()
                            .foregroundColor(.black)
                }
            }
            NavigationLink(destination:JobSelect(p1:p1,p2:p2,p3:p3,p4:p4,job_rule: job_rule,control:control),isActive: $next){
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct JobRule_02_Previews: PreviewProvider {
    static var previews: some View {
        JobRule_02(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(), job_rule: Control.Job_rule(), control: Control())
    }
}
