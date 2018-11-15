//
//  ViewController.swift
//  MaruBatsuApp2
//
//  Created by 工藤 響 on 2018/10/28.
//  Copyright © 2018 工藤 響. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {


    @IBOutlet var QuestionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QuestionText.text = "問題がありません、問題を作りましょう！！！"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoCreate(_ sender: Any) {
    }
   
    @IBAction func YesTap(_ sender: Any) {
    }
    
    @IBAction func NoTap(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
