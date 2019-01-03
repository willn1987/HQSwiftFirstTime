//
//  FTTabBarController.swift
//  HQSwiftFirstTime
//
//  Created by huangqun on 2018/12/5.
//  Copyright © 2018 hq. All rights reserved.
//

import UIKit
import SnapKit

class FTTabBarController: UITabBarController {
    
    private let interactor = FTTabBarInteractor()
    var width = 1.0, height = 1.0
    var test: Double {
        return width + height
    }
    
    var totalSteps: Double = 0 {
        willSet(newTotalSteps) {
            self.begin(number: newTotalSteps)
        }
        didSet {
            self.begin(number: oldValue)
        }
    }
    
    func begin(number: Double) {
        FTLogger.logInfo(message: "value will change old \(totalSteps)   new \(number)")
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        FTLogger.logInfo(message: "xxxxxx \(test)")
//        totalSteps = 100
        self.begin(number: totalSteps)
        
        // 创建tabBar
        self.initSubItems()
        
        let xx = self.beginxx()
        
        let aa = xx.code
        let bb = xx.msg
        
        
    }
    
    /// 初始化tabBar控制器
    private func initSubItems() {

        let viewControllerName = self.interactor.takeTaBarItemNames()
        let normalImages = self.interactor.takeTabBarItemNormalImages()
        let selectImages = self.interactor.taketabBarItemSelectImages()
        
        let viewControllers: NSMutableArray = NSMutableArray.init()
        
        for (index, value) in viewControllerName.enumerated() {
            // 1.动态获取命名空间（项目名称）
            guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else{
                return;
            }
            
            // 2.根据字符串获取对应的Class并转成控制器的类型
            guard let vc = NSClassFromString(nameSpace + "." + value) as? UIViewController.Type else{
                return
            }
            
            let controller = vc.init()
            let navController = UINavigationController(rootViewController: controller)
            let normalImage = UIImage(named: normalImages[index])?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            let selectImage = UIImage(named: selectImages[index])?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            
            controller.tabBarItem = UITabBarItem(title: nil, image: normalImage, selectedImage: selectImage)
            controller.tabBarItem.tag = index
            controller.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            controller.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 100)
            
            viewControllers.add(navController)
        }

        self.viewControllers = (viewControllers as! [UIViewController])
        self.delegate = self
    }
    
    func beginxx() -> (code: Int, msg: String) {
        return (1, "xxxxx")
    }
}

// MARK: - UITabBarControllerDelegate
extension FTTabBarController: UITabBarControllerDelegate {
    
   func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = self.viewControllers?.index(of: viewController)
        guard index != self.selectedIndex else {
            return false
        }
        return true
    }

}



enum TTT {
    case X1(code: Int , msg: String )
    case X2(code: Int , msg: String )
    case X3(code: Int , msg: String )
    
//    var code: Int {
//        switch self {
//        case .X1(self.code, msg): break
//
//        default: break
//
//        }
//    }
    
}
