//
//  CheckPlayer.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/08.
//

import SwiftUI

struct CheckPlayer: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State private var showingAlert = false
    @State var isActiveSubView = false
    @State private var name:String = ""                        //名前を入れる
    @State private var Buttonuse = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    //役職のルールを割り当て
    func Rule(job:String) -> String {
        var rule:String = ""
        for i in 0..<8 {
            if control.Job[i] == job{
                switch control.Job[i] {
                case "人狼":
                    rule=job_rule.Jinro
                    break
                case "市民":
                    rule=job_rule.Simin
                    break
                case "占い師":
                    rule=job_rule.Uranai
                    break
                case "警察":
                    rule=job_rule.Keisatu
                    break
                case "DJ":
                    rule=job_rule.DJ
                    break
                case "お化け":
                    rule=job_rule.Obake
                    break
                case "裏切り":
                    rule=job_rule.Uragiri
                    break
                default:
                    break
                }
            }
        }
        return rule
    }
    
    var body: some View {
        
        ZStack{
            //BackGround
            Rectangle()  //赤
                .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)  //全体にする
            
            VStack{
                
                
                Text("このプレイヤーに端末を渡してください")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,0)
                Spacer()
                
                //画像表示
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white.opacity(0.9))
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth:4).shadow(radius: 10))
                Spacer()
                
                //処理後に名前を表示させる
                Text("\(name)")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .padding(.top,20)
                    .onAppear(){
                        switch control.PlayerCnt{
                        case 0:
                            name = p1.name
                        case 1:
                            name = p2.name
                        case 2:
                            name = p3.name
                        case 3:
                            name = p4.name
                        default:
                            control.SocyoCnt = 1
                            break
                        }
                    }
                Spacer()
                
                //OKボタン
                    Button(action: {
                        playSound(sound: "bottun", type: "mp3")
                        self.Buttonuse.toggle()
                        self.showingAlert.toggle()
                    }) {
                        Text("OK")
                            .font(.system(size: 30))
                            .frame(width: 150, height: 90, alignment: .center)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(20)
                            .padding()
                            .foregroundColor(.black)
                    }.alert(isPresented: $showingAlert) {
                        Alert(title: Text("確認"),
                          message: Text("\(name)でよろしいですか？"),
                          primaryButton: .cancel(Text("キャンセル")),    // キャンセル用
                          secondaryButton: .default(Text("はい")){action:do {
                            self.isActiveSubView.toggle()
                          }})   // 破壊的変更用
                    }  
            }
            .onAppear(){
                self.control.PlayerCnt += 1
                if self.control.PlayerCnt == 1{
                    control.Job.shuffle()
                }
                switch control.PlayerCnt{
                case 1:
                    p1.M_job=control.Job[0]
                    p1.M_job_rule=Rule(job: control.Job[0])
                    self.control.Job_Cnt += 1
                    p1.S_job=control.Job[1]
                    p1.S_job_rule=Rule(job: control.Job[1])
                    self.control.Job_Cnt += 1
                    
                    break
                case 2:
                    p2.M_job=control.Job[2]
                    p2.M_job_rule=Rule(job: control.Job[2])
                    self.control.Job_Cnt += 1
                    p2.S_job_rule=Rule(job: control.Job[3])
                    p2.S_job=control.Job[3]
                    self.control.Job_Cnt += 1
                    break
                case 3:
                    p3.M_job=control.Job[4]
                    p3.M_job_rule=Rule(job: control.Job[4])
                    self.control.Job_Cnt += 1
                    p3.S_job_rule=Rule(job: control.Job[5])
                    p3.S_job=control.Job[5]
                    self.control.Job_Cnt += 1
                    break
                case 4:
                    p4.M_job=control.Job[6]
                    p4.M_job_rule=Rule(job: control.Job[6])
                    self.control.Job_Cnt += 1
                    p4.S_job_rule=Rule(job: control.Job[7])
                    p4.S_job=control.Job[7]
                    self.control.Job_Cnt += 1
                    break
                default:
                    break
                }
            }
            NavigationLink(destination:JobRule_01(p1:p1,p2:p2,p3:p3,p4:p4,job_rule: job_rule,control:control),isActive: $isActiveSubView) {
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct CheckPlayer_Previews: PreviewProvider {
    static var previews: some View {
        CheckPlayer(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
