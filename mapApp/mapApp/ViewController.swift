//
//  ViewController.swift
//  mapApp
//
//  Created by 工藤 響 on 2018/10/28.
//  Copyright © 2018 工藤 響. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet var MapView: MKMapView!
    
    let userDefName = "pins"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadPins()
    }
    
    
    @IBAction func Longtap(_ sender: UILongPressGestureRecognizer) {
        
        if sender.state != UIGestureRecognizer.State.began{
            //ロングタップ認識時以外では処理をしない
            return
        }
        
        //アラートで作成したTextFieldの内容
        let point = sender.location(in: MapView)
        let geo = MapView.convert(point, toCoordinateFrom: MapView)
        
        // アラートの作成
        let alert = UIAlertController(title: "スポット登録", message: "この場所に残すメッセージを入力してください。", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "登録1", style: .default, handler: { (action: UIAlertAction) -> Void in
            // 後ほど記述します。
            let pin = Pin(geo: geo, text: alert.textFields?.first?.text)
            self.MapView.addAnnotation(pin)
            
            self.savePin(pin)
        }))
//        alert.addAction(UIAlertAction(title: "登録2", style: .destructive, handler: {(action: UIAlertAction) -> Void in
//        }))
//
        
        // ピンに登録するテキスト用の入力フィールドをアラートに追加します。
        alert.addTextField(configurationHandler: { (textField: UITextField) in
            textField.placeholder = "メッセージ"
            
        })
        
 
        // アラートの表示
        present(alert, animated: true, completion: nil)
        
        print("ロングタップを検出したよ")
    }
    
    // ピンの保存
    func savePin(_ pin: Pin) {
        let userDefaults = UserDefaults.standard
        
        // 保存するピンをUserDefaults用に変換します。
        let pinInfo = pin.toDictionary()
        
        if var savedPins = userDefaults.object(forKey: userDefName) as? [[String: Any]] {
            // すでにピン保存データがある場合、それに追加する形で保存します。
            savedPins.append(pinInfo)
            userDefaults.set(savedPins, forKey: userDefName)
            
        } else {
            // まだピン保存データがない場合、新しい配列として保存します。
            let newSavedPins: [[String: Any]] = [pinInfo]
            userDefaults.set(newSavedPins, forKey: userDefName)
        }
    }
    
    func loadPins() {
        let userDefaults = UserDefaults.standard
        
        if let savedPins = userDefaults.object(forKey: userDefName) as? [[String: Any]] {
            
            // 現在のピンを削除
            self.MapView.removeAnnotations(self.MapView.annotations)
            
            for pinInfo in savedPins {
                let newPin = Pin(dictionary: pinInfo)
                self.MapView.addAnnotation(newPin)
            }
        }
    }


}

