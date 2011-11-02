//
//  hotel.h
//  XML
//
//  Created by morgan chang on 2011/10/11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface hotel : NSObject {
  NSNumber *RowNumber;
  NSNumber *REF_WP;
  NSString *CAT1;
  NSString *CAT2;
  NSString *SERIAL_NO;
  NSString *MEMO_TEL;
  NSString *MEMO_FAX;
  NSString *MEMO_COST;
  NSString *stitle;
  NSDate  *avBegin;
  NSDate  *avEnd;
  NSString *idpt;
  NSString *xurl;
  NSString *address;
  NSDate  *xpostDate;
  NSString *langinfo;
  NSString *POI;
  NSString *longitude;
  NSString *latitude;
  NSMutableArray *file;
  NSString *xbody;
}

@property (nonatomic, retain) NSNumber *RowNumber;
@property (nonatomic, retain) NSNumber *REF_WP;
@property (nonatomic, retain) NSString *CAT1;
@property (nonatomic, retain) NSString *CAT2;
@property (nonatomic, retain) NSString *SERIAL_NO;
@property (nonatomic, retain) NSString *MEMO_TEL;
@property (nonatomic, retain) NSString *MEMO_FAX;
@property (nonatomic, retain) NSString *MEMO_COST;
@property (nonatomic, retain) NSString *stitle;
@property (nonatomic, retain) NSDate *avBegin;
@property (nonatomic, retain) NSDate *avEnd;
@property (nonatomic, retain) NSDate *xpostDate;
@property (nonatomic, retain) NSString *idpt;
@property (nonatomic, retain) NSString *xurl;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *langinfo;
@property (nonatomic, retain) NSString *POI;
@property (nonatomic, retain) NSString *longitude;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSMutableArray *file;
@property (nonatomic, retain) NSString *xbody;
- (id)initWithArray;
@end
