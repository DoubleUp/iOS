//
//  FourthViewController.m
//  Wakeboard
//
//  Created by Chad Zeluff on 11/11/12.
//  Copyright (c) 2012 Chad Zeluff. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (id)init
{
	if (self = [super init])
    {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"nav-news"] withFinishedUnselectedImage:[UIImage imageNamed:@"nav-news"]];
        int offset = 5;
        UIEdgeInsets imageInset = UIEdgeInsetsMake(offset, 0, -offset, 0);
        [self.tabBarItem setImageInsets:imageInset];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
