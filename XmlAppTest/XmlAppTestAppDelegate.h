//
//  XmlAppTestAppDelegate.h
//  XmlAppTest
//
//  Created by  on 2011/10/14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XmlAppTestViewController;

@interface XmlAppTestAppDelegate : NSObject <UIApplicationDelegate>{
    NSMutableArray *hotels;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet XmlAppTestViewController *viewController;
@property (nonatomic, retain) NSMutableArray *hotels;

@end
