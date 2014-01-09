//
//  MySession.h
//  Coolio
//
//  Created by hoehoe on 2013/05/27.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySession : NSObject
{
    NSUserDefaults* _defaultObject;
}

@property(nonatomic, retain) NSUserDefaults* defaultObject;

-(void)doLogOut:(BOOL)logout;
-(BOOL)getLoggedOutFlag;
@end
