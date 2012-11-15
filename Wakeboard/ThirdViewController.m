//
//  ThirdViewController.m
//  Wakeboard
//
//  Created by Chad Zeluff on 11/11/12.
//  Copyright (c) 2012 Chad Zeluff. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)init
{
	if (self = [super init])
    {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"nav-compass"] withFinishedUnselectedImage:[UIImage imageNamed:@"nav-compass"]];
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
