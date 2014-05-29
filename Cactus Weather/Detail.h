//
//  Detail.h
//  Cactus Weather
//
//  Created by Admin on 23.05.14.
//  Copyright (c) 2014 x25. All rights reserved.
//

#import "ViewController.h"
#import "Days.h"
#import "Location.h"

@interface Detail : UIViewController
{
IBOutlet UILabel *SpeedWind;
IBOutlet UILabel *morn;
IBOutlet UILabel *day;
IBOutlet UILabel *eve;
IBOutlet UILabel *night;
IBOutlet UILabel *pressure;
    
    NSData *curImage;
    NSString *pressureStr;
    NSString *nightStr;
    NSString *eveStr;
    NSString *mornStr;
    NSString *dayStr;
    NSString *cityStr;

}

   

@property (strong, nonatomic) IBOutlet UILabel *myCity;

@property (strong, nonatomic) IBOutlet UIImageView *daysImg;
@property (strong, nonatomic) IBOutlet UILabel *SpeedWind;
@property (strong, nonatomic) NSString *strWind;
@property (strong, nonatomic) NSString *mornStr;
@property (strong, nonatomic) NSString *dayStr;
@property (strong, nonatomic) NSString *eveStr;
@property (strong, nonatomic) NSString *nightStr;
@property (strong, nonatomic) NSString *pressureStr;
@property (strong, nonatomic) IBOutlet UILabel *morn;
@property (strong, nonatomic) IBOutlet UILabel *day;
@property (strong, nonatomic) IBOutlet UILabel *eve;
@property (strong, nonatomic) IBOutlet UILabel *night;
@property (strong, nonatomic) IBOutlet UILabel *pressure;
@property (strong, nonatomic) NSData *curImage;
@property (strong, nonatomic) NSString *cityStr;

@end
