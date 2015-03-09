//
//  ViewController.swift
//  iosdemo
//
//  Created by kinghai on 15/3/9.
//  Copyright (c) 2015年 ftguang. All rights reserved.
//

import UIKit
import CoreMedia
import MediaPlayer

import AVKit
import AVFoundation
import OnecloudVideo

class ViewController: UIViewController {

    @IBOutlet weak var urlField: UITextField!
  
    @IBOutlet weak var refererField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playBtnClick(sender: AnyObject) {
        playVideo()
    }
    
    func playVideo() {
        
        let url = urlField.text
        let referer = refererField.text
        
        if let player = OnecloudVideoUtil.getAVPlayer(url, referer: referer) {
            
            let playerController = AVPlayerViewController()
            
            playerController.player = player
            
            self.addChildViewController(playerController)
            self.view.addSubview(playerController.view!)
            
            playerController.view.frame = self.view.frame
            
            player.play()
            
        }
        else {
            NSLog("no player")
        }
    }
}