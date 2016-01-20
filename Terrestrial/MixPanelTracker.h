//
//  MixPanelTracker.h
//  Terrestrial
//
//  Created by MrMambwe on 18/01/2016.
//  Copyright © 2016 Terrestrial. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MixPanelTracker : NSObject

+ (void) trackEvent:(NSString *)name withProperties:(NSDictionary *)properties ;

@end
