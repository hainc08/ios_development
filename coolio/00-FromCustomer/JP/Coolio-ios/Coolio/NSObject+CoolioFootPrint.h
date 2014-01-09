//
//  NSObject+CoolioFootPrint.h
//  Coolio
//
//  Created by hoehoe on 2013/07/13.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+CoolioData.h"

@interface NSObject (CoolioFootPrint)

-(void)sendFootPrint:(NSString *)myId footPrintId:(NSString *)footPrintId;
-(void)getMyFootPrint:(NSString *)myId;

@end
