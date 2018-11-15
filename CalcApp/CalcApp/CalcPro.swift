//
//  CalcPro.swift
//  CalcApp
//
//  Created by 工藤 響 on 2018/10/28.
//  Copyright © 2018 工藤 響. All rights reserved.
//

import UIKit

class CalcPro: NSObject {
    
    var Num:Double
    var Ope:String
    var sub:Double = 0
    var Output:Double? = 0
    
    init(inputNun: Double,inputOpe: String ,SubNum:Double){
        self.Num = inputNun
        self.Ope = inputOpe
        self.sub = SubNum
        
    }
    

    
    func OpeCheck() -> String{
        if Ope == "+"{
            return String(add())
        }else if Ope == "-"{
            return String(diff())
        }else if Ope == "*"{
            return String(mul())
        }else if Ope == "/"{
            if sub == 0{
                return "エラー"
            }
            return String(div())
        }else if Ope == "C"{
            Output = 0
            Num = 0
            sub = 0
            return String(Output!)
        }else{
            print("演算子を入力してください")
            return "エラーです"
        }
    }
    
    func add() -> Double{
        Output = sub + Num
        return Output!

    }
    func diff()-> Double{
        Output = sub - Num
         return Output!
    }
    func mul()-> Double{
        Output = sub * Num
         return Output!
    }
    func div()-> Double{

        Output = sub / Num
         return Output!
    }
}
