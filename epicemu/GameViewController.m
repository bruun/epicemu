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
        level = [[Level alloc] initWithHeight:levelView.bounds.size.height];
        timer = [NSTimer scheduledTimerWithTimeInterval:5 
                                                 target:level
                                               selector:@selector(update:) 
                                               userInfo:nil
                                                repeats:YES];
        NSLog(@"Weeee!");
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
    // Do any additional setup after loading the view from its nib.
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
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
