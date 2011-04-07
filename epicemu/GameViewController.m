//
//  GameViewController.m
//  epicemu
//
//  Created by Håkon Erichsen on 3/23/11.
//  Copyright 2011 Private. All rights reserved.
//

#import "GameViewController.h"

@implementation GameViewController

@synthesize level, levelView;
@synthesize player, playerView, root;

/**
 * For encapsulation purposes, use -init instead.
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSAssert(NO, @"Initialize with -init");
    return nil;
}

- (id)init {
    self = [super initWithNibName:@"GameView" bundle:nil];
    if (self) {
        // Maek fix level
        levelView = [[LevelView alloc] initWithFrame:self.view.bounds];
        level = [[Level alloc] initWithLevelView:self.levelView];
        [self.view addSubview:levelView];
        
        // Make a player
        player = [[Player alloc] initWithPlayerView:playerView];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Schedule a timer
    timer = [NSTimer scheduledTimerWithTimeInterval:1 / 50.0
                                             target:self
                                           selector:@selector(tick:) 
                                           userInfo:nil
                                            repeats:YES];
    UITapGestureRecognizer *jump = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jump:)];
    jump.numberOfTouchesRequired = 1;
    jump.delegate = self;
    [self.view addGestureRecognizer:jump];
}

- (void)jump:(UITapGestureRecognizer *)from {
    CGPoint touchedAt = [from locationOfTouch:0 inView:self.view];
    if (touchedAt.x > self.view.bounds.size.width / 2)
        [player jump];
    else
        [player attack];
}

/**
 * The clock said "TICK!"
 */
- (void)tick:(NSTimer *)sender {
    // First, update and move shit
    [level update:sender];
    [player move:sender];
    
    // Accumulate all vertical movement to determine whether - and how far - we were bumped
    double distance = 0.0;
    
    // Test points along 4th quadrant
    double radius = (playerView.bounds.size.width + playerView.bounds.size.height) / 4;
    float step = 1.0;
    for (double th = -M_PI; th <= -M_PI / 2; th += M_PI / 4) {
        CGPoint p = playerView.center;
        p.x += radius * cos(th);
        p.y -= radius * sin(th);
        
        // Bubble upwards
        while ([levelView.path containsPoint:p]) {
            p.y -= step;
            distance += step;
            playerView.center = CGPointMake(p.x - radius * cos(th), p.y + radius * sin(th));
        }
    }
    if (distance > 0.0)
        [player bumpDistance:distance withTimer:sender];
    else
        [player flew];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    NSLog(@"ROOOTTAAATE");
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
