//
//  TDMarco.h
//  ITell
//
//  Created by tranduc on 6/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef ITell_ITMarco_h
#define ITell_ITMarco_h

#define ITDISABLE_LOG 0
#define ITDISABLE_INFO 1
#define ITENABLE_ALL 2

#define IT_DEBUG ITENABLE_ALL

/*
 * if IT_DEBUG is not defined, or if it is 0 then
 *	all ITLOGXXX macros will be disabled
 *
 * if IT_DEBUG ==1 then:
 *		ITLOG() will be enabled
 *		ITLOGERROR() will be enabled
 *		ITLOGINFO()	will be disabled
 *
 * if IT_DEBUG==2 or higher then:
 *		ITLOG() will be enabled
 *		ITLOGERROR() will be enabled
 *		ITLOGINFO()	will be enabled 
 */

#if !defined(IT_DEBUG) || IT_DEBUG == 0
#define ITLOG(...) do {}while (0)
#define ITLOGERROR(...)  do {} while (0)
#define ITLOGINFO(...) do {}while (0)

#elif IT_DEBUG == 1
#define ITLOG(...) NSLog(__VA_ARGS__)
#define ITLOGERROR(...) NSLog(__VA_ARGS__)
#define ITLOGINFO(...) do {}while (0)

#elif IT_DEBUG > 1
#define ITLOG(...) NSLog(__VA_ARGS__)
#define ITLOGERROR(...) NSLog(__VA_ARGS__)
#define ITLOGINFO(...) NSLog(__VA_ARGS__)
#endif // TD_DEBUG

/*
 * Show call function info
 */
#define ITINFO_FUNC ITLOGINFO(@"===========================================");\
ITLOGINFO(@"%@: %@", NSStringFromSelector(_cmd), self);
#endif
