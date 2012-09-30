//
//  MasterViewController.m
//  socioville
//
//  Created by Valentin Filip on 4/2/12.
//  Copyright (c) 2012 App Design Vault. All rights reserved.
//

#import "MasterViewController.h"
#import "ZUUIRevealController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"

#import "UIImageView+Network.h"
#import "PompManagerDelegate.h"
#import "PompManager.h"
#import "PompCommunicator.h"
#import "VideoBuilder.h"
#import "Video.h"

@interface MasterViewController ()<PompManagerDelegate>
@property (retain, nonatomic) UIPanGestureRecognizer *navigationBarPanGestureRecognizer;
@property (copy, nonatomic) NSArray *videos;
@property (strong) PompManager *manager;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize navigationBarPanGestureRecognizer;

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _manager = [[PompManager alloc] init];
    self.manager.communicator = [[PompCommunicator alloc] init];
    self.manager.communicator.delegate = _manager;
    self.manager.videoBuilder = [[VideoBuilder alloc] init];
    self.manager.delegate = self;
    
    [self.manager fetchFeedFromYoutube];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[[AppDelegate instance].colorSwitcher getImageWithName:@"background.png"]];

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewDidUnload {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	self.title = NSLocalizedString(@"Cards View", @"Cards View");
	
    UINavigationController *nav = self.navigationController;
    UIViewController *controller = nav.parentViewController; // MainViewController : ZUUIRevealController
    if ([controller respondsToSelector:@selector(revealGesture:)] && [controller respondsToSelector:@selector(revealToggle:)])
	{
		// Check if a UIPanGestureRecognizer already sits atop our NavigationBar.
		if (![[self.navigationController.navigationBar gestureRecognizers] containsObject:self.navigationBarPanGestureRecognizer])
		{
			// If not, allocate one and add it.
			UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:controller action:@selector(revealGesture:)];
			self.navigationBarPanGestureRecognizer = panGestureRecognizer;
			
			[self.navigationController.navigationBar addGestureRecognizer:self.navigationBarPanGestureRecognizer];
		}
		
		// Check if we have a revealButton already.
		if (![self.navigationItem leftBarButtonItem]) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuControllerSelectedOption:) name:@"MenuSelectedOption" object:nil];
			// If not, allocate one and add it.
			UIImage *imageMenu = [[AppDelegate instance].colorSwitcher getImageWithName:@"button-menu.png"];
            UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [menuButton setImage:imageMenu forState:UIControlStateNormal];
            menuButton.frame = CGRectMake(0.0, 0.0, imageMenu.size.width, imageMenu.size.height);
            [menuButton addTarget:controller action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
            
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
		}
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
}

#pragma mark - Actions

- (void)menuControllerSelectedOption:(NSDictionary *)args {
    NSLog(@"selected option: %@", args);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.videos count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 201;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CardCell"];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        Video *video = [self.videos objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        [[segue destinationViewController] setDetailItem:video.title];
        [[segue destinationViewController] setVideo:video];
    }
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
   Video *video = [self.videos objectAtIndex:indexPath.row];
    
    UIImageView *avatar = (UIImageView *)[cell.contentView viewWithTag:1];
    [avatar loadImageWithUrl:video.avatarUrl];
    
    UILabel *title = (UILabel *)[cell.contentView viewWithTag:2];
    title.text = video.title;
}

#pragma mark - PompManagerDelegate

- (void)didReceiveVideo:(NSArray *)videos
{
    self.videos = [videos copy];
    
    [self.tableView reloadData];
}

- (void)fetchVideoFromYoutubeFailedWithError:(NSError *)error
{
    
}

@end
