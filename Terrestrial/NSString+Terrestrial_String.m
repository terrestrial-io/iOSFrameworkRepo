//
//  NSString+Terrestrial_String.m
//  TestTranslatorApp
//
//  Created by MrMambwe on 30/09/2015.
//  Copyright (c) 2015 Terrestrial. All rights reserved.
//

#import "NSString+Terrestrial_String.h"
#import "Terrestrial.h"


@implementation NSString (Terrestrial_String)

-(NSString *)translated {

   // if ([Terrestrial sharedInstance] a)
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"TerrestrialScreenShotMode"]) {
        
        NSDictionary *stringDict = @{
                                     @"string":self,
                                     @"context":@""
                                     };
        
        [[Terrestrial sharedInstance] storeScannedStringDict:stringDict];
        
    }
   
    
    return [[Terrestrial sharedInstance] stringForKey:self andContext:@""];
    
}


-(NSString *)translatedWithContext: (NSString *) context {
    
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"TerrestrialScreenShotMode"]) {
        
        NSDictionary *stringDict = @{
                                     @"string":self,
                                     @"context":context
                                     };
        
        [[Terrestrial sharedInstance] storeScannedStringDict:stringDict];
        
    }
    
    
    
    return [[Terrestrial sharedInstance] stringForKey:self andContext:context];
    
}


-(NSString *)dontTranslate {
    
    return self;
    
}

-(NSString *)translatedID {
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"TerrestrialScreenShotMode"]) {
        
        NSDictionary *stringDict = @{
                                     @"string":[[Terrestrial sharedInstance] appStringForID: self],
                                     @"context":@"",
                                     @"id":self
                                     };
        
        [[Terrestrial sharedInstance] storeScannedStringDict:stringDict];
        
    }
    
    return [[Terrestrial sharedInstance] appStringForID: self];
    
}


@end
