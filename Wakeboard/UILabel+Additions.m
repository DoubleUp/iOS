//
//  UILabel+Additions.m
//  Wakeboard
//
//  Created by Chad Zeluff on 11/14/12.
//  Copyright (c) 2012 Chad Zeluff. All rights reserved.
//

#import "UILabel+Additions.h"

@implementation UILabel (Additions)

+ (UILabel *)orangeLightLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpOrangeColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont lightFontOfSize:size];
    return label;
}

+ (UILabel *)orangeRegularLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpOrangeColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont regularFontOfSize:size];
    return label;
}

+ (UILabel *)orangeBoldLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpOrangeColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldFontOfSize:size];
    return label;
}

+ (UILabel *)blueLightLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpBlueColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont lightFontOfSize:size];
    return label;
}

+ (UILabel *)blueRegularLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpBlueColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont regularFontOfSize:size];
    return label;
}

+ (UILabel *)blueBoldLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpBlueColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldFontOfSize:size];
    return label;
}

+ (UILabel *)blackLightLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpBlackColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont lightFontOfSize:size];
    return label;
}

+ (UILabel *)blackRegularLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpBlackColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont regularFontOfSize:size];
    return label;
}

+ (UILabel *)blackBoldLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpBlackColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldFontOfSize:size];
    return label;
}

+ (UILabel *)lightGreyLightLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpLightGreyColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont lightFontOfSize:size];
    return label;
}

+ (UILabel *)lightGreyRegularLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpLightGreyColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont regularFontOfSize:size];
    return label;
}

+ (UILabel *)lightGreyBoldLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpLightGreyColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldFontOfSize:size];
    return label;
}

+ (UILabel *)darkGreyLightLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpDarkGreyColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont lightFontOfSize:size];
    return label;
}

+ (UILabel *)darkGreyRegularLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpDarkGreyColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont regularFontOfSize:size];
    return label;
}

+ (UILabel *)darkGreyBoldLabelWithSize:(CGFloat)size
{
    UILabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor dblUpDarkGreyColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldFontOfSize:size];
    return label;
}

- (void)setCenter:(CGPoint)center
{
    [super setCenter:center];
    self.frame = CGRectIntegral(self.frame);
}

@end
