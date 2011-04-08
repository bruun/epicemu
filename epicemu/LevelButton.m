//
//  LevelButton.m
//  epicemu
//
//  Created by Håkon Erichsen on 4/6/11.
//  Copyright 2011 Private. All rights reserved.
//

#import "LevelButton.h"


@implementation LevelButton
@synthesize level, locked;

-(id) initWithValue:(int) value
{
    self = [super init];
    int unlockedUpToLevel = [[NSUserDefaults standardUserDefaults] boolForKey:@"unlockedUpToLevel"];
    
    if (self) {
        self.level = value;
        self.enabled = unlockedUpToLevel >= value;
        
        [self.titleLabel setFont:[UIFont fontWithName:@"Georgia" size:18]];
        [self setTitle:[NSString stringWithFormat:@"%d", value] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        
        [self setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [self setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor grayColor]];
    }
    
    return self;
}


@end
