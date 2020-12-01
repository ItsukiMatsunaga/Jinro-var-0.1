//
//  FortuneResult.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/26.
//

import SwiftUI

struct FortuneResult: View {
    
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var isActiveSubView1 = false
    @State var isActiveSubView2 = false
    @State private var name:String = ""                       //名前を入れる
    @State private var name_job:String = ""                   //役職を入れる
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    var body: some View {
        ZStack{
            //Background
            Rectangle()//赤
                .foregroundColor(Color(red: 135/255, green: 206/255, blue: 235/255))
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("\(name)\nのメインカードは")
                    .font(.system(size: 25))
                    .frame(width: 300, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,20)
                    .onAppear(){
                        switch control.FortuneCnt{
                        case 1:
                            name = p1.name
                            name_job = p1.M_job
                        case 2:
                            name = p2.name
                            name_job = p2.M_job
                        case 3:
                            name = p3.name
                            name_job = p3.M_job
                        case 4:
                            name = p4.name
                            name_job = p4.M_job
                        default:
                            break
                        }
                    }
                Spacer()
                //画像表示
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white.opacity(0.9))
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth:4).shadow(radius: 10))
                Spacer()
                //処理後に名前を表示させる
                Text("\(name_job)")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,20)
                Spacer()
                
                Button(action: {
                    playSound(sound: "bottun", type: "mp3")
                    if control.PlayerCnt < 4 && control.SocyoCnt == 1{
                        isActiveSubView1.toggle()
                    }else if control.PlayerCnt == 4 && control.SocyoCnt == 1{
                        isActiveSubView2.toggle()
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
            }
            NavigationLink(destination:CheckPlayer_Mor(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control:control),isActive:$isActiveSubView1){
                EmptyView()
            }
            NavigationLink(destination:CheckGiron(p1:p1,p2:p2,p3:p3,p4:p4, job_rule: job_rule,control:control),isActive:$isActiveSubView2){
                EmptyView()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct FortuneResult_Previews: PreviewProvider {
    static var previews: some View {
        FortuneResult(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
