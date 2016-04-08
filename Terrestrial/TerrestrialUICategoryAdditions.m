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

@dynamic Identifier;
@dynamic Terrestrial;


- (void)setIdentifier:(NSString *)theID {
    
        [self setText:theID.translated];
    
}

- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        

        
    }
    
}


@end

@implementation UIButton (TerrestrialButton)

@dynamic Identifier;
@dynamic Terrestrial;

- (void)setIdentifier:(NSString *)theID {
    
    [self setTitle:theID.translated forState:UIControlStateNormal];
    
}

- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {

        
    }
    
}


@end

@implementation UITextField (TerrestrialTextField)

@dynamic Identifier;
@dynamic Terrestrial;


- (void)setIdentifier:(NSString *)theID {
    
    [self setPlaceholder:self.placeholder.translated];
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        

        
    }
    
}



@end


@implementation UITextView (TerrestrialTextField)


- (void)setIdentifier:(NSString *)theID {
    
    [self setText:theID.translated];
    
}




- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
    
        
        
    }
    
}



@end


@implementation UIBarButtonItem (TerrestrialBarButtonItem)


@dynamic Identifier;
@dynamic Terrestrial;

- (void)setIdentifier:(NSString *)theID {
    
    [self setTitle:theID.translated];
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        
    }
    
}


@end

@implementation UINavigationItem (TerrestrialNavigationItem)

@dynamic Identifier;
@dynamic Terrestrial;

- (void)setIdentifier:(NSString *)theID {
    
    [self setTitle:theID.translated];
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        
    }
    
}

@end


@implementation UIViewController (TerrestrialViewController)

@dynamic Identifier;
@dynamic Terrestrial;

- (void)setIdentifier:(NSString *)theID {
    
    [self setTitle:theID.translated];
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        
    }
    
}

@end
