//
//  WeaterTable.h
//  Cactus Weather
//
//  Created by Admin on 13.05.14.
//  Copyright (c) 2014 x25. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Days.h"
#import "Detail.h"
@interface WeaterTable : UITableViewController
{
    NSMutableData *data;
    NSDictionary *dict;
}

@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong)NSMutableData *data;
@end


