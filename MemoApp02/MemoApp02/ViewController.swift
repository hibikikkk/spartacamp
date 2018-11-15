//
//  ViewController.swift
//  MemoApp02
//
//  Created by 工藤 響 on 2018/10/21.
//  Copyright © 2018 工藤 響. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var TextView2: UITextView!
    @IBOutlet weak var TextView3: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TextView.text = "テキストを入力してください"
        TextView2.text = "テキストを入力してください"
        TextView3.text = "テキストを入力してください"
    }
    
    
    @IBAction func delText(_ sender: Any) {
        TextView.text = ""
    }
    @IBAction func delText2(_ sender: Any) {
        TextView2.text = ""
    }
    @IBAction func delText3(_ sender: Any) {
        TextView3.text = ""
    }
    
    
}

