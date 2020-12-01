//
//  Control.swift
//  Jinro ver.01
//
//  Created by k19100kk on 2020/10/09.
//

import SwiftUI
import Foundation

class Control : ObservableObject{
    
    //チーム　　０：市民　１：人狼　２：お化け
    
    //Player 1
    class P1: Control {
        @Published var name = ""            //プレイヤー名
        @Published var M_job = ""            //メイン役職
        @Published var M_job_rule = ""
        @Published var S_job = ""            //サブ役職
        @Published var S_job_rule = ""
        @Published var team = 0             //チーム
        @Published var Vote = 0             //投票された数
    }
    
    //Player 2
    class P2: Control {
        @Published var name = ""            //プレイヤー名
        @Published var M_job = ""            //メイン役職
        @Published var M_job_rule = ""
        @Published var S_job = ""            //サブ役職
        @Published var S_job_rule = ""
        @Published var team = 0             //チーム
        @Published var Vote = 0             //投票された数
    }
    
    //Player 3
    class P3: Control {
        @Published var name = ""            //プレイヤー名
        @Published var M_job = ""            //メイン役職
        @Published var M_job_rule = ""
        @Published var S_job = ""            //サブ役職
        @Published var S_job_rule = ""
        @Published var team = 0             //チーム
        @Published var Vote = 0             //投票された数
    }
    
    //Player 4
    class P4: Control {
        @Published var name = ""            //プレイヤー名
        @Published var M_job = ""            //メイン役職
        @Published var M_job_rule = ""
        @Published var S_job = ""            //サブ役職
        @Published var S_job_rule = ""
        @Published var team = 0             //チーム
        @Published var Vote = 0             //投票された数
    }
    
    //平和村の投票数
    @Published var Pieace:Int = 0
    //役職
    class Job_rule:Control{
        
        //人狼
        @Published var Jinro = "あなたは街にひそむ人狼。\n追放されなければ勝ちです。\n市民をあざむいて、街に残りましょう。"
        @Published var Jinro_team = 1
        
        //市民
        @Published var Simin = "あなたは善良な市民。\n人狼を追放すれば勝ちです。\n能力者と協力して、街にひそむ人狼を探しましょ。"
        @Published var Simin_team = 2
        
        //占い師
        @Published var Uranai = "あなたは真の姿が見える占い師。占いタイムでだれか１人のメインカードを見て、正体を知ります。"
        @Published var Uinro_team = 2
        
        //警察
        @Published var Keisatu = "あなたは悪者を追う警察。パトロールタイムでだれか１人の場のカードを見て、手がかりを発見します。"
        @Published var Keisatu_team = 2
        
        //DJ
        @Published var DJ = "あなたは場をかき回すDJ。DJタイムでだれか１人のメインカードと場のカードを、入れ替えます。"
        @Published var DJ_team = 2
        
        //お化け
        @Published var Obake = "あなたは人狼でも人間でもないお化け。追放されれば勝ちです。人狼だと思わせて、追放されましょう。"
        @Published var Obake_team = 3
        
        //裏切り
        @Published var Uragiri = "あなたは人狼の味方。人狼が勝てば、裏切り物も勝ちです。人狼が追放されないよう立ち回りましょう。"
        @Published var Uragiri_team = 1
    }
    
    //プレイヤー人数カウンター
    @Published var PlayerCnt :Int = 0
    
    //早朝フェーズ人数カウンター
    @Published var SocyoCnt:Int = 0
    
    //投票フェーズ人数カウンター
    @Published var TohyoCnt:Int = 0
    @Published var TohyoName:String = ""
    //占い師の割り当て
    @Published var FortuneCnt:Int = 0
    
    //警察の探す人物の名前・秒数
    @Published var PoliceCnt:Int = 0
    @Published var PoliceName:String = ""
    @Published var PoliceName02:String = ""
    @Published var PoliceTime = 4
    
    //DJの探す人物の名前・秒数
    @Published var DJCnt:Int = 0
    @Published var DJName:String = ""
    @Published var DJName02:String = ""
    @Published var DJTime = 4
    
    //議論の画面
    @Published var GironCnt:Int = 0
    
    //追放されたプレイヤー
    @Published var JugPly01:String = ""
    @Published var JugPly02:String = ""
    @Published var JugJob01:String = ""
    @Published var JugJob02:String = ""
    
    //投票の後（勝利したチーム）
    @Published var Team_win:String = ""
    //役職割り当て処理
    @Published var Job = ["人狼","人狼","市民","市民","占い師","警察","DJ","お化け"]
    @Published var Job_Cnt = 1
    
    
    
}
