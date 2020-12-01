//
//  Moring_rule.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/26.
//

import SwiftUI

struct Moring_rule: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var next = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    var body: some View {
        ZStack{
            //Background
            Rectangle()//赤
                .foregroundColor(Color(red: 135/255, green: 206/255, blue: 235/255))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("早朝のアクション")
                    .font(.system(size: 30))
                    .frame(width: 300, height: 100, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    
                Spacer()
                Text("メインカードに選んだ役職によってアクションを行います。\n人狼→人狼同士の顔合わせ\n占い師→誰か１人のメインカードの確認\nそれ以外→自分の役職の再確認")
                    .font(.system(size: 25))
                    .frame(width: 350, height: 350, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.vertical)
                Spacer()
                Button(action: {
                    playSound(sound: "bottun", type: "mp3")
                    self.next.toggle()
                }){
                    Text("OK")
                        .bold()
                        .font(.system(size: 30))
                        .frame(width: 190, height: 100, alignment: .center)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(20.0)
                }
                .onTapGesture {
                    playSound(sound: "bottun", type: "mp3")
                }
                Spacer()
                    .frame(width: 100, height: 200, alignment: .center)
            }.onAppear(){
                if control.SocyoCnt == 1 {
                    control.PlayerCnt = 0
                }
            }
            NavigationLink(destination:CheckPlayer_Mor(p1:p1,p2:p2,p3:p3,p4:p4,job_rule: job_rule,control:control),isActive:$next){
                EmptyView()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Moring_rule_Previews: PreviewProvider {
    static var previews: some View {
        Moring_rule(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
