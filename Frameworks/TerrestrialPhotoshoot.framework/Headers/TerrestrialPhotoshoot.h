//
//  TerrestrialPhotoshoot.h
//  TerrestrialPhotoshoot
//
//  Created by MrMambwe on 02/02/2016.
//  Copyright © 2016 Terrestrial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+TerrestrialAddition.h"

//! Project version number for TerrestrialPhotoshoot.
FOUNDATION_EXPORT double TerrestrialPhotoshootVersionNumber;

//! Project version string for TerrestrialPhotoshoot.
FOUNDATION_EXPORT const unsigned char TerrestrialPhotoshootVersionString[];


#if !defined(screenshotLaunchArgument)

#define screenshotLaunchArgument @"TerrestrialScreenShotMode"

#endif


@interface TerrestrialPhotoshoot : NSObject


+ (id)sharedInstance;

/*** Working with Localizable.strings for screenshots ***/

+ (NSString *) detectStringForKey:(NSString *)key;
+ (NSString *) detectStringForKey:(NSString *)key andTable:(NSString *)tbl;
+ (NSString *) detectStringForKey:(NSString *)key andTable:(NSString *)tbl inBundle:(NSBundle *)bundle;
+ (NSString *) detectStringForKey:(NSString *)key andTable:(NSString *)tbl inBundle:(NSBundle *)bundle andDefaultValue:(NSString *)val;

#define NSLocalizedString(key, comment) \
[TerrestrialPhotoshoot detectStringForKey:key]

#define NSLocalizedStringFromTable(key, tbl, comment) \
[TerrestrialPhotoshoot  detectStringForKey:key andTable:tbl]

#define NSLocalizedStringFromTableInBundle(key, tbl, bundle, comment) \
[TerrestrialPhotoshoot detectStringForKey:key andTable:tbl inBundle:bundle]

#define NSLocalizedStringWithDefaultValue(key, tbl, bundle, val, comment) \
[TerrestrialPhotoshoot detectStringForKey:key andTable:tbl inBundle:bundle andDefaultValue:val]



- (NSString *) trackOnScreenString: (NSString *) string withKey:(NSString *)key;


@property (strong, nonatomic) NSMutableArray *scannedStrings;

- (BOOL)inScreenshotMode;



@end