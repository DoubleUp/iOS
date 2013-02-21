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

@interface FirstViewController ()

@property (nonatomic, strong) UITableView* homeTableView;
@property (nonatomic, strong) UIManagedDocument *seedDatabase;

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
    
    [self initSeedDatabase];
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

- (void)setFetchedResultsController:(NSFetchedResultsController *)fetchedResultsController
{
    NSFetchedResultsController *oldFetchedResultsController = _fetchedResultsController;
    if(fetchedResultsController != oldFetchedResultsController)
    {
        _fetchedResultsController = fetchedResultsController;
        _fetchedResultsController.delegate = self;
        
        if(_fetchedResultsController)
        {
            NSError* error;
            [_fetchedResultsController performFetch:&error];
        }
        [self.homeTableView reloadData];
    }
}

- (UIManagedDocument*)seedDatabase
{
    if(_seedDatabase == nil)
    {
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:@"SeedDatabase"];
        _seedDatabase = [[UIManagedDocument alloc] initWithFileURL:url];
    }
    return _seedDatabase;
}

- (void)initSeedDatabase
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.seedDatabase.fileURL path]])
    {
        //it doesn't exist, create and save it
        [self.seedDatabase saveToURL:self.seedDatabase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            
            [self.seedDatabase.managedObjectContext performBlock:^{
                [self initDBContents];
            }];
            
        }];
    }
    else if(self.seedDatabase.documentState == UIDocumentStateClosed)
    {
        //exists, just open it
        [self.seedDatabase openWithCompletionHandler:^(BOOL success) {
            
            [self getAllTrickPosts];
        }];
    }
}

- (void)getAllTrickPosts
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TrickPost"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"timeStamp" ascending:NO]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                            managedObjectContext:self.seedDatabase.managedObjectContext
                                                                              sectionNameKeyPath:nil cacheName:nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
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
	
    cellView.cellTrickPost = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [HomeCellView cellHeightForTrickPost:[self.fetchedResultsController objectAtIndexPath:indexPath]];
}



- (void)initDBContents
{
    //just hard code the stuff in that I want to start with for now
    //change it to install the database that this saves, copy it to docs dir if there's no db there
    
    //images
    Image *img1 = [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    img1.imageFile = @"trickPhoto.png";
    
    Image *img2 = [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    img2.imageFile = @"Avatar-Home-3.png";
    
    Image *img3 = [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    img3.imageFile = @"Avatar-Home.png";
    
    Image *img4 = [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    img4.imageFile = @"Avatar-Home-2.png";
    
    //locations
    Location *loc1 = [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    loc1.name = @"ROCKPORT STATE PARK";
    
    Location *loc2 = [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    loc2.name = @"LAKE POWELL";
    
    //sports
    Sport *sport1 = [NSEntityDescription insertNewObjectForEntityForName:@"Sport" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    sport1.name = @"Wakeboarding";
    
    //trick types
    TrickType *trickType1 = [NSEntityDescription insertNewObjectForEntityForName:@"TrickType" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    trickType1.name = @"BS 540";
    trickType1.doubleUp = [NSNumber numberWithBool:YES];
    
    TrickType *trickType2 = [NSEntityDescription insertNewObjectForEntityForName:@"TrickType" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    trickType2.name = @"Switch Tantrum to blind";
    trickType2.doubleUp = [NSNumber numberWithBool:YES];
    
    //user profiles
    UserProfile *profile1 = [NSEntityDescription insertNewObjectForEntityForName:@"UserProfile" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    profile1.name = @"Colton Brockbank";
    profile1.nickName = @"cbrock";
    profile1.avatar = img2;
    
    UserProfile *profile2 = [NSEntityDescription insertNewObjectForEntityForName:@"UserProfile" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    profile2.name = @"Jake Lowder";
    profile2.nickName = @"cublowder";
    profile2.avatar = img3;
    
    UserProfile *profile3 = [NSEntityDescription insertNewObjectForEntityForName:@"UserProfile" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    profile3.name = @"Blake Simkins";
    profile3.nickName = @"bsimkins";
    
    UserProfile *profile4 = [NSEntityDescription insertNewObjectForEntityForName:@"UserProfile" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    profile4.name = @"Cole Wadsworth";
    profile4.nickName = @"cole wads";
    profile4.avatar = img4;
    
    UserProfile *profile5 = [NSEntityDescription insertNewObjectForEntityForName:@"UserProfile" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    profile5.name = @"Chad Zeluff";
    profile5.nickName = @"czeluff";
    
    UserProfile *profile6 = [NSEntityDescription insertNewObjectForEntityForName:@"UserProfile" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    profile6.name = @"A Wally";
    profile6.nickName = @"Awally";
    
    //trick posts
    TrickPost *post3 = [NSEntityDescription insertNewObjectForEntityForName:@"TrickPost" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    post3.timeStamp = [NSDate date];
    post3.whoDidTrick = profile4;
    post3.whichLocation = loc2;
    post3.trickType = trickType2;
    [post3 addWhoVouchedTrickObject:profile3];
    
    TrickPost *post2 = [NSEntityDescription insertNewObjectForEntityForName:@"TrickPost" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    post2.timeStamp = [NSDate date];
    post2.whoDidTrick = profile2;
    post2.whichLocation = loc2;
    post2.trickType = trickType2;
    [post2 addWhoVouchedTrickObject:profile4];
    [post2 addWhoVouchedTrickObject:profile5];
    
    TrickPost *post1 = [NSEntityDescription insertNewObjectForEntityForName:@"TrickPost" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    post1.timeStamp = [NSDate date];
    post1.whoDidTrick = profile1;
    post1.whichLocation = loc1;
    post1.trickImage = img1;
    post1.trickType = trickType1;
    [post1 addWhoVouchedTrickObject:profile3];
    [post1 addWhoVouchedTrickObject:profile2];
    [post1 addWhoVouchedTrickObject:profile5];
    
    
    
    //comments
    Comment *comment1 = [NSEntityDescription insertNewObjectForEntityForName:@"Comment" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    comment1.commenter = profile3;
    comment1.text = @"dude you are my hero.";
    comment1.trickPost = post1;
    
    Comment *comment2 = [NSEntityDescription insertNewObjectForEntityForName:@"Comment" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    comment2.commenter = profile6;
    comment2.text = @"Jake you are the sickest cat I know.";
    comment2.trickPost = post2;
    
    Comment *comment3 = [NSEntityDescription insertNewObjectForEntityForName:@"Comment" inManagedObjectContext:self.seedDatabase.managedObjectContext];
    comment3.commenter = profile5;
    comment3.text = @"so buttery";
    comment3.trickPost = post3;
    
    
    //save the database
    [self.seedDatabase saveToURL:self.seedDatabase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
        
        NSLog(@"saved database\n");
        [self getAllTrickPosts];
    }];

}

@end
