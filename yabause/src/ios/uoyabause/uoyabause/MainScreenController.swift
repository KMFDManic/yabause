//
//  MainScreenController.swift
//  uoyabause
//
//  Created by MiyamotoShinya on 2016/09/04.
//  Copyright © 2016年 devMiyax. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

class MainScreenController :UIViewController {

    @IBOutlet weak var menu_setting: UIBarButtonItem!
    @IBOutlet weak var bannerView: GADBannerView!
    
    var val: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = NSBundle.mainBundle().pathForResource("apikey", ofType: "plist")
        let plist = NSDictionary(contentsOfFile:filePath!)
        let value = plist?.valueForKey("ADMOB_KEY") as! String
        
        bannerView.adUnitID = value
        
        bannerView.rootViewController = self
        let request = GADRequest()
        //request.testDevices = ["ea16d8d48e439597ec9e49ec690fe356"]
        bannerView.loadRequest(request)
        //bannerView.hidden = true
        
        menu_setting.action = "onClickMyButton:"
        menu_setting.tag = 0
        
        val = 0
    }
    
    internal func onClickMyButton(sender: UIButton){
        let url = NSURL(string:UIApplicationOpenSettingsURLString)
        UIApplication.sharedApplication().openURL(url!)
    }
}