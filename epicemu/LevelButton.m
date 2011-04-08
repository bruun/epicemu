//
//  LevelButton.m
//  epicemu
//
//  Created by Håkon Erichsen on 4/6/11.
//  Copyright 2011 Private. All rights reserved.
//

#import "LevelButton.h"


@implementation LevelButton
@synthesize level, locked, root;

-(id) initWithValue:(int) value andRoot:(RootViewController *)root
{
    self = [super init];
    int unlockedUpToLevel = [[NSUserDefaults standardUserDefaults] boolForKey:@"unlockedUpToLevel"];
    
    if (self) {
        self.level = value;
        self.locked = true;
        self.root = root;
        
        if (value <= unlockedUpToLevel) {
            self.locked = false;
        }
        
        [self setTextAlignment:UITextAlignmentCenter];
        [self setFont:[UIFont fontWithName:@"Georgia" size:18]];
        [self setText:[NSString stringWithFormat:@"%d", value]];
        [self setUserInteractionEnabled:true];
        
        if (!self.locked) {
            [self setBackgroundColor:[UIColor greenColor]];
        }
        else {
            [self setBackgroundColor:[UIColor lightGrayColor]];
        }
    }
    
    return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.locked) {
        [self.root switchToGameViewWithLevel:self.level];
    }
}

@end
