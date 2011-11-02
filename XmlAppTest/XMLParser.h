//
//  XMLParser.h
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import <UIKit/UIKit.h>

@class XmlAppTestAppDelegate, hotel;

@interface XMLParser : NSObject <NSXMLParserDelegate>{
	XmlAppTestAppDelegate *appDelegate;
	hotel *aHotel;
    NSMutableString *currentElementValue;
	NSMutableArray *hotels;
}

@property (nonatomic, assign,readwrite) NSMutableArray *hotels;
- (XMLParser *) initXMLParser;
@end
