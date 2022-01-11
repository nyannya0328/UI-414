//
//  Extencions.swift
//  UI-414
//
//  Created by nyannyan0328 on 2022/01/06.
//

import SwiftUI

extension View{
    
    
    func setNavBarColor(color : Color){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            
            NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil,userInfo: [
            
                "color" : color
                
            ])
        }
        
        
        
        
        
        
    }
    func resetNavBar(){
     
        
        NotificationCenter.default.post(name: Notification.Name("UPDATENAVBAR"), object: nil)
        
    
        
    }
    
    func setNavBarTilteColor(color : Color){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            
            NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil,userInfo: [
            
                "color" : color,
                
                "forTitle" : true
                
            ])
        }
        
        
        
        
    }
    
    
    
}
extension UINavigationController{
    
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(upDateNavBar(notification:)), name: NSNotification.Name("UPDATENAVBAR"), object: nil)
            
    }
    
    
    @objc
    func upDateNavBar(notification : Notification){
        
        if let info = notification.userInfo{
            
            
            
            let color = info["color"] as! Color
            
            
            if let _ = info["forTitle"]{
                
                
                navigationBar.standardAppearance.largeTitleTextAttributes = [.foregroundColor:UIColor(color)]
                navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor:UIColor(color)]
                navigationBar.scrollEdgeAppearance?.largeTitleTextAttributes = [.foregroundColor:UIColor(color)]
                navigationBar.scrollEdgeAppearance?.titleTextAttributes = [.foregroundColor:UIColor(color)]
                navigationBar.compactAppearance?.largeTitleTextAttributes = [.foregroundColor:UIColor(color)]
                navigationBar.compactAppearance?.titleTextAttributes = [.foregroundColor:UIColor(color)]
                
                
                
                return
            }
            
            
            if color == .clear{
                
                
                let transparent = UINavigationBarAppearance()
                transparent.configureWithTransparentBackground()
                
                
                navigationBar.standardAppearance = transparent
                navigationBar.scrollEdgeAppearance = transparent
                navigationBar.compactAppearance = transparent
                
                
                return
                
                
            }
            
            let apprearnece = UINavigationBarAppearance()
            
            apprearnece.backgroundColor = UIColor(color)
            
            
            navigationBar.standardAppearance = apprearnece
            navigationBar.scrollEdgeAppearance = apprearnece
            navigationBar.compactAppearance = apprearnece
            
        
            
            
            
            
        }
        
        else{
            
            
            let apprearnece = UINavigationBarAppearance()
            
            
            let transparent = UINavigationBarAppearance()
            
            
            transparent.configureWithTransparentBackground()
            
            
            
            navigationBar.standardAppearance = apprearnece
            navigationBar.scrollEdgeAppearance = transparent
            navigationBar.compactAppearance = apprearnece
        }
        
        
        
        
        
    }
}
