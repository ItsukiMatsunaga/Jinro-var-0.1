//
//  Result.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/11/10.
//

import SwiftUI

struct Result: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var isActiveSubView = false
    @State var result:String = ""                        //投票の結果
    @State var test:Int = 0
    @State var Jobply1:Int = 0
    @State var Jobply2:Int = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    var body: some View {
        ZStack{
            Rectangle()//赤
                .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("\(result)")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20.0)
                    .onAppear(){
                        switch control.JugJob01{
                        case "市民":
                            Jobply1=0
                        case "占い師":
                            Jobply1=0
                        case "警察":
                            Jobply1=0
                        case "DJ":
                            Jobply1=0
                        case "人狼":
                            Jobply1=1
                        case "裏切り":
                            Jobply1=1
                        case "お化け":
                            Jobply1=2
                        default:
                            break
                        }
                        switch control.JugJob02{
                        case "市民":
                            Jobply2=0
                        case "占い師":
                            Jobply2=0
                        case "警察":
                            Jobply2=0
                        case "DJ":
                            Jobply2=0
                        case "人狼":
                            Jobply2=1
                        case "裏切り":
                            Jobply2=1
                        case "お化け":
                            Jobply2=2
                        default:
                            break
                        }
                        
                        if Jobply1 == 1 || Jobply2 == 1{
                            result = "市民チームの勝利"
                        }else if Jobply1 == 2 || Jobply2 == 2{
                            result = "お化けチームの勝利"
                        }else if control.Pieace == 4{
                            if p1.team == 1 || p2.team == 1 || p3.team == 1 || p4.team == 1{
                                result = "人狼チームの勝利"
                            }else{
                                result = "市民・お化けチームの勝利"
                            }
                        }else{
                            result = "人狼チームの勝利"
                        }
                    }
                    
                HStack{
                    Spacer()
                    Text("メイン")
                        .font(.system(size: 15))
                        .frame(width: 100, height: 50, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        
                    Text("サブ")
                        .font(.system(size: 15))
                        .frame(width: 100, height: 50, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .padding()
                }
                HStack{
                    Text("\(p1.name)")
                        .font(.system(size: 25))
                        .frame(width: 150, height: 80, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        
                    Text("\(p1.M_job)")
                        .font(.system(size: 25))
                        .frame(width: 90, height: 80, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        .padding()
                    Text("\(p1.S_job)")
                        .font(.system(size: 25))
                        .frame(width: 90, height: 80, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                }
                
                HStack{
                    Text("\(p2.name)")
                        .font(.system(size: 25))
                        .frame(width: 150, height: 80, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        
                    Text("\(p2.M_job)")
                        .font(.system(size: 25))
                        .frame(width: 90, height: 80, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        .padding()
                    Text("\(p2.S_job)")
                        .font(.system(size: 25))
                        .frame(width: 90, height: 80, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                }
                
                HStack{
                    Text("\(p3.name)")
                        .font(.system(size: 25))
                        .frame(width: 150, height: 80, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        
                    Text("\(p3.M_job)")
                        .font(.system(size: 25))
                        .frame(width: 90, height: 80, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        .padding()
                    Text("\(p3.S_job)")
                        .font(.system(size: 25))
                        .frame(width: 90, height: 80, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                }
                
                HStack{
                    Text("\(p4.name)")
                        .font(.system(size: 25))
                        .frame(width: 150, height: 80, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        
                    Text("\(p4.M_job)")
                        .font(.system(size: 25))
                        .frame(width: 90, height: 80, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        .padding()
                    Text("\(p4.S_job)")
                        .font(.system(size: 25))
                        .frame(width: 90, height: 80, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                }
                .padding(.bottom,10)
                NavigationLink(destination:ContentView()) {
                    Text("HOME")
                        .font(.system(size: 25))
                        .frame(width: 200, height: 100, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        .foregroundColor(.black)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
