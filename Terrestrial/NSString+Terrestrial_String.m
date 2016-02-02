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

@dynamic terrestrialContextInfo;


-(NSString *)translated {
    
    if ([[TerrestrialPhotoshoot sharedInstance] inScreenshotMode]) {
        
        return  [[TerrestrialPhotoshoot sharedInstance] trackOnScreenString:self withKey:@""];
        
    }
    
    //return [[NSBundle mainBundle] localizedStringForKey:self value:@"" table:nil];
    return [[Terrestrial sharedInstance] stringForKey:self andContext:@""];
    
}


-(NSString *)translatedWithContext: (NSString *) context {
    
    
    if ([[TerrestrialPhotoshoot sharedInstance] inScreenshotMode]) {
        
        return  [[TerrestrialPhotoshoot sharedInstance] trackOnScreenString:self withKey:@""];
        
    }
    
    //return [[NSBundle mainBundle] localizedStringForKey:self value:@"" table:nil];
    return [[Terrestrial sharedInstance] stringForKey:self andContext:context];
    
}


-(NSString *)dontTranslate {
    
    return self;
    
}

-(NSString *)translatedID {
    
    if ([[TerrestrialPhotoshoot sharedInstance] inScreenshotMode]) {
        
        return  [[TerrestrialPhotoshoot sharedInstance] trackOnScreenString:[[Terrestrial sharedInstance] appStringForID: self] withKey:self];
        
    }
    
    //return [[NSBundle mainBundle] localizedStringForKey:self value:@"" table:nil];
    
    return [[Terrestrial sharedInstance] appStringForID: self];
    
}


@end
