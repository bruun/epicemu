//
//  PauseMenuViewController.m
//  epicemu
//
//  Created by Thomas Bruun on 4/7/11.
//  Copyright 2011 Private. All rights reserved.
//

#import "PauseMenuViewController.h"


@implementation PauseMenuViewController

@synthesize resumeButton, retryButton, mainMenuButton;


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

    // Set opacity so that the level is still visible in the background
    self.view.backgroundColor = [UIColor clearColor];

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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)resumeGame:(id)sender {
    // Remove the view and continue gameplay

    [self.view removeFromSuperview];

}

- (IBAction)retryLevel:(id)sender {
}

- (IBAction)gotoMainMenu:(id)sender {
}
@end
