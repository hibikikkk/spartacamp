//
//  ViewController.swift
//  OneHandredEgg
//
//  Created by 工藤 響 on 2018/10/27.
//  Copyright © 2018 工藤 響. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var eggCounterNum:Int = 10
    @IBOutlet weak var Counter: UITextView! 
    @IBOutlet weak var Message: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func EggPush(_ sender: Any) {
        eggCounterNum -= 1
        Counter.text = String(eggCounterNum)
        
        if eggCounterNum == 5 {
            Message.text = "お前こんなことしてていいのか？"
        }
        
        if eggCounterNum <= 0{
            EggBreak()
        }
    }
    
    
    func EggBreak(){
        //Counter.text = "よくやるな"
        showAlart(message: "よくできました")
    }
    
    
    func showAlart(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        present(alert,animated: true,completion: nil)
    }
    

}

