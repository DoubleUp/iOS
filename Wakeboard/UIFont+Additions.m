//
//  UIFont+Additions.m
//  Wakeboard
//
//  Created by Chad Zeluff on 11/14/12.
//  Copyright (c) 2012 Chad Zeluff. All rights reserved.
//

#import "UIFont+Additions.h"

@implementation UIFont (Additions)

+ (UIFont *)lightFontOfSize:(CGFloat)fontSize
{
    return [self fontWithName:@"Oswald-Light" size:fontSize];
}

+ (UIFont *)regularFontOfSize:(CGFloat)fontSize
{
    return [self fontWithName:@"Oswald-Regular" size:fontSize];
}

+ (UIFont *)boldFontOfSize:(CGFloat)fontSize
{
    return [self fontWithName:@"Oswald-Bold" size:fontSize];
}

@end
