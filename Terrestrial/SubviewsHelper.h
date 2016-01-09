//
//  SubviewsHelper.h
//  Terrestrial
//
//  Created by MrMambwe on 07/10/2015.
//  Copyright (c) 2015 Terrestrial. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubviewsHelper : NSObject

@property (strong, nonatomic) NSMutableArray *subviewsArray;
@property (strong, nonatomic) NSMutableArray *hiddenSubviewsArray;
@property (strong, nonatomic) NSMutableArray *detectedStringsArray;


+ (id)sharedInstance;

@end
