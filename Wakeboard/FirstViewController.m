//
//  FirstViewController.m
//  Wakeboard
//
//  Created by Chad Zeluff on 11/11/12.
//  Copyright (c) 2012 Chad Zeluff. All rights reserved.
//

#import "FirstViewController.h"
#import "HomeCellView.h"

#define HOME_CELL_VIEW_TAG  1

#define CELL_MARGIN         10
#define CELL_HEIGHT         150

@interface FirstViewController ()

@property (nonatomic, strong) UITableView* homeTableView;
@property (nonatomic, strong) NSMutableArray* posts;

@end

@implementation FirstViewController

- (id)init
{
	if (self = [super init])
    {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"nav-home"] withFinishedUnselectedImage:[UIImage imageNamed:@"nav-home"]];
        int offset = 5;
        UIEdgeInsets imageInset = UIEdgeInsetsMake(offset, 0, -offset, 0);
        [self.tabBarItem setImageInsets:imageInset];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"DOUBLE UP"];
    
    [self.view addSubview:self.homeTableView];
}

-(NSMutableArray*)posts
{
    if(_posts == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"posts" ofType:@"plist"];
        NSDictionary *postsPlist = [NSDictionary dictionaryWithContentsOfFile:path];
        _posts = [postsPlist objectForKey:@"posts"];
    }
    return _posts;
}

-(UITableView*)homeTableView
{
    if(_homeTableView == nil)
    {
        CGFloat tableViewHeight = self.view.bounds.size.height - self.tabBarController.tabBar.bounds.size.height - self.navigationController.navigationBar.bounds.size.height;
        _homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, tableViewHeight) style:UITableViewStylePlain];
        _homeTableView.dataSource = self;
        _homeTableView.delegate = self;
        _homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _homeTableView;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DoubleUpCell";
    
    HomeCellView* cellView = nil;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        cellView = [[HomeCellView alloc] initWithFrame:CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.width)];
        cellView.tag = HOME_CELL_VIEW_TAG;
        [cell.contentView addSubview:cellView];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else
    {
        cellView = (HomeCellView *)[cell.contentView viewWithTag:HOME_CELL_VIEW_TAG];        
    }
	
    cellView.cellDictionary = [self.posts objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *cellDictionary = [self.posts objectAtIndex:indexPath.row];
    CGFloat height = [HomeCellView heightForDictionary:cellDictionary];
    return height;
}

@end
