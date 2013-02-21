//
//  HomeCellView.h
//  Wakeboard
//
//  Created by Gary Robinson on 2/11/13.
//  Copyright (c) 2013 Chad Zeluff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCellView : UIView

@property (strong, nonatomic) TrickPost *cellTrickPost;
+ (CGFloat)cellHeightForTrickPost:(TrickPost*)trickPost;

@end
