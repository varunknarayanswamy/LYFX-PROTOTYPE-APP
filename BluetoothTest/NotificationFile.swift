//
//  NotificationFile.swift
//  BluetoothTest
//
//  Created by Varun Narayanswamy on 11/24/19.
//  Copyright © 2019 Varun Narayanswamy. All rights reserved.
//

import Foundation
import RxLifxApi

class lightNotification: LightsChangeDispatcher{
    let notify: NotificationCenter = NotificationCenter.default
    func notifyChange(light: Light, property: LightPropertyName, oldValue: Any?, newValue: Any?) {
        notify.post(name: NSNotification.Name(rawValue: "LightsChange"), object: light)
    }
    
    func lightAdded(light: Light) {
        notify.post(name: NSNotification.Name(rawValue: "LightAdded"), object: light)
    }
}

