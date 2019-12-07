//
//  ViewController.swift
//  BluetoothTest
//
//  Created by Varun Narayanswamy on 11/24/19.
//  Copyright © 2019 Varun Narayanswamy. All rights reserved.
//

import UIKit
import Foundation
import CoreData
import RxLifxApi
import RxLifx
import LifxDomain

class ViewController: UIViewController {
    let lightService = LightService(
        lightsChangeDispatcher: lightNotification(),
        transportGenerator: UdpTransport.self,
        extensionFactories: [LightsGroupLocationService.self]
    )
    var lightArray = [Light]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func ConnectToLights(_ sender: UIButton) {
        lightService.start()
        NotificationCenter.default.addObserver(self, selector: #selector(AddedLight), name: NSNotification.Name(rawValue: "LightAdded"), object: nil)
        
    }
    
    @IBAction func OnOffSwitch(_ sender: UISwitch) {
        if !sender.isOn{
            for i in lightArray{
                let power = LightSetPowerCommand.create(light: i, status: false, duration: 0)
                power.fireAndForget()
            }
        }
        else{
            for j in lightArray{
               let power = LightSetPowerCommand.create(light: j, status: true, duration: 0)
                power.fireAndForget()
            }
        }
    }
    @objc func AddedLight(notification: Notification){
        if let light = notification.object as? Light{
            lightArray.append(light)
            let color = HSBK(hue: UInt16(.random(in: 0...1) * Float(UInt16.max)), saturation: UInt16(.random(in: 0...1) * Float(UInt16.max)), brightness: UInt16(1 * Float(UInt16.max)), kelvin: 0)
            print(color.brightness)
            print(color.hue)
            print(color.saturation)
            let setColor = LightSetColorCommand.create(light: light, color: color, duration: 0)
            setColor.fireAndForget()
        }
    }
    
    @IBAction func RedButton(_ sender: UIButton) {
        for i in lightArray{
            let color = HSBK(hue: 62700, saturation: 65535, brightness: 65535, kelvin: 0)
            let setColor = LightSetColorCommand.create(light: i, color: color, duration: 0)
            setColor.fireAndForget()
            print(color.brightness)
            print(color.hue)
            print(color.saturation)
        }
    }

    @IBAction func BlueButton(_ sender: UIButton) {
        for i in lightArray{
            let color = HSBK(hue: 35000, saturation: 65535, brightness: 65535, kelvin: 0)
            let setColor = LightSetColorCommand.create(light: i, color: color, duration: 0)
            setColor.fireAndForget()
            print(color.brightness)
            print(color.hue)
            print(color.saturation)
        }
    }
    @IBAction func GreenButton(_ sender: UIButton) {
        for i in lightArray{
            let color = HSBK(hue: 25000, saturation: 65535, brightness: 65535, kelvin: 0)
            let setColor = LightSetColorCommand.create(light: i, color: color, duration: 0)
            setColor.fireAndForget()
            print(color.brightness)
            print(color.hue)
            print(color.saturation)
        }
    }
    @IBAction func Pink(_ sender: UIButton) {
        for i in lightArray{
            let color = HSBK(hue: 50000, saturation: 65535, brightness: 65535, kelvin: 0)
            let setColor = LightSetColorCommand.create(light: i, color: color, duration: 0)
            setColor.fireAndForget()
            print(color.brightness)
            print(color.hue)
            print(color.saturation)
        }
    }
    
    @IBAction func BlackButton(_ sender: UIButton) {
        for i in lightArray{
            let color = HSBK(hue: 30000, saturation: 65535, brightness: 65535, kelvin: 0)
            let setColor = LightSetColorCommand.create(light: i, color: color, duration: 0)
            setColor.fireAndForget()
            print(color.brightness)
            print(color.hue)
            print(color.saturation)
        }
    }
}

