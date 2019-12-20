//
//  Extensions.swift
//  IAmBored
//
//  Created by Antonie on 2019/12/20.
//  Copyright © 2019 antonie. All rights reserved.
//

import UIKit

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}
