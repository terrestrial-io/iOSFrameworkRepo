//
//  SubviewsHelper.m
//  Terrestrial
//
//  Created by MrMambwe on 07/10/2015.
//  Copyright (c) 2015 Terrestrial. All rights reserved.
//

#import "SubviewsHelper.h"

@implementation SubviewsHelper

+ (id)sharedInstance {
    
    static SubviewsHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


@end
