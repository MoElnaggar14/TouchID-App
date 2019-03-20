//
//  UIDevice+ModelName.swift
//  TouchIDApp
//
//  Created by Mohammed Elnaggar on 3/21/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import UIKit

extension UIDevice {
    
    static let modelName: DeviceTypes = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> DeviceTypes {
            switch identifier {
            case "iPhone5,1", "iPhone5,2":
                return .iPhone5
            case "iPhone5,3", "iPhone5,4":
                return .iPhone5c
            case "iPhone6,1", "iPhone6,2":
                return .iPhone5s
            case "iPhone7,2":
                return .iPhone6
            case "iPhone7,1":
                return .iPhone6Plus
            case "iPhone8,1":
                return .iPhone6s
            case "iPhone8,2":
                return .iPhone6sPlus
            case "iPhone9,1", "iPhone9,3":
                return .iPhone7
            case "iPhone9,2", "iPhone9,4":
                return .iPhone7Plus
            case "iPhone8,4":
                return .iPhoneSE
            case "iPhone10,1", "iPhone10,4":
                return .iPhone8
            case "iPhone10,2", "iPhone10,5":
                return .iPhone8Plus
            case "iPhone10,3", "iPhone10,6":
                return .iPhoneX
            case "iPhone11,2":
                return .iPhoneXS
            case "iPhone11,4", "iPhone11,6":
                return .iPhoneXSMax
            case "iPhone11,8":
                return .iPhoneXR
            case "i386", "x86_64":
                return .Simulator
            default:
                return .Simulator
            }
        }
        
        return mapToDevice(identifier: identifier)
    }()
    
    enum DeviceTypes {
        case iPhone5
        case iPhone5c
        case iPhone5s
        case iPhone6
        case iPhone6Plus
        case iPhone6s
        case iPhone6sPlus
        case iPhone7
        case iPhone7Plus
        case iPhoneSE
        case iPhone8
        case iPhone8Plus
        case iPhoneX
        case iPhoneXS
        case iPhoneXSMax
        case iPhoneXR
        case Simulator
    }
}
