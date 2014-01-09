//
//  MyFootPrintSettings.h
//  Coolio
//
//  Created by hoehoe on 2013/05/06.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyFootPrintSettings : NSObject
{
    NSUserDefaults* _defaultObject;
}

@property(nonatomic, retain) NSUserDefaults* defaultObject;

-(void)setFootPrint:(BOOL)_footPrint;
-(BOOL)getFootPrint;

@end
