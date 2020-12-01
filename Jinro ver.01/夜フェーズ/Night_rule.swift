//
//  Night_rule.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/26.
//

import SwiftUI

struct Night_rule: View {
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
                .foregroundColor(Color(red: 80/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)  //全体にする
            
            VStack{
                Text("夜のアクション")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,0)
                Spacer()
                
                Text("メインカードに\n警察とDJを選んだ\nプレイヤーはアクション を行います")
                    .font(.system(size: 25))
                    .frame(width: 350, height:200, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,0)
                Spacer()
                
                    Button(action:{
                        playSound(sound: "bottun", type: "mp3")
                        self.next.toggle()
                    }){
                    Text("OK")
                        .font(.system(size: 30))
                        .frame(width: 150, height: 90, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                        .padding(.bottom,20)
                        .foregroundColor(.black)
                    }
                Spacer()
            }
            NavigationLink(destination:Police_rule(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control: control),isActive: $next){
                EmptyView()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Night_rule_Previews: PreviewProvider {
    static var previews: some View {
        Night_rule(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(), job_rule: Control.Job_rule(), control: Control())
    }
}
