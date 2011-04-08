//
//  MainMenuViewController.m
//  epicemu
//
//  Created by Håkon Erichsen on 4/6/11.
//  Copyright 2011 Private. All rights reserved.
//

#import "MainMenuViewController.h"
#import "RootViewController.h"
#import "LevelButton.h"

#define kLevelCount 10
#define kLevelsPerRow 5

#define kLevelButtonWidth 60
#define kLevelButtonHeight 60

@implementation MainMenuViewController
@synthesize logo, playText, playButton, state;

- (id)init
{
    
    self = [super init];
    
    if (self) {
        self.state = kViewStateFrontMenu;


    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [logo release];
    [playButton release];
    [playText release];
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setLogo:nil];
    [self setPlayButton:nil];
    [self setPlayText:nil];
  
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || 
            interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}


#pragma mark Relevant methods #pragma -

- (IBAction)touchDown:(id)sender {
    NSLog(@"Pressed play!");
    [self hideViews];
    [self makeLevelButtons];
    //self.state = kViewStateLevelMenu;
}

- (void) hideViews
{
    [logo setHidden:true];
    [playText setHidden:true];
    [playButton setHidden:true];
}

- (void) makeLevelButtons
{
    CGFloat yStart = 60;
    CGFloat xStart = 60;
    CGFloat x = xStart;
    CGFloat y = yStart;
    
    for (int i = 1; i <= kLevelCount; i++) {
        
        // Make tha button, give it a position, and add it
        LevelButton *button = [[LevelButton alloc] initWithValue:i];
        [button addTarget:self action:@selector(loadLevel:) forControlEvents:UIControlEventTouchUpInside];
        [button setFrame:CGRectMake(x, y, kLevelButtonWidth, kLevelButtonHeight)];
        [self.view addSubview:button];
        
        x = x + kLevelButtonWidth + 15;
        
        // Move down a row if we're at world's end
        if (i % kLevelsPerRow == 0) {
            x = xStart;
            y = y + kLevelButtonHeight + 15;
        }
    }
}

- (IBAction) loadLevel:(id)sender
{
    NSLog(@"Starting level...");
    LevelButton *button = (LevelButton*)sender;
    [(RootViewController *)[self parentViewController] switchToGameViewWithLevel:button.level];


}

@end
