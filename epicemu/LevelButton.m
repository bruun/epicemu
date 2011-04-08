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
        self.enabled = NO;
        
        if (value <= unlockedUpToLevel) {
            self.enabled = YES;
        }
        

        [self.titleLabel setFont:[UIFont fontWithName:@"Georgia" size:18]];
        [self setTitle:[NSString stringWithFormat:@"%d", value] forState:UIControlStateNormal];
        [self setTitle:[NSString stringWithFormat:@"%d", value] forState:UIControlStateDisabled];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [self setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor grayColor]];

        
        
    }
    
    return self;
}


@end
