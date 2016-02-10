//
//  NSString+Terrestrial_String.m
//  TestTranslatorApp
//
//  Created by MrMambwe on 30/09/2015.
//  Copyright (c) 2015 Terrestrial. All rights reserved.
//

#import "NSString+Terrestrial_String.h"
#import "Terrestrial.h"
#import <TerrestrialPhotoshoot/TerrestrialPhotoshoot.h>


@implementation NSString (Terrestrial_String)


-(NSString *)translated {
    
    if ([[TerrestrialPhotoshoot sharedInstance] inScreenshotMode]) {
        
         NSString *returnedString = [[NSBundle mainBundle] localizedStringForKey:self value:@"" table:@"Localizable"];
        
        return  [[TerrestrialPhotoshoot sharedInstance] trackOnScreenString:returnedString withKey:self];
        
    }
    
    return [[NSBundle mainBundle] localizedStringForKey:self value:@"" table:@"Localizable"];
    //return [[Terrestrial sharedInstance] stringForKey:self andContext:@""];
    
}
/*

-(NSString *)translatedWithContext: (NSString *) context {
    
    
    if ([[TerrestrialPhotoshoot sharedInstance] inScreenshotMode]) {
        
        NSString *returnedString = [[NSBundle mainBundle] localizedStringForKey:self value:@"" table:@"Localizable"];
        
        return  [[TerrestrialPhotoshoot sharedInstance] trackOnScreenString:returnedString withKey:self];
        
    }
    
    return [[NSBundle mainBundle] localizedStringForKey:self value:@"" table:@"Localizable"];
    //return [[Terrestrial sharedInstance] stringForKey:self andContext:context];
    
} 
  */


@end
