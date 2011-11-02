//
//  XMLParser.m
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import "XMLParser.h"
#import "XmlAppTestAppDelegate.h"
#import "hotel.h"

@implementation XMLParser

@synthesize hotels;

- (XMLParser *) initXMLParser {
	
	[super init];
	
//  hotels = [[NSMutableArray alloc] init];
	appDelegate = (XmlAppTestAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	
	if([elementName isEqualToString:@"CommonFormat"]) {
		//Initialize the array.
		appDelegate.hotels = [[NSMutableArray alloc] init];
	}
	else if([elementName isEqualToString:@"Section"]) {
		//Initialize the book.
		aHotel = [[hotel alloc] initWithArray];
		
		//Extract the attribute here.
//		aHotel.bookID = [[attributeDict objectForKey:@"id"] integerValue];
//		NSLog(@"Reading id value :%i", aBook.bookID);
	}
//	NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string { 
	
	if(!currentElementValue) 
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else
		[currentElementValue appendString:string];
	
//	NSLog(@"Processing Value: %@", currentElementValue);
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"CommonFormat"])
		return;
	
	//There is nothing to do if we encounter the Books element here.
	//If we encounter the Book element howevere, we want to add the book object to the array
	// and release the object.
	if([elementName isEqualToString:@"Section"]) {
//		[hotels addObject:aHotel];
		[appDelegate.hotels addObject:aHotel];
		[aHotel release];
		aHotel = nil;
	}
	else {
   if ([elementName isEqualToString:@"img"])
       [aHotel.file addObject:currentElementValue];
   else
       [aHotel setValue:currentElementValue forKey:elementName];
	}
	[currentElementValue release];
	currentElementValue = nil;
}

- (void) dealloc {
	
//	[aHotel release];
//	[currentElementValue release];
    [hotels release];
	[super dealloc];
}

@end
