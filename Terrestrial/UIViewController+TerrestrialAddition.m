//
//  UIViewController+TerrestrialAddition.m
//  Terrestrial
//
//  Created by MrMambwe on 04/10/2015.
//  Copyright (c) 2015 Terrestrial. All rights reserved.
//

#import "UIViewController+TerrestrialAddition.h"
#import "Terrestrial.h"
#import "CameraView.h"
#import "SubviewsHelper.h"


@implementation UIViewController (TerrestrialAddition)



- (void)viewDidAppear:(BOOL)animated {
    
  
if ([[NSUserDefaults standardUserDefaults] valueForKey:@"TerrestrialScreenShotMode"] && ![[UIApplication sharedApplication].keyWindow viewWithTag:73636129]) {
    
    
         
    NSLog(@"Screenshot mode!");
    
    float padding = 20.0;
    float width = 60.0;
    float height = width;
    float borderRadius = width/2;
    
    
    UIButton *cameraButton = [[UIButton alloc] initWithFrame:CGRectMake([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width - width - padding, ([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height/2)- (height/2), width, height)];
    
    cameraButton.layer.cornerRadius = borderRadius;
    
    cameraButton.tag = 73636129;
    
    cameraButton.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:188.0/255.0 blue:156.0/255.0 alpha:1];
    
    CameraView *cameraIcon = [[CameraView alloc] initWithFrame:CGRectMake(0, 0, cameraButton.frame.size.width, cameraButton.frame.size.height)];
    
    cameraIcon.backgroundColor = [UIColor clearColor];
    
    cameraIcon.layer.cornerRadius = cameraButton.frame.size.width/2;
    
    [cameraButton addSubview:cameraIcon];
    
    cameraIcon.userInteractionEnabled = NO;
    
        if (![[UIApplication sharedApplication].keyWindow viewWithTag:73636129]) {
            
        [[UIApplication sharedApplication].keyWindow addSubview:cameraButton];
            
            NSLog(@"Adding screenshot button");
            
        }
    

   
    
    UIView *overlay = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.rootViewController.view.frame];
    
    overlay.backgroundColor = [UIColor colorWithWhite:0 alpha:0.9];
    
    overlay.tag = 85295652;
    
    overlay.alpha = 0;
    
    [[UIApplication sharedApplication].keyWindow addSubview:overlay];
    
    
    [cameraButton addTarget:self action:@selector(takeScreenshot:) forControlEvents:UIControlEventTouchUpInside];
    
         }
    
    
}



- (void) takeScreenshot:(UIButton *)button {
    
    UIView *greenBackground = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.rootViewController.view.frame];
    
    greenBackground.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:188.0/255.0 blue:156.0/255.0 alpha:1];
    
    [[UIApplication sharedApplication].keyWindow addSubview:greenBackground];
    
    greenBackground.transform = CGAffineTransformMakeTranslation(0, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height);
    
    [[[UIApplication sharedApplication].keyWindow viewWithTag:73636129] setAlpha:0];
    
    
    
    [self getAllSubviews];
    
    
    
    NSMutableArray *elementsPresentOnScreen = [self traverseTextSubviews];
    
    
    
    UIImage *blankScreenshot = [self imageFromView:[UIApplication sharedApplication].keyWindow];
    
    
    for (int i = 0; i <[[[SubviewsHelper sharedInstance] hiddenSubviewsArray] count] ; i ++ ) {
        
        
        UIView *subview = [[[[SubviewsHelper sharedInstance] hiddenSubviewsArray] objectAtIndex:i] objectAtIndex:0];
        
        [(UILabel *)subview setText:[[[[SubviewsHelper sharedInstance] hiddenSubviewsArray] objectAtIndex:i] objectAtIndex:1]];
            
        
        
        
    }

    UIImage *screenshot = [self imageFromView:[UIApplication sharedApplication].keyWindow];
    


    UILabel *progressDescription = [[UILabel alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height -100 + 20, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width, 50)];

    progressDescription.textColor = [UIColor whiteColor];
    
    progressDescription.textAlignment = NSTextAlignmentCenter;
    
    [progressDescription setText:@"Detecting .translated strings..."];
    
    progressDescription.alpha = 1.0;
    
    progressDescription.transform = CGAffineTransformMakeTranslation(0, 150);
    
    [[UIApplication sharedApplication].keyWindow addSubview:progressDescription];
    
    
    
    UILabel *terrestrialTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width, 50)];
    
    terrestrialTitle.textColor = [UIColor whiteColor];
    
    terrestrialTitle.textAlignment = NSTextAlignmentCenter;
    
    [terrestrialTitle setText:@"TERRESTRIAL"];
    
    terrestrialTitle.alpha = 1.0;
    
    terrestrialTitle.transform = CGAffineTransformMakeTranslation(0, -150);
    
     terrestrialTitle.font =  [UIFont fontWithName:@"Avenir-Black" size:12];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:terrestrialTitle.text];
    [attributedString addAttribute:NSKernAttributeName
                             value:@(10)
                             range:NSMakeRange(0, 10)];
    
    terrestrialTitle.attributedText = attributedString;
    
    
    [[UIApplication sharedApplication].keyWindow addSubview:terrestrialTitle];
    
    
    
    UIImageView *miniSreenshotView =[[UIImageView alloc] initWithImage:screenshot];
    

    
    
    [[UIApplication sharedApplication].keyWindow addSubview:miniSreenshotView];
    
    miniSreenshotView.alpha = 0;
    
    miniSreenshotView.layer.cornerRadius = 5.0;
    
    [UIView animateWithDuration:0.4 delay:0.3 usingSpringWithDamping:1.0 initialSpringVelocity:30 options:0 animations:^{
        
        progressDescription.transform = CGAffineTransformMakeTranslation(0, 0);
        terrestrialTitle.transform = CGAffineTransformMakeTranslation(0, 0);
        
        
        
        
    } completion:^(BOOL finished) {

        
    }];
    

    
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:30 options:0 animations:^{
        
        //button.transform = CGAffineTransformMakeTranslation(- (button.frame.origin.x-([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width/2)) - (button.frame.size.width/2), 0);
        
        
        [[[UIApplication sharedApplication].keyWindow viewWithTag:85295652] setAlpha: 1.0];
        
        miniSreenshotView.transform =CGAffineTransformMakeScale(0.75, 0.75);
        miniSreenshotView.alpha = 1.0;

        
        progressDescription.transform = CGAffineTransformMakeTranslation(0, 0);
        
    } completion:^(BOOL finished) {
        
        
        

    
   
        
        
        
        
        
        //elementsPresentOnScreen = [[SubviewsHelper sharedInstance] subviewsArray];
    
          
        NSLog(@"SHOT! %@",elementsPresentOnScreen);
        
        
        int it = 0;
        
        for (id element in elementsPresentOnScreen ) {
            
            if ([element respondsToSelector:@selector(text)]) {
                
            UIView * highlightView =[[UIView alloc] initWithFrame:[[element superview] convertRect:[element frame] toView:[UIApplication sharedApplication].keyWindow.rootViewController.view]];
        
            highlightView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0.2 alpha:0.5];
            
            highlightView.layer.cornerRadius = 5.0;
            
            highlightView.alpha = 0;
        
            [miniSreenshotView addSubview:highlightView];
            
            [UIView animateWithDuration:0.2 delay:0 + (0.2 * it) options:0  animations:^{
                
                highlightView.alpha = 1.0;
                
                
                
            } completion:^(BOOL finished) {
                
           
    
            }];
            
            it++;
                
            }
            
    
       
        }
        
        
    
     
      
    NSData *imageData = UIImagePNGRepresentation(screenshot);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH-mm"];
    
    NSString *formattedDateString = [dateFormatter stringFromDate:[NSDate date]];
    
    NSString *imageName = [NSString stringWithFormat:@"screenshot-%@.png",formattedDateString];
        
        /*
    
    PFFile *imageFile = [PFFile fileWithName:imageName data:imageData];
        
    
        
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if ( succeeded) {


           
                
     
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionLayoutSubviews  animations:^{
         
       
        greenBackground.transform = CGAffineTransformMakeTranslation(0, 0);
        
        
        
        
     } completion:^(BOOL finished) {
        
         
         [progressDescription setText:@"Upload Completed!"];
         
         miniSreenshotView.transform = CGAffineTransformMakeScale(1.0, 1.0);
   
         UIImageView *copy = [[UIImageView alloc] initWithImage:[self imageFromView:miniSreenshotView]];
         
         [[UIApplication sharedApplication].keyWindow addSubview:copy];
        
         
         miniSreenshotView.alpha = 0;
         
         
         
         copy.frame = CGRectMake(([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width - copy.frame.size.width*0.75)/2, ([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height - copy.frame.size.height*0.75)/2, copy.frame.size.width*0.75, copy.frame.size.height*0.75);
        
         

         
         [UIView animateWithDuration:1.0 delay:0.3 options:UIViewAnimationOptionLayoutSubviews animations:^{
             
             
             CGAffineTransform scale = CGAffineTransformMakeScale(0.75, 0.75);
             // Move to the left
             CGAffineTransform translate = CGAffineTransformMakeTranslation(0, -[UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height);
             // Apply them to a view
             copy.transform = translate;
             
             greenBackground.transform = CGAffineTransformMakeTranslation(0, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height);
             
             
             
             [[[UIApplication sharedApplication].keyWindow viewWithTag:85295652] setAlpha: 0.0];
             
             progressDescription.alpha = 0.0;
             terrestrialTitle.alpha = 0.0;
             
             [[UIApplication sharedApplication].keyWindow viewWithTag:73636129].alpha = 1.0;
             
             
         
         
         } completion:^(BOOL finished) {
             
             
             [progressDescription removeFromSuperview];
             [greenBackground removeFromSuperview];
             [terrestrialTitle removeFromSuperview ];
             [miniSreenshotView removeFromSuperview ];
             //[[[UIApplication sharedApplication].keyWindow viewWithTag:85295652] removeFromSuperview];
             
             
             
         }];
             
        
         
         
         
  
         
     }];
                
     
                
         
        
            
            
        } else {
            
            
            [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionLayoutSubviews  animations:^{
                
                
                greenBackground.transform = CGAffineTransformMakeTranslation(0, 0);
                greenBackground.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0.2 alpha:1];
                
                
                
                
            } completion:^(BOOL finished) {
                
                
                [progressDescription setText:@"Error, try again."];
                
                miniSreenshotView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                
                UIImageView *copy = [[UIImageView alloc] initWithImage:[self imageFromView:miniSreenshotView]];
                
                [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:copy];
                
                
                miniSreenshotView.alpha = 0;
                
                
                
                copy.frame = CGRectMake(([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width - copy.frame.size.width*0.75)/2, ([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height - copy.frame.size.height*0.75)/2, copy.frame.size.width*0.75, copy.frame.size.height*0.75);
                
                
     
                
                [UIView animateWithDuration:1.0 delay:0.3 options:UIViewAnimationOptionLayoutSubviews animations:^{
                    
                    
                    //CGAffineTransform scale = CGAffineTransformMakeScale(0.75, 0.75);
                    // Move to the left
                    CGAffineTransform translate = CGAffineTransformMakeTranslation(0, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height);
                    // Apply them to a view
                    copy.transform = translate;
                    
                    greenBackground.transform = CGAffineTransformMakeTranslation(0, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height);
                    
                   
                    
                    button.alpha = 1.0;
                    
                    [[[UIApplication sharedApplication].keyWindow.rootViewController.view viewWithTag:85295652] setAlpha: 0.0];
                    
                    progressDescription.alpha = 0.0;
                    terrestrialTitle.alpha = 0.0;
                    
                    
                    
                    
                } completion:^(BOOL finished) {
                    
                    
                    [progressDescription removeFromSuperview];
                    [greenBackground removeFromSuperview];
                    [terrestrialTitle removeFromSuperview ];
                    [miniSreenshotView removeFromSuperview ];
                    
                    
                    
                }];
                
                
                
                
                
                
                
            }];

            
            
        }
        
      
        
        }];
     
     */
        
        
        
         }];
    
}

- (UIImage *)imageFromView:(UIView *) view
{
    
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [[UIScreen mainScreen] scale]);
    } else {
        UIGraphicsBeginImageContext(view.frame.size);
    }
    [view.layer renderInContext: UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
    
}

- (void) getAllSubviews {
    
    [[SubviewsHelper sharedInstance] setSubviewsArray:[[NSMutableArray alloc] init]];
    
    [self listSubviewsOfView:[UIApplication sharedApplication].keyWindow];
    
    
    
}

- (void)listSubviewsOfView:(UIView *)view {
    
    // Get the subviews of the view
    NSArray *subviews = [view subviews];
    
    
    
    // Return if there are no subviews
    if ([subviews count] == 0) return; // COUNT CHECK LINE
    
    for (UIView *subview in subviews) {
        
        // Do what you want to do with the subview
       // NSLog(@"%@", subview);
        
        [[[SubviewsHelper sharedInstance] subviewsArray] addObject:subview];
        
        // List the subviews of subview
        [self listSubviewsOfView:subview];
        
    }
}

- (NSMutableArray *)traverseTextSubviews {
    
    
    NSMutableArray *scannedStrings = [[Terrestrial sharedInstance] scannedStrings];
    
    NSMutableArray *elementsPresentOnScreen = [[NSMutableArray alloc] init];
    
    NSLog(@"Scanned! %@",scannedStrings);
    
    [[SubviewsHelper sharedInstance] setHiddenSubviewsArray:[[NSMutableArray alloc] init]];
    
    
    NSLog(@"SUBVIEWS ARRAY: %@",[[SubviewsHelper sharedInstance] subviewsArray]);
    
    for (id element in [[SubviewsHelper sharedInstance] subviewsArray]) {
        
        if ([element respondsToSelector:@selector(text)]) {
            
            
            for (NSDictionary *stringDict in scannedStrings ) {
                
                
                if ([[stringDict objectForKey:@"string"] isEqualToString:[element text]]) {
                    
                    
                    
                    
                    CGRect viewFrame = [[element superview] convertRect:[element frame] toView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
                    
                    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
                    
                    
                    if (CGRectIntersectsRect(viewFrame, appFrame)) {
                        
                        [elementsPresentOnScreen addObject:element];
                        
                        NSMutableDictionary *metadata = [[NSMutableDictionary alloc] init];
                        [metadata setValue:NSStringFromClass([UILabel class]) forKey:@"element-class"];
                        
                        
                        
                        
                        if([element isKindOfClass: [UILabel class]]){
                            //check ur Label text here
                            UILabel * myLabel = (UILabel *) element;
                            
                            
                    
                            
                            
                            [metadata setValue:myLabel.font.fontName forKey:@"font-name"];
                            
                            [metadata setValue:[NSString stringWithFormat: @"%.1f", myLabel.font.pointSize] forKey:@"font-size"];
                            
                            
                            NSString *lineBreakString;
                            
                            switch(myLabel.lineBreakMode) {
                                    
                                case NSLineBreakByWordWrapping:
                                    lineBreakString = @"NSLineBreakByWordWrapping";
                                    break;
                                case NSLineBreakByClipping:
                                    lineBreakString = @"NSLineBreakByClipping";
                                    break;
                                case NSLineBreakByTruncatingHead:
                                    lineBreakString = @"NSLineBreakByTruncatingHead";
                                    break;
                                case NSLineBreakByTruncatingTail:
                                    lineBreakString = @"NSLineBreakByTruncatingTail";
                                    break;
                                case NSLineBreakByTruncatingMiddle:
                                    lineBreakString = @"NSLineBreakByTruncatingMiddle";
                                    break;
                                default:
                                    lineBreakString = @"unknown";
                            }
                            
                            UIColor *color = myLabel.textColor;
                            const CGFloat *components = CGColorGetComponents(color.CGColor);
                            NSString *colorAsString = [NSString stringWithFormat:@"%.1f,%.1f,%.1f,%.1f", components[0], components[1], components[2], components[3]];
                            
                            [metadata setValue:lineBreakString forKey:@"line-break-mode"];
                            [metadata setValue:lineBreakString forKey:@"line-break-mode"];
                            
                            [metadata setValue:colorAsString forKey:@"font-color"];
                            
                            CGRect viewRect = [[element superview] convertRect:[element frame] toView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
                            
                            [metadata setValue:[NSString stringWithFormat:@"%.2f,%.2f,%.2f,%.2f",viewRect.origin.x, viewRect.origin.y,viewRect.size.width,viewRect.size.height] forKey:@"view-rect"];
                            
                            CGRect superViewRect = [UIApplication sharedApplication].keyWindow.rootViewController.view.frame;
                            
                            [metadata setValue:[NSString stringWithFormat:@"%.2f,%.2f,%.2f,%.2f",superViewRect.origin.x, superViewRect.origin.y,superViewRect.size.width,superViewRect.size.height] forKey:@"super-view-rect"];
                            
                            
                            NSLog(@"%@",NSStringFromCGRect([[element superview] convertRect:[element frame] toView:[UIApplication sharedApplication].keyWindow.rootViewController.view]));
                            
                            [metadata setValue:((UILabel *)element).text forKey:@"string"];
                            
                            
                            NSLog(@"MY UI LABEL %@",myLabel);
                            NSLog(@"MY UI FONT %@",myLabel.font);
                            NSLog(@"MY METADATA! %@",metadata);
                            
                            
                            [[[SubviewsHelper sharedInstance] hiddenSubviewsArray] addObject:@[element,((UILabel *)element).text]];
                            
                            
                            [(UILabel *)element setText:@""];
                            
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                }
                
                
            }
            
        }
        
    }
    
    
    return elementsPresentOnScreen;

}



@end
