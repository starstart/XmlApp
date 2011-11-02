//
//  mainTableViewController.h
//  XmlAppTest
//
//  Created by  on 2011/10/14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XmlAppTestAppDelegate;

@interface mainTableViewController : UITableViewController  <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>{
    XmlAppTestAppDelegate *appDelegate;
	NSMutableArray *dataSource; //will be storing all the data
	NSMutableArray *tableData;//will be storing data that will be displayed in table
	NSMutableArray *searchedData;//will be storing data matching with the search string
	IBOutlet UISearchBar *sBar;//search bar
}

@property (nonatomic, retain) NSMutableArray *dataSource;

@end
