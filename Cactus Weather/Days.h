//
//  Days.h
//  Cactus Weather
//
//  Created by Admin on 22.05.14.
//  Copyright (c) 2014 x25. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "WeaterTable.h"
#import "Detail.h"
@interface Days : UITableViewController
{
    NSString *searchResult;
    NSMutableData *data;
    NSDictionary *dict;
    NSString *strDate;
    NSString *location;
}
@property NSString *searchResult;
@property NSMutableData *data;
@property NSDictionary *dict;
@property NSString *strDate;
@property NSString *location;



@end
