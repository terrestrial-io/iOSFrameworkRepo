//
//  UILabel+TerrestrialLabel.h
//  StoryboardTest
//
//  Created by MrMambwe on 10/11/2015.
//  Copyright © 2015 Terrestrial. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE

@interface UILabel (TerrestrialLabel)
@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *contextInfo;
@property (nonatomic) IBInspectable NSString *baseStringID;

@end

@interface UIButton (TerrestrialButton)
@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *contextInfo;
@property (nonatomic) IBInspectable NSString *baseStringID;
@end

@interface UITextField (TerrestrialTextField)
@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *contextInfo;
@property (nonatomic) IBInspectable NSString *baseStringID;
@end

@interface UITextView (TerrestrialTextView)

@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *contextInfo;
@property (nonatomic) IBInspectable NSString *baseStringID;

@end

@interface UIBarButtonItem (TerrestrialBarButtonItem)
@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *contextInfo;
@property (nonatomic) IBInspectable NSString *baseStringID;
@end

@interface UINavigationItem (TerrestrialNavigationItem)
@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *contextInfo;
@property (nonatomic) IBInspectable NSString *baseStringID;
@end

@interface UIViewController (TerrestrialViewController)
@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *contextInfo;
@property (nonatomic) IBInspectable NSString *baseStringID;
@end