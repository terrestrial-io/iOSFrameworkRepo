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

    return [[Terrestrial sharedInstance] stringForKey:self andContext:@""];
    
    
    
}


-(NSString *)translatedWithContext: (NSString *) context {
    
    return [[Terrestrial sharedInstance] stringForKey:self andContext:context];
    
}


-(NSString *)dontTranslate {
    
    return self;
    
}


@end
