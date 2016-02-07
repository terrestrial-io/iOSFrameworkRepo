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
@property (nonatomic) IBInspectable NSString *identifier;

@end

@interface UIButton (TerrestrialButton)
@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *identifier;
@end

@interface UITextField (TerrestrialTextField)
@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *identifier;
@end

@interface UITextView (TerrestrialTextView)

@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *identifier;

@end

@interface UIBarButtonItem (TerrestrialBarButtonItem)
@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *identifier;
@end

@interface UINavigationItem (TerrestrialNavigationItem)
@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *identifier;
@end

@interface UIViewController (TerrestrialViewController)
@property (nonatomic) IBInspectable BOOL Terrestrial;
@property (nonatomic) IBInspectable NSString *identifier;
@end