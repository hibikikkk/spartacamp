//
//  ViewController.swift
//  CalcApp
//
//  Created by 工藤 響 on 2018/10/28.
//  Copyright © 2018 工藤 響. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var OperaterText: UITextView!
    @IBOutlet weak var InResText: UITextView!
    
    var inNum:String = ""
    var sendNum:Double = 0
    var sendSubnum:Double = 0
    var SendItem:CalcPro!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func Startinput(){ 1

    
    }


    @IBAction func Zero(_ sender: Any) {
        inNum += "0"
        InResText.text = inNum
    }
    
   q @IBAction func One(_ sender: Any) {
        inNum += "1"
        InResText.text = inNum
    }
    
    @IBAction func Two(_ sender: Any) {
        inNum += "2"
        InResText.text = inNum
    }
    
    @IBAction func Three(_ sender: Any) {
        inNum += "3"
        InResText.text = inNum
    }
    
    @IBAction func Four(_ sender: Any) {
        inNum += "4"
        InResText.text = inNum
    }
    
    @IBAction func Five(_ sender: Any) {
        inNum += "5"
        InResText.text = inNum
    }
    
    @IBAction func Six(_ sender: Any) {
        inNum += "6"
        InResText.text = inNum
    }
    
    @IBAction func Seven(_ sender: Any) {
        inNum += "7"
        InResText.text = inNum
    }
    
    @IBAction func Eight(_ sender: Any) {
        inNum += "8"
        InResText.text = inNum
    }
    
    @IBAction func Nine(_ sender: Any) {
        inNum += "9"
        InResText.text = inNum
    }
    
    @IBAction func Add(_ sender: Any) {
        OperaterText.text = "+"
        InResText.text = ""
        sendNum = Double(inNum) ?? 0
        SendItem = CalcPro(inputNun:sendNum,inputOpe: OperaterText.text,SubNum:sendSubnum   )
   

        print("\(inNum)aaaaaaaaaaaaaa")

        inNum = ""
        InResText.text = SendItem.OpeCheck()
        
        sendSubnum = Double(InResText.text) ?? 0
    }

    @IBAction func Diff(_ sender: Any) {
        OperaterText.text = "-"
        InResText.text = ""
        sendNum = Double(inNum) ?? 0
        SendItem = CalcPro(inputNun:sendNum,inputOpe: OperaterText.text,SubNum:sendSubnum   )
        
        
        print("\(inNum)aaaaaaaaaaaaaa")
        
        inNum = ""
        InResText.text = SendItem.OpeCheck()
        
        sendSubnum = Double(InResText.text) ?? 0
        
    }
    
    @IBAction func Mul(_ sender: Any) {
        OperaterText.text = "*"
        InResText.text = ""
        sendNum = Double(inNum) ?? 0
        SendItem = CalcPro(inputNun:sendNum,inputOpe: OperaterText.text,SubNum:sendSubnum   )
        
        
        print("\(inNum)aaaaaaaaaaaaaa")
        
        inNum = ""
        InResText.text = SendItem.OpeCheck()
        
        sendSubnum = Double(InResText.text) ?? 0
    }
    
    @IBAction func Div(_ sender: Any) {
        OperaterText.text = "/"
        InResText.text = ""
        sendNum = Double(inNum) ?? 0
        SendItem = CalcPro(inputNun:sendNum,inputOpe: OperaterText.text,SubNum:sendSubnum   )
        
        
        print("\(inNum)aaaaaaaaaaaaaa")
        
        inNum = ""
        InResText.text = SendItem.OpeCheck()
        
        sendSubnum = Double(InResText.text) ?? 0

        
    }
    
    @IBAction func Equal(_ sender: Any) {
        sendNum = Double(inNum) ?? 0
        InResText.text = ""
        SendItem = CalcPro(inputNun:sendNum,inputOpe: OperaterText.text,SubNum:sendSubnum   )
        
        
        print("\(inNum)aaaaaaaaaaaaaa")
        
        inNum = ""
        InResText.text = SendItem.OpeCheck()
        
        sendSubnum = Double(InResText.text) ?? 0
        
        
        
    }
    
    @IBAction func Clear(_ sender: Any) {
        OperaterText.text = "C"
        sendSubnum = 0
        InResText.text = ""
        SendItem = CalcPro(inputNun:sendNum,inputOpe: OperaterText.text,SubNum:sendSubnum)
        
        sendNum = 0
        
        print("\(inNum)")
        
        inNum = ""
        InResText.text = SendItem.OpeCheck()
        
    }

}

