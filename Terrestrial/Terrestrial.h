//
//  Terrestrial.h
//  Terrestrial
//
//  Created by MrMambwe on 16/09/2015.
//  Copyright (c) 2015 Terrestrial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+Terrestrial_String.h"
#import "NSLocalizedStringSync.h"

//! Project version number for Terrestrial.
FOUNDATION_EXPORT double TerrestrialVersionNumber;

//! Project version string for Terrestrial.
FOUNDATION_EXPORT const unsigned char TerrestrialVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Terrestrial/PublicHeader.h>



#define translated(string) [[Terrestrial sharedInstance] stringForKey:string]





@interface Terrestrial : NSObject {
    
    NSArray *retrievedStrings;
    NSString *manualLocale;
    
}

+ (id)sharedInstance;


- (NSString *) stringForKey: (NSString *) stringToTranslate andContext: (NSString *) contextString;
- (void) setCurrentLanguageTo: (NSString *) lang;



@end



