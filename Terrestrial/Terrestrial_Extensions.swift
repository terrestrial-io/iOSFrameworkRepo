//
//  Terrestrial+String.swift
//  SwiftExampleProject
//
//  Created by MrMambwe on 10/11/2015.
//  Copyright © 2015 Terrestrial. All rights reserved.
//

import Foundation


public extension String {    
    
    
    var translated : String {
        return Terrestrial.sharedInstance().stringForKey(self, andContext: "")
    }
    
    func translatedWithContext(context: String) -> String {
        return Terrestrial.sharedInstance().stringForKey(self, andContext: context)
    }
    
    
    
}

public extension UILabel {
    
    
    var translated2 : String {
        return Terrestrial.sharedInstance().stringForKey(self, andContext: "")
    }
    
    func translatedWithContext(context: String) -> String {
        return Terrestrial.sharedInstance().stringForKey(self, andContext: context)
    }
    
    
    
}