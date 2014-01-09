//
//  MyPublish.m
//  Coolio
//
//  Created by hoehoe on 2013/04/23.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MyPublish.h"

@implementation MyPublish

-(id)init{
    if(self == nil){
        self = [[MyPublish alloc] init];
    }
    
    if(self.defaultObject == nil){
        self.defaultObject = [NSUserDefaults standardUserDefaults];
    }
    
    return self;
}

-(void) setEnabled:(BOOL)enabled
{
    [self.defaultObject setBool:enabled forKey:@"enabledPublish"];
    [self.defaultObject synchronize];
}

-(BOOL) getEnabled{ return [self.defaultObject boolForKey:@"enabledPublish"]; }

- (void) setAgeUpper:(int)age
{
    [self.defaultObject setInteger:age forKey:@"ageUpperPublish"];
    [self.defaultObject synchronize];
}
- (int) getAgeUpper{
    return [self.defaultObject integerForKey:@"ageUpperPublish"];
}

- (void) setAgeLower:(int)age{
    [self.defaultObject setInteger:age forKey:@"ageLowerPublish"];
    [self.defaultObject synchronize];
}
- (int) getAgeLower
{
    return [self.defaultObject integerForKey:@"ageLowerPublish"];
}

- (void) setSexualllity:(NSDictionary *)sexuallity{
    [self.defaultObject setValue:sexuallity forKey:@"sexuallityPublish"];
    [self.defaultObject synchronize];
}
- (NSDictionary *) getSexuallity{
    return [self.defaultObject valueForKey:@"sexuallityPublish"];
}

- (void) setRace:(NSDictionary *)race{
    [self.defaultObject setValue:race forKey:@"racePublish"];
    [self.defaultObject synchronize];
}
- (NSDictionary *) getRace{
    return [self.defaultObject valueForKey:@"racePublish"];
}

/*
- (void) setStyle:(NSDictionary *)style
{
    [self.defaultObject setValue:style forKey:@"stylePublish"];
    [self.defaultObject synchronize];

}
- (NSDictionary *) getStyle{ return [self.defaultObject valueForKey:@"stylePublish"]; }

- (void) setLookingFor:(NSDictionary *)lookingfor{
    [self.defaultObject setValue:lookingfor forKey:@"lookingforPublish"];
    [self.defaultObject synchronize];
}
- (NSDictionary *) getLookingFor{
    return [self.defaultObject valueForKey:@"lookingforPublish"];
}
*/

@end
