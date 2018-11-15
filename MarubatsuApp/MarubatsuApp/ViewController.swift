//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 工藤 響 on 2018/10/27.
//  Copyright © 2018 工藤 響. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var QuestionaLabel: UILabel!
    //問題番号
    var currentQuestionNum: Int = 0
    //問題内容
    let questions: [[String:Any]] = [
        [
            "question":"iphoneアプリの統合開発環境はZcodeである" , "answer":false
        ],
        [
            "question":"xcode画面の右側にはユーティリティーズがある" , "answer":true
        ],
        [
            "question":"UILabelは文字列を表示するときに利用する" , "answer":true
        ]
    ]
    //問題を表示させる処理
    func showQuestion(){
        let question = questions[currentQuestionNum]
        
        if let que = question["question"] as? String{
            QuestionaLabel.text = que
        }
        
    }
    
    func checkAnswer(yourAnswer:Bool){
        
        let question = questions[currentQuestionNum]
        var counter: Int = 0
        
        if let ans = question["answer"] as? Bool{
            if yourAnswer == ans{
                //正解
                currentQuestionNum += 1
                counter += 1
                showAlart(message: "正解！")
            }else{
                //不正解
                showAlart(message: "不正解...")
                currentQuestionNum += 1
            }
            
        
        if currentQuestionNum >= questions.count{
            currentQuestionNum = 0
            showAlart(message: "\(counter)問,正解しました！！！")
            counter = 0
        }
        }
        showQuestion()
        
    }
    
    func showAlart(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        present(alert,animated: false,completion: nil)
    }
    
    //ビューを読み込む処理
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showQuestion()
    }
    
    //マルボタンを押されたときの処理
    @IBAction func YesButton(_ sender: Any) {
        checkAnswer(yourAnswer:true)
    }
    
    //バツボタンを押されたときの処理
    @IBAction func NoButton(_ sender: Any) {
        checkAnswer(yourAnswer:false)
    }
    
}

