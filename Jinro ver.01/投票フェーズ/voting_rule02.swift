//
//  voting_rule02.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/11/10.
//

import SwiftUI

struct voting_rule02: View {
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
        ZStack{//Background
            Rectangle()//赤
                .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("これから投票を行います。\n人狼が追放されると、市⺠チームの 勝ち\n市⺠(裏切り者含む)が追放されると人狼チームの勝ち\nおばけ が追放されると、おばけの1人勝ちとなります。\n\n また、メインカードに人狼がいないと思う場合、平和村に投票すること ができます。\n全員が平和村に投票すると,市⺠チームとおばけの勝利となります。")
                    .font(.system(size: 25))
                    .frame(width: 350, height: 500, alignment: .center)
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
                Spacer()
            }.onAppear(){
                control.PlayerCnt = 1
            }
            NavigationLink(destination:CheckPlayer_voting(p1:p1,p2:p2,p3:p3,p4:p4,job_rule: job_rule,control:control),isActive:$next){
                EmptyView()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct voting_rule02_Previews: PreviewProvider {
    static var previews: some View {
        voting_rule02(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
