//
//  ViewController.swift
//  LightSaberApp
//
//  Created by 工藤 響 on 2018/10/27.
//  Copyright © 2018 工藤 響. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class ViewController: UIViewController {
    
    // 加速度センサーを使うためのオブジェクトを格納します。
    let motionManager: CMMotionManager = CMMotionManager()
    // iPhoneを振った音を出すための再生オブジェクトを格納します。
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    // ボタンを押した時の音を出すための再生オブジェクトを格納します。
    var startAudioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    var startAccel: Bool = false
    
    func setupSound(){
        if let sound = Bundle.main.path(forResource:"light_saber1",ofType:".mp3"){
            startAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            
            startAudioPlayer.prepareToPlay()
        }
        
        if let sound = Bundle.main.path(forResource:"light_saber3",ofType:".mp3"){
            audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath:sound))
        }
        
    }
    
    func startGetAccelerometer(){
        motionManager.accelerometerUpdateInterval = 1/100
        motionManager.startAccelerometerUpdates(to: OperationQueue.main){(accelerometerData:CMAccelerometerData?,error: Error?) in
            
            if let acc = accelerometerData{
                let x = acc.acceleration.x
                let y = acc.acceleration.y
                let z = acc.acceleration.z
                let synthetic = (x * x) + (y * y) + (z * z)
                
                if synthetic >= 8 && self.startAccel == false{
                    self.startAccel = true
                    
                    self.audioPlayer.currentTime = 0
                    self.audioPlayer.play()
                }
                
                if self.startAccel == true && synthetic < 1{
                    self.startAccel = false
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupSound()
    }
    
    @IBAction func TappedStartbtn(_ sender: Any) {
        startAudioPlayer.play()
    }
    
}

