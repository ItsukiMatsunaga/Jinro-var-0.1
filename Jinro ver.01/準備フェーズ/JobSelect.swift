//
//  JobSelect.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/12.
//

import SwiftUI
struct JobSelect: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var isActiveSubView1 = false
    @State var isActiveSubView2 = false
    @State var isActiveSubView3 = false
    @State var isActiveSubView4 = false
    @State private var job_01:String = ""
    @State private var job_02:String = ""
    @State private var image01 = ""
    @State private var image02 = ""
    @State private var job_cha:String = ""          //メインとサブを入れ替える用
    @State private var Buttonuse:Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    var body: some View {
        
        ZStack{
            //BackGround
            Rectangle()  //赤
                .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)  //全体にする
            
            VStack{
                
                Text("メイン役職を\n選んでください")
                    .font(.system(size: 26))
                    .frame(width: 320, height: 90, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,0)
                    
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
                
                Text("\(job_01)")
                    .font(.system(size: 30))
                    .frame(width: 300, height: 70, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20.0)
                    .padding(.bottom,10)
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
                
                
                Text("\(job_02)")
                    .font(.system(size: 30))
                    .frame(width: 300, height: 70, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20.0)
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
                
                Spacer()
                
                //＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
                HStack{
                    Button(action:{
                        playSound(sound: "bottun", type: "mp3")
                        if control.PlayerCnt < 4 && control.SocyoCnt == 0{
                            self.isActiveSubView1.toggle()
                        }else{
                            control.SocyoCnt = 1
                            self.isActiveSubView2.toggle()
                        }
                    }){
                        Text("\(job_01)")
                            .font(.system(size: 30))
                            .frame(width: 150, height: 90, alignment: .center)
                            .background(Color.white.opacity(0.9))
                            .border(Color.black,width: 7)
                            .padding()
                            .foregroundColor(.black)
                            .onAppear(){
                                self.Buttonuse.toggle()
                            }
                    }
                    Button(action:{
                        playSound(sound: "bottun", type: "mp3")
                        job_cha = job_01
                        switch control.PlayerCnt{
                            case 1:
                                p1.M_job = p1.S_job
                                p1.S_job = job_cha
                            case 2:
                                p2.M_job = p2.S_job
                                p2.S_job = job_cha
                            case 3:
                                p3.M_job = p3.S_job
                                p3.S_job = job_cha
                            case 4:
                                p4.M_job = p4.S_job
                                p4.S_job = job_cha
                            default:
                                break
                            }
                        if control.PlayerCnt < 4 && control.SocyoCnt==0{
                            self.isActiveSubView1.toggle()
                        }else{
                            control.SocyoCnt = 1
                            self.isActiveSubView2.toggle()
                        }
                    }){
                        Text("\(job_02)")
                            .font(.system(size: 30))
                            .frame(width: 150, height: 90, alignment: .center)
                            .background(Color.white.opacity(0.9))
                            .border(Color.black,width: 7)
                            .padding()
                            .foregroundColor(.black)
                            .onAppear(){
                                self.Buttonuse.toggle()
                            }
                        }
                    }.onAppear(){
                    if Buttonuse == true{
                        switch control.PlayerCnt{
                        case 1:
                            job_cha = p1.M_job
                            p1.M_job = p1.S_job
                            p1.S_job = job_cha
                            self.Buttonuse.toggle()
                        case 2:
                            job_cha = p2.M_job
                            p2.M_job = p2.S_job
                            p2.S_job = job_cha
                            self.Buttonuse.toggle()
                        case 3:
                            job_cha = p3.M_job
                            p3.M_job = p3.S_job
                            p3.S_job = job_cha
                            self.Buttonuse.toggle()
                        case 4:
                            job_cha = p4.M_job
                            p4.M_job = p4.S_job
                            p4.S_job = job_cha
                            self.Buttonuse.toggle()
                            
                        default:
                            break
                        }
                    }
                }
                NavigationLink(destination:CheckPlayer(p1:p1,p2:p2,p3:p3,p4:p4,job_rule: job_rule,control: control),isActive: $isActiveSubView1) {
                    EmptyView()
                }
                NavigationLink(destination:Moring_rule(p1:p1,p2:p2,p3:p3,p4:p4,job_rule: job_rule,control: control),isActive: $isActiveSubView2) {
                    EmptyView()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct JobSelect_Previews: PreviewProvider {
    static var previews: some View {
        JobSelect(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
