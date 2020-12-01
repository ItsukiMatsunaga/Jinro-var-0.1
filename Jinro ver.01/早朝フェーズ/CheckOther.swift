//
//  CheckOther.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/26.
//

import SwiftUI

struct CheckOther: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var isActiveSubView1 = false
    @State var isActiveSubView2 = false
    @State private var job_01:String = ""
    @State private var job_02:String = ""
    @State private var image01 = ""
    @State private var image02 = ""
    @State private var Buttonuse = false
    @State private var a = CheckGiron.self
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************

    var body: some View {
        ZStack{
            //Background
            Rectangle()//赤
                .foregroundColor(Color(red: 135/255, green: 206/255, blue: 235/255))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("あなた の 役 職")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 60, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,0)
                //画像表示
                HStack{
                    Spacer()
                    //画像表示
                    Image("\(image01)")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.white.opacity(0.9))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white,lineWidth:4).shadow(radius: 10))
                        .padding()
                        .onAppear(){
                            switch job_01{
                            case "人狼":
                                image01 = "狼のアイコン"
                            case "市民":
                                image01 = "スタンダードな人のアイコン素材"
                            case "占い師":
                                image01 = "占い師アイコン1"
                            case "警察":
                                image01 = "警官のアイコン1"
                            case "DJ":
                                image01 = "DJアイコン2"
                            case "お化け":
                                image01 = "ゴーストアイコン2"
                            default:
                                break
                            }
                        }
                    
                    Text("メイン")
                        .font(.system(size: 20))
                        .frame(width: 70, height: 100, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                        .padding(.leading,05)
                    Spacer()
                        .frame(width: 30, height: 0)
                }
                
                //選ばれた役職を表示
                Text("\(job_01)")
                    .font(.system(size: 30))
                    .frame(width: 200, height: 70, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
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
                    }
                Spacer()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                //画像表示
                HStack{
                    Spacer()
                    //画像表示
                    Image("\(image02)")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.white.opacity(0.9))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white,lineWidth:4).shadow(radius: 10))
                        .padding()
                        .onAppear(){
                            switch job_02{
                            case "人狼":
                                image02 = "狼のアイコン"
                            case "市民":
                                image02 = "スタンダードな人のアイコン素材"
                            case "占い師":
                                image02 = "占い師アイコン1"
                            case "警察":
                                image02 = "警官のアイコン1"
                            case "DJ":
                                image02 = "DJアイコン2"
                            case "お化け":
                                image02 = "ゴーストアイコン2"
                            default:
                                break
                            }
                        }
                    
                    Text("サブ")
                        .font(.system(size: 20))
                        .frame(width: 70, height: 100, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                        .padding(.leading,05)
                    Spacer()
                        .frame(width: 30, height: 0)
                }
                
                //選ばれた役職を表示
                Text("\(job_02)")
                    .font(.system(size: 30))
                    .frame(width: 200, height: 70, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
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
                    }
                
                
                    //OKボタン
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

struct CheckOther_Previews: PreviewProvider {
    static var previews: some View {
        CheckOther(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
