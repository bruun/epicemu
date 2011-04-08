//
//  epicemuViewController.m
//  epicemu
//
//  Created by Thomas Bruun on 3/23/11.
//  Copyright 2011 Private. All rights reserved.
//

#import "RootViewController.h"
#import "MainMenuViewController.h"
#import "GameViewController.h"


// The following switch autoloads GameViewController directly
#define kTestingGameView    NO

@implementation RootViewController
@synthesize currentController;

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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (kTestingGameView)
        self.currentController = [[GameViewController alloc] init];
    else
        self.currentController = [[MainMenuViewController alloc] init];
    
    self.view = self.currentController.view;
    [self.currentController setParentViewController:self]; // Ugly hack, but made it work!
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self.currentController release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    NSLog(@"Autorotate");
    return [self.currentController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

- (void) switchToGameViewWithLevel:(int)level
{
    self.wantsFullScreenLayout = true;
    
    NSLog(@"Switching to game view!");
    [self.currentController release];
    self.currentController = [[GameViewController alloc] initLevel:level];

    [self.view addSubview:self.currentController.view];
    
}
@end