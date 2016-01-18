//
//  CameraView.m
//  Terrestrial
//
//  Created by MrMambwe on 06/10/2015.
//  Copyright (c) 2015 Terrestrial. All rights reserved.
//

#import "CameraView.h"

@implementation CameraView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Forma 1 Drawing
    UIBezierPath* forma1Path = [UIBezierPath bezierPath];
    [forma1Path moveToPoint: CGPointMake(33.62, 26.7)];
    [forma1Path addCurveToPoint: CGPointMake(29.91, 30.57) controlPoint1: CGPointMake(31.57, 26.7) controlPoint2: CGPointMake(29.91, 28.44)];
    [forma1Path addCurveToPoint: CGPointMake(33.62, 34.45) controlPoint1: CGPointMake(29.91, 32.71) controlPoint2: CGPointMake(31.57, 34.45)];
    [forma1Path addCurveToPoint: CGPointMake(37.33, 30.57) controlPoint1: CGPointMake(35.66, 34.45) controlPoint2: CGPointMake(37.33, 32.71)];
    [forma1Path addCurveToPoint: CGPointMake(33.62, 26.7) controlPoint1: CGPointMake(37.33, 28.44) controlPoint2: CGPointMake(35.66, 26.7)];
    [forma1Path closePath];
    [forma1Path moveToPoint: CGPointMake(39.7, 21.98)];
    [forma1Path addLineToPoint: CGPointMake(38.11, 21.98)];
    [forma1Path addLineToPoint: CGPointMake(36.1, 20.01)];
    [forma1Path addLineToPoint: CGPointMake(30.51, 20.01)];
    [forma1Path addLineToPoint: CGPointMake(28.87, 21.98)];
    [forma1Path addLineToPoint: CGPointMake(25.5, 21.98)];
    [forma1Path addCurveToPoint: CGPointMake(24.45, 20.88) controlPoint1: CGPointMake(25.35, 21.33) controlPoint2: CGPointMake(24.94, 20.88)];
    [forma1Path addLineToPoint: CGPointMake(22.06, 20.88)];
    [forma1Path addCurveToPoint: CGPointMake(21.01, 21.99) controlPoint1: CGPointMake(21.57, 20.88) controlPoint2: CGPointMake(21.16, 21.33)];
    [forma1Path addCurveToPoint: CGPointMake(17.99, 25.44) controlPoint1: CGPointMake(19.32, 22.15) controlPoint2: CGPointMake(17.99, 23.63)];
    [forma1Path addLineToPoint: CGPointMake(17.99, 35.53)];
    [forma1Path addCurveToPoint: CGPointMake(21.3, 38.99) controlPoint1: CGPointMake(17.99, 37.43) controlPoint2: CGPointMake(19.48, 38.99)];
    [forma1Path addLineToPoint: CGPointMake(39.7, 38.99)];
    [forma1Path addCurveToPoint: CGPointMake(43.01, 35.53) controlPoint1: CGPointMake(41.52, 38.99) controlPoint2: CGPointMake(43.01, 37.43)];
    [forma1Path addLineToPoint: CGPointMake(43.01, 25.44)];
    [forma1Path addCurveToPoint: CGPointMake(39.7, 21.98) controlPoint1: CGPointMake(43.01, 23.53) controlPoint2: CGPointMake(41.52, 21.98)];
    [forma1Path closePath];
    [forma1Path moveToPoint: CGPointMake(20.99, 34.63)];
    [forma1Path addCurveToPoint: CGPointMake(20.36, 35.28) controlPoint1: CGPointMake(20.99, 34.99) controlPoint2: CGPointMake(20.71, 35.28)];
    [forma1Path addCurveToPoint: CGPointMake(19.74, 34.63) controlPoint1: CGPointMake(20.02, 35.28) controlPoint2: CGPointMake(19.74, 34.99)];
    [forma1Path addLineToPoint: CGPointMake(19.74, 27.73)];
    [forma1Path addCurveToPoint: CGPointMake(20.36, 27.08) controlPoint1: CGPointMake(19.74, 27.37) controlPoint2: CGPointMake(20.02, 27.08)];
    [forma1Path addCurveToPoint: CGPointMake(20.99, 27.73) controlPoint1: CGPointMake(20.71, 27.08) controlPoint2: CGPointMake(20.99, 27.37)];
    [forma1Path addLineToPoint: CGPointMake(20.99, 34.63)];
    [forma1Path closePath];
    [forma1Path moveToPoint: CGPointMake(24.75, 24.53)];
    [forma1Path addCurveToPoint: CGPointMake(24.09, 25.22) controlPoint1: CGPointMake(24.75, 24.91) controlPoint2: CGPointMake(24.45, 25.22)];
    [forma1Path addLineToPoint: CGPointMake(22.39, 25.22)];
    [forma1Path addCurveToPoint: CGPointMake(21.73, 24.53) controlPoint1: CGPointMake(22.03, 25.22) controlPoint2: CGPointMake(21.73, 24.91)];
    [forma1Path addLineToPoint: CGPointMake(21.73, 24.12)];
    [forma1Path addCurveToPoint: CGPointMake(22.39, 23.44) controlPoint1: CGPointMake(21.73, 23.74) controlPoint2: CGPointMake(22.03, 23.44)];
    [forma1Path addLineToPoint: CGPointMake(24.09, 23.44)];
    [forma1Path addCurveToPoint: CGPointMake(24.75, 24.12) controlPoint1: CGPointMake(24.46, 23.44) controlPoint2: CGPointMake(24.75, 23.74)];
    [forma1Path addLineToPoint: CGPointMake(24.75, 24.53)];
    [forma1Path closePath];
    [forma1Path moveToPoint: CGPointMake(33.62, 36.1)];
    [forma1Path addCurveToPoint: CGPointMake(28.33, 30.57) controlPoint1: CGPointMake(30.7, 36.1) controlPoint2: CGPointMake(28.33, 33.62)];
    [forma1Path addCurveToPoint: CGPointMake(33.62, 25.05) controlPoint1: CGPointMake(28.33, 27.53) controlPoint2: CGPointMake(30.7, 25.05)];
    [forma1Path addCurveToPoint: CGPointMake(38.91, 30.57) controlPoint1: CGPointMake(36.54, 25.05) controlPoint2: CGPointMake(38.91, 27.53)];
    [forma1Path addCurveToPoint: CGPointMake(33.62, 36.1) controlPoint1: CGPointMake(38.91, 33.62) controlPoint2: CGPointMake(36.54, 36.1)];
    [forma1Path closePath];
    [fillColor setFill];
    [forma1Path fill];

    
    
}



@end
