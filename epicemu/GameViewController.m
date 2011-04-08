//
//  GameViewController.m
//  epicemu
//
//  Created by Håkon Erichsen on 3/23/11.
//  Copyright 2011 Private. All rights reserved.
//

#import "GameViewController.h"

#define kFPS    25

@implementation GameViewController
@synthesize unlockLabel;

@synthesize level, levelView, player, playerView, pauseMenu, scoreLabel;

/**
 * For encapsulation purposes, use -init instead.
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSAssert(NO, @"Initialize with -init");
    return nil;
}

- (id)initLevel:(int) levelNumber {
    self = [super initWithNibName:@"GameView" bundle:nil];
    
    if (self) {
        // Maek fix level
        levelView = [[LevelView alloc] initWithFrame:self.view.bounds];
        level = [[Level alloc] initLevel:levelNumber withLevelView:self.levelView];
        [self.view addSubview:levelView];
        
        // Make a player
        player = [[Player alloc] initWithPlayerView:playerView];
        [self.view addSubview:scoreLabel];
        
        pauseMenu = [[PauseMenuViewController alloc] init];
    }

    return self;
}

- (void)dealloc
{
    [scoreLabel release];
    [unlockLabel release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (NSTimeInterval)currentTime {
    return [[NSDate date] timeIntervalSince1970];
}

- (void)gameLoop {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSTimeInterval time, lastTime = [self currentTime];
    NSTimeInterval timeInterval;
    
    int fps = 25;
    
    while (_running) {
        while (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.002, YES) == kCFRunLoopRunHandledSource);
        
        // Calculate how long we need to wait for
        time = [self currentTime];
        timeInterval = time - lastTime;
        
        if (timeInterval < 1.0 / fps) {
            [NSThread sleepForTimeInterval:(1.0 / fps - timeInterval)];
        }
        else {
            // UIBezierPath is not meant for real-time drawing, that's for sure.
            NSLog(@"Oh, no, we're running behind!");
        }
        
        // Perform tick
        [self tick:timeInterval];
        
        lastTime = time;
    }
    
    [pool release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Let the user tap for jumping and attacking
    UITapGestureRecognizer *action = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action:)];
    action.numberOfTouchesRequired = 1;
    action.delegate = self;
    [self.view addGestureRecognizer:action];
    
    UITapGestureRecognizer *pause = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pauseGame:)];
    pause.numberOfTouchesRequired = 2;
    pause.delegate = self;
    [self.view addGestureRecognizer:pause];
    
    // Start the run loop
    _running = YES;
    [NSThread detachNewThreadSelector:@selector(gameLoop) toTarget:self withObject:nil];
}

- (void)action:(UITapGestureRecognizer *)from {

    CGPoint touchedAt = [from locationOfTouch:0 inView:self.view];
    if (touchedAt.x > self.view.bounds.size.width / 2)
        [player jump];
    else
        [player attack];
}


- (void)pauseGame:(UITapGestureRecognizer *)taps {
    NSLog(@"Registered doubletap event");
    _running = NO;
    [self.view addSubview:pauseMenu.view];
}

/**
 * The clock said "TICK!"
 */
- (void)tick:(NSTimeInterval)timeInterval {
    // First, update and move shit
    [level update:timeInterval];
    [player move:timeInterval];
    
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
        [player bumpDistance:distance withTimeInterval:timeInterval];
    else
        [player flew];
    
    // Update score
    [scoreLabel performSelectorOnMainThread:@selector(setText : ) withObject:[NSString stringWithFormat:@"%d", player.score]waitUntilDone:YES];

    if (player.score > [[level.settings valueForKey:@"ScoreToBeat"] intValue] 
        && [[NSUserDefaults standardUserDefaults] integerForKey:@"unlockedUpToLevel"] != level.levelNumber+1) {
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:level.levelNumber+1]
                                                  forKey:@"unlockedUpToLevel"];
        [scoreLabel performSelectorOnMainThread:@selector(setHidden : ) withObject:false waitUntilDone:YES];
        NSLog(@"Just unlocked level %d", level.levelNumber+1);
        NSLog(@"Registered unlocked up to:%d", [[NSUserDefaults standardUserDefaults] integerForKey:@"unlockedUpToLevel"]);
    }
}

- (void)viewDidUnload
{
    [scoreLabel release];
    scoreLabel = nil;
    [self setUnlockLabel:nil];
    [pauseMenu release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
