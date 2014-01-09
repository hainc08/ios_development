//
//  NSObject+CoolioBlock.h
//  Coolio
//
//  Created by hoehoe on 2013/07/13.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+CoolioData.h"

@interface NSObject (CoolioBlock)

-(void)doBlock:(NSString *)myId blockId:(NSString *)blockId;
-(void)sendBlock:(NSString *)myId blockId:(NSString *)blockId;
-(void)sendBlockOff:(NSString *)myId blockId:(NSString *)blockId;
-(void)getBlockList:(NSString *)myId;

@end
