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

        
        if (value <= unlockedUpToLevel) {
            self.enabled = NO;
        }
        

        [self.titleLabel setFont:[UIFont fontWithName:@"Georgia" size:18]];
        [self setTitle:[NSString stringWithFormat:@"%d", value] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];

        
        
    }
    
    return self;
}


@end
