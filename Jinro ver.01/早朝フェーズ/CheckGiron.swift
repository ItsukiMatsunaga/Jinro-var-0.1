//
//  CheckGiron.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/26.
//

import SwiftUI

struct CheckGiron: View {
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
                Text("それでは議論を始めます")
                    .font(.system(size: 25))
                    .frame(width: 300, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,20)
                Spacer()
                Text("市民チームは、誰が人狼かを探ります。人狼チームやおばけは、市民や能力者になりすまします。回をうまく説得して、信頼を集めましょう。\n\nそれでは3分から始めます。")
                    .font(.system(size: 25))
                    .frame(width: 350, height: 280, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                Spacer()
                Button(action: {
                    playSound(sound: "bottun", type: "mp3")
                    self.next.toggle()
                }){
                    Text("OK")
                        .font(.system(size: 30))
                        .frame(width: 150, height: 90, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                        .padding()
                        .foregroundColor(.black)
                }
                Spacer()
            }
            NavigationLink(destination:Discussion(p1:p1,p2:p2,p3:p3,p4:p4, job_rule: job_rule,control:control),isActive:$next){
                EmptyView()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct CheckGiron_Previews: PreviewProvider {
    static var previews: some View {
        CheckGiron(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
