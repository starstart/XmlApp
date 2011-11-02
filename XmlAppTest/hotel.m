//
//  hotel.m
//  XML
//
//  Created by morgan chang on 2011/10/11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "hotel.h"

@implementation hotel

@synthesize CAT1, CAT2;
@synthesize MEMO_TEL, MEMO_FAX, MEMO_COST;
@synthesize address, stitle,idpt;
@synthesize latitude,longitude,xurl,xbody;
@synthesize avBegin, avEnd, POI, langinfo,xpostDate,REF_WP,RowNumber;
@synthesize SERIAL_NO,file;

- (id) initWithArray
{
  [super init];
  file = [[NSMutableArray alloc] init];
  return self;
}

- (void) dealloc
{
  [CAT1 release];
  [CAT2 release];
  [MEMO_TEL release];
  [MEMO_FAX release];
  [MEMO_COST release];
  [address release];
  [stitle release];
  [idpt release];
  [latitude release];
  [longitude release];
  [xurl release];
  [xbody release];
  [RowNumber release];
  [REF_WP release];
  [SERIAL_NO release];
  [avEnd release];
  [avBegin release];
  [xpostDate release];
  [langinfo release];
  [POI release];
  [file release];
  [xbody release];
  [super dealloc];
}

@end
