//
//  FTTabBarInteractor.swift
//  HQSwiftFirstTime
//
//  Created by huangqun on 2018/12/5.
//  Copyright © 2018 hq. All rights reserved.
//

import UIKit

class FTTabBarInteractor: NSObject {
    func takeTaBarItemNames() -> [String] {
        return ["FTViewController", "FTViewController"]
    }
    
    func takeTabBarItemNormalImages() -> [String] {
        return ["loan_def", "my_def"];
    }
    
    func taketabBarItemSelectImages() -> [String] {
        return ["loan_def_slc", "my_def_slc"];
    }
}
