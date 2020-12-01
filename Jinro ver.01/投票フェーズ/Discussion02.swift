//
//  Discussion02.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/11/10.
//

import SwiftUI

struct Discussion02: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showingAlert = false
    @State private var finish = false
    @State var timeStop = 0  //フラグ
    @State var timeRemaining_s = 59
    @State var timeRemaining_m = 2
    @State var isActiveSubView = false
    let timer_s = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timer_m = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //****************************************
    var body: some View {
        ZStack{
            //Background
            Rectangle()//赤
                .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                /*TimerView2(setDate: toDate)
                    .font(.system(size: 50))
                    .frame(width: 250, height: 110, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.top)*/
                HStack{
                    Button(action:{
                        playSound(sound: "bottun", type: "mp3")
                        if self.timeRemaining_m != 0{
                            self.timeRemaining_m -= 1
                        }else{
                            timeRemaining_m = 0
                            timeRemaining_s = 0
                        }
                    }){
                        Text("-")
                            .font(.system(size: 50))
                            .foregroundColor(.black)
                            .frame(width: 50, height:50, alignment: .center)
                            .background(Color.red.opacity(0.7))
                            .cornerRadius(20.0)
                    }
                    Text(String(format: "%02d:%02d", timeRemaining_m,timeRemaining_s))
                        .font(.system(size: 50))
                        .frame(width: 250, height: 110, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20.0)
                        .padding()
                        .onReceive(timer_s) { _ in
                            if self.timeRemaining_m <= 0 && self.timeRemaining_s <= 0{
                                if timeStop == 0{
                                    self.showingAlert = true
                                }
                                timeRemaining_m = 0
                                timeRemaining_s = 0
                            }else{
                                if self.timeRemaining_s <= 0 {
                                    self.timeRemaining_s = 59
                                    self.timeRemaining_m -= 1
                                }else{
                                    self.timeRemaining_s -= 1
                                }
                            }
                        }.alert(isPresented: $showingAlert) {  // ③アラートの表示条件設定
                            Alert(
                                title: Text("+30秒　追加しますか？"),
                                primaryButton: .cancel(Text("キャンセル")){
                                    action:do {
                                        self.timer_s.upstream.connect().cancel()  //キャンセル
                                        timeStop = 1
                                        finish.toggle()
                                    }
                                },
                                secondaryButton: .default(Text("OK"),
                                action: {
                                    self.timeRemaining_s += 30;
                                }))
                        }
                    Button(action:{
                        playSound(sound: "bottun", type: "mp3")
                        self.timeRemaining_m += 1
                    }){
                        Text("+")
                            .font(.system(size: 50))
                            .foregroundColor(.black)
                            .frame(width: 50, height:50, alignment: .center)
                            .background(Color.blue.opacity(0.7))
                            .cornerRadius(20.0)
                    }
                }

                HStack {
                    Text("現在以下の役職がいます")
                        .font(.system(size: 20))
                        .frame(width: 260, height: 40, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20.0)
                        .padding()
                }
                HStack {
                    Image("狼のアイコン")
                        .resizable()    // 画像サイズをフレームサイズに合わせる
                        .frame(width: 74, height: 74)
                    Image("狼のアイコン")
                        .resizable()    // 画像サイズをフレームサイズに合わせる
                        .frame(width: 74, height: 74)
                    Spacer()
                        .frame(width: 30, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Image("スタンダードな人のアイコン素材")
                        .resizable()    // 画像サイズをフレームサイズに合わせる
                        .frame(width: 74, height: 74)
                    Image("スタンダードな人のアイコン素材")
                        .resizable()    // 画像サイズをフレームサイズに合わせる
                        .frame(width: 74, height:74)
                        
                }
                HStack {
                    Text("人狼")
                        .font(.system(size: 20))
                        .frame(width: 74, height: 40, alignment: .center)
                        .cornerRadius(20.0)
                        .background(Color.white)
                        .cornerRadius(20.0)
                    Text("人狼")
                        .font(.system(size: 20))
                        .frame(width: 74, height: 40, alignment: .center)
                        .cornerRadius(20.0)
                        .background(Color.white)
                        .cornerRadius(20.0)
                    Spacer()
                        .frame(width: 30, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("市民")
                        .font(.system(size: 20))
                        .frame(width: 74, height: 40, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20.0)
                    Text("市民")
                        .font(.system(size: 20))
                        .frame(width: 74, height: 40, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20.0)
                }
                HStack {
                    Image("占い師アイコン1")
                        .resizable()    // 画像サイズをフレームサイズに合わせる
                        .frame(width: 74, height: 74)
                    Image("警官のアイコン1")
                        .resizable()    // 画像サイズをフレームサイズに合わせる
                        .frame(width: 74, height: 74)
                    Spacer()
                        .frame(width: 30, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Image("DJアイコン2")
                        .resizable()    // 画像サイズをフレームサイズに合わせる
                        .frame(width: 74, height: 74)
                    Image("ゴーストアイコン2")
                        .resizable()    // 画像サイズをフレームサイズに合わせる
                        .frame(width: 74, height: 74)
                }
                HStack {
                    Text("占い師")
                        .font(.system(size: 20))
                        .frame(width: 74, height: 40, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20.0)
                    Text("警察")
                        .font(.system(size: 20))
                        .frame(width: 74, height: 40, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20.0)
                    Spacer()
                        .frame(width: 30, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("DJ")
                        .font(.system(size: 20))
                        .frame(width: 74, height: 40, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20.0)
                    Text("おばけ")
                        .font(.system(size: 20))
                        .frame(width: 74, height: 40, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20.0)
                }
                Spacer()
                    Button(action:{
                        playSound(sound: "bottun", type: "mp3")
                        self.isActiveSubView.toggle()
                        self.timer_s.upstream.connect().cancel()  //キャンセル
                    }){
                    Text("FINISH")
                        .font(.system(size: 30))
                        .frame(width: 150, height: 90, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                        .padding(.bottom,20)
                        .foregroundColor(.black)
                        if control.GironCnt == 0{
                            NavigationLink(destination:voting_rule02(p1:p1,p2:p2,p3:p3,p4:p4,job_rule:job_rule,control: control),isActive: $isActiveSubView) {
                            }
                        }
                    }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Discussion02_Previews: PreviewProvider {
    static var previews: some View {
        Discussion02(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
