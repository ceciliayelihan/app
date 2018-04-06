//
//  HomeTabBarController.swift
//  BeautyDiary
//
//  Created by Lingyun Gu on 3/20/18.
//  Copyright © 2018 BeautyDiary. All rights reserved.
//

import UIKit
import CoreData

class HomeTabBarController: UITabBarController {
    
    weak var toggleMusicDelegate: ToggleMusicDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        let settingVC = viewControllers![1] as! SettingViewController
        settingVC.toggleMusicDelegate = toggleMusicDelegate
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func musicToggleAction(_ sender: UISwitch) {
        if sender.isOn {
            toggleMusicDelegate?.toggleMusic(targetState: true)
        }
        else {
            toggleMusicDelegate?.toggleMusic(targetState: false)
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
