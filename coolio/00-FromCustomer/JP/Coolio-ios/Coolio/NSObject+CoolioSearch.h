//
//  NSObject+CoolioSearch.h
//  Coolio
//
//  Created by hoehoe on 2013/07/04.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+CoolioData.h"

@interface NSObject (CoolioSearch)

-(R9HTTPRequest *)setRequestBodyToSearch:(R9HTTPRequest *)request;
-(void)getUsers;
-(void)getUsers:(NSString *)searchText;
-(void)getUsersNextPage:(int)index;
-(void)getUsersNew;
-(void)getUsersOnline;
//-(void)getUsersOne:(NSString *)nickName;

@end
