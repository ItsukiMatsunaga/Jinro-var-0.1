//
//  Test.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/13.
//

import SwiftUI

struct Test: View {
    @ObservedObject var p1: Control.P1   //Controlというクラスで共有
    @ObservedObject var p2: Control.P2   //Controlというクラスで共有
    @ObservedObject var p3: Control.P3   //Controlというクラスで共有
    @ObservedObject var p4: Control.P4   //Controlというクラスで共有
    @ObservedObject var job_rule: Control.Job_rule
    @ObservedObject var control: Control
    @State private var job_01:String = ""
    @State private var job_02:String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Text("\(job_02)")
                .font(.system(size: 30))
                .frame(width: 150, height: 70, alignment: .center)
                .background(Color.white.opacity(0.9))
                .cornerRadius(20.0)
                .padding(.bottom,10)
                .foregroundColor(.black)
                .onAppear(){
                    job_02 = p4.S_job
                }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test(p1: Control.P1(),p2: Control.P2(),p3: Control.P3(),p4: Control.P4(),job_rule: Control.Job_rule(),control: Control())
    }
}
