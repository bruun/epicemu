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
    NSLog(@"Hai!");
    
    self.currentController = [[MainMenuViewController alloc] initWithRoot:self];
    self.view = self.currentController.view;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    
    NSLog(@"Switching!");
    [self.currentController release];
    self.currentController = [[GameViewController alloc] init];

    [self.view addSubview:self.currentController.view];
    
    
}

@end
