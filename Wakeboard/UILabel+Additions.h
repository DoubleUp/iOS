//
//  UILabel+Additions.h
//  Wakeboard
//
//  Created by Chad Zeluff on 11/14/12.
//  Copyright (c) 2012 Chad Zeluff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Additions)

+ (UILabel *)orangeLightLabelWithSize:(CGFloat)size;
+ (UILabel *)orangeRegularLabelWithSize:(CGFloat)size;
+ (UILabel *)orangeBoldLabelWithSize:(CGFloat)size;

+ (UILabel *)blueLightLabelWithSize:(CGFloat)size;
+ (UILabel *)blueRegularLabelWithSize:(CGFloat)size;
+ (UILabel *)blueBoldLabelWithSize:(CGFloat)size;

+ (UILabel *)blackLightLabelWithSize:(CGFloat)size;
+ (UILabel *)blackRegularLabelWithSize:(CGFloat)size;
+ (UILabel *)blackBoldLabelWithSize:(CGFloat)size;

+ (UILabel *)lightGreyLightLabelWithSize:(CGFloat)size;
+ (UILabel *)lightGreyRegularLabelWithSize:(CGFloat)size;
+ (UILabel *)lightGreyBoldLabelWithSize:(CGFloat)size;

+ (UILabel *)darkGreyLightLabelWithSize:(CGFloat)size;
+ (UILabel *)darkGreyRegularLabelWithSize:(CGFloat)size;
+ (UILabel *)darkGreyBoldLabelWithSize:(CGFloat)size;

- (void)setCenter:(CGPoint)center;

@end
