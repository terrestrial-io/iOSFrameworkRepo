//
//  UILabel+TerrestrialLabel.m
//  StoryboardTest
//
//  Created by MrMambwe on 10/11/2015.
//  Copyright © 2015 Terrestrial. All rights reserved.
//

#import "TerrestrialUICategoryAdditions.h"
#import <Terrestrial/Terrestrial.h>
#import <objc/runtime.h>



@implementation UILabel (TerrestrialLabel)

@dynamic baseStringID;
@dynamic Terrestrial;
@dynamic contextInfo;


- (void)setContextInfo:(NSString *)contextInfo {
    
    if (![contextInfo isEqualToString:@""]) {
        
        [self setText:[self.text translatedWithContext:contextInfo]];
        
    }
    
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setText:self.text.translated];
        
    }
    
}


@end

@implementation UIButton (TerrestrialButton)

@dynamic baseStringID;
@dynamic Terrestrial;
@dynamic contextInfo;



- (void)setContextInfo:(NSString *)contextInfo {
    
    if (![contextInfo isEqualToString:@""]) {
        
        [self setTitle:[self.titleLabel.text translatedWithContext:contextInfo] forState:UIControlStateNormal];
        
    }
    
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setTitle:self.titleLabel.text.translated forState:UIControlStateNormal];
        
    }
    
}


@end

@implementation UITextField (TerrestrialTextField)

@dynamic baseStringID;
@dynamic Terrestrial;
@dynamic contextInfo;




- (void)setContextInfo:(NSString *)contextInfo {
    
    if (![contextInfo isEqualToString:@""]) {
        
        [self setText:[self.text translatedWithContext:contextInfo]];
        [self setPlaceholder:[self.placeholder translatedWithContext:contextInfo]];
        
    }
    
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setText:self.text.translated];
        [self setPlaceholder:self.placeholder.translated];
        
    }
    
}



@end


@implementation UITextView (TerrestrialTextField)





- (void)setContextInfo:(NSString *)contextInfo {
    
    if (![contextInfo isEqualToString:@""]) {
        
        [self setText:[self.text translatedWithContext:contextInfo]];

        
    }
    
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setText:self.text.translated];
        
    }
    
}



@end


@implementation UIBarButtonItem (TerrestrialBarButtonItem)


@dynamic baseStringID;
@dynamic Terrestrial;
@dynamic contextInfo;




- (void)setContextInfo:(NSString *)contextInfo {
    
    if (![contextInfo isEqualToString:@""]) {
        
        [self setTitle:[self.title translatedWithContext:contextInfo]];
        
    }
    
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setTitle:self.title.translated];
        
    }
    
}


@end

@implementation UINavigationItem (TerrestrialNavigationItem)

@dynamic baseStringID;
@dynamic Terrestrial;
@dynamic contextInfo;



- (void)setContextInfo:(NSString *)contextInfo {
    
    if (![contextInfo isEqualToString:@""]) {
        
        [self setTitle:[self.title translatedWithContext:contextInfo]];
        [self setPrompt:[self.prompt translatedWithContext:contextInfo]];
        
    }
    
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setTitle:self.title.translated];
        [self setPrompt:self.prompt.translated];
        
    }
    
}

@end


@implementation UIViewController (TerrestrialViewController)

@dynamic baseStringID;
@dynamic Terrestrial;
@dynamic contextInfo;



- (void)setContextInfo:(NSString *)contextInfo {
    
    if (![contextInfo isEqualToString:@""]) {
        
        [self setTitle:[self.title translatedWithContext:contextInfo]];
        
    }
    
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setTitle:self.title.translated];
        
    }
    
}

@end
