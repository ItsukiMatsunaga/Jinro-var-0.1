//
//  voting_on.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/11/10.
//

import SwiftUI

struct voting_on: View {
    //****************************************
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State var player01:String = ""                  //プレイヤー１
    @State var player02:String = ""                  //プレイヤー２
    @State var player03:String = ""                  //プレイヤー３
    @State var isActiveSubView = false
    @State var isActiveSubView_fin = false
    @State var name:String = ""                        //名前を入れる
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //****************************************
    
    var body: some View {
        ZStack{
            Rectangle()//赤
                .foregroundColor(Color(red: 100/255, green: 20/255, blue: 0/255))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("\(name)の投票")
                    .font(.system(size: 30))
                    .frame(width: 320, height: 100, alignment: .center)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20.0)
                    .onAppear(){
                        name = control.TohyoName
                        switch control.PlayerCnt{
                        case 2:
                            player01 = p2.name
                            player02 = p3.name
                            player03 = p4.name
                        case 3:
                            player01 = p1.name
                            player02 = p3.name
                            player03 = p4.name
                        case 4:
                            player01 = p1.name
                            player02 = p2.name
                            player03 = p4.name
                        case 5:
                            player01 = p1.name
                            player02 = p2.name
                            player03 = p3.name
                        default:
                            break
                        }
                    }
                Spacer()
                HStack{
                    Text("\(player01)")
                        .font(.system(size: 30))
                        .frame(width: 200, height: 100, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        .padding(.all)
                        .foregroundColor(.black)
                        Button(action: {
                            switch player01{
                            case p1.name:
                                p1.Vote += 1
                            case p2.name:
                                p2.Vote += 1
                            case p3.name:
                                p3.Vote += 1
                            case p4.name:
                                p4.Vote += 1
                            default:
                                break
                            }
                            if control.PlayerCnt == 5{
                                self.isActiveSubView_fin.toggle()
                            }else{
                                self.isActiveSubView.toggle()
                            }
                        }){
                            Text("投票")
                                .font(.system(size: 30))
                                .frame(width: 100, height: 100, alignment: .center)
                                .background(Color.white.opacity(0.9))
                                .border(Color.black,width: 7)
                                .padding(.all)
                                .foregroundColor(.black)
                            
                    }
                }
                Spacer()
                HStack{
                    Text("\(player02)")
                        .font(.system(size: 30))
                        .frame(width: 200, height: 100, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        .padding(.all)
                        .foregroundColor(.black)
                        Button(action: {
                            switch player02{
                            case p1.name:
                                p1.Vote += 1
                            case p2.name:
                                p2.Vote += 1
                            case p3.name:
                                p3.Vote += 1
                            case p4.name:
                                p4.Vote += 1
                            default:
                                break
                            }
                            if control.PlayerCnt == 5{
                                self.isActiveSubView_fin.toggle()
                            }else{
                                self.isActiveSubView.toggle()
                            }
                        }){
                            Text("投票")
                                .font(.system(size: 30))
                                .frame(width: 100, height: 100, alignment: .center)
                                .background(Color.white.opacity(0.9))
                                .border(Color.black,width: 7)
                                .padding(.all)
                                .foregroundColor(.black)
                    }
                }
                Spacer()
                HStack{
                    Text("\(player03)")
                        .font(.system(size: 30))
                        .frame(width: 200, height: 100, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        .padding(.all)
                        .foregroundColor(.black)
                        Button(action: {
                            switch player03{
                            case p1.name:
                                p1.Vote += 1
                            case p2.name:
                                p2.Vote += 1
                            case p3.name:
                                p3.Vote += 1
                            case p4.name:
                                p4.Vote += 1
                            default:
                                break
                            }
                            if control.PlayerCnt == 5{
                                self.isActiveSubView_fin.toggle()
                            }else{
                                self.isActiveSubView.toggle()
                            }
                        }){
                            Text("投票")
                                .font(.system(size: 30))
                                .frame(width: 100, height: 100, alignment: .center)
                                .background(Color.white.opacity(0.9))
                                .border(Color.black,width: 7)
                                .padding(.all)
                                .foregroundColor(.black)
                    }
                }
                Spacer()
                HStack{
                    Text("平和村")
                        .font(.system(size: 30))
                        .frame(width: 200, height: 100, alignment: .center)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20.0)
                        .padding(.all)
                        .foregroundColor(.black)
                        Button(action: {
                            control.Pieace += 1
                            if control.PlayerCnt == 5{
                                self.isActiveSubView_fin.toggle()
                            }else{
                                self.isActiveSubView.toggle()
                            }
                        }){
                            Text("投票")
                                .font(.system(size: 30))
                                .frame(width: 100, height: 100, alignment: .center)
                                .background(Color.white.opacity(0.9))
                                .border(Color.black,width: 7)
                                .padding(.all)
                                .foregroundColor(.black)
                    }
                }
                Spacer()
            }
            NavigationLink(destination: CheckPlayer_voting(p1:p1,p2:p2,p3:p3,p4:p4, job_rule: job_rule,control:control),isActive: $isActiveSubView) {
                EmptyView()
                
            }
            NavigationLink(destination: voting_result(p1:p1,p2:p2,p3:p3,p4:p4, job_rule: job_rule,control:control),isActive: $isActiveSubView_fin) {
                EmptyView()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct voting_on_Previews: PreviewProvider {
    static var previews: some View {
        voting_on(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
