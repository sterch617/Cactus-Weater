//
//  ViewController.h
//  Cactus Weather
//
//  Created by Admin on 13.05.14.
//  Copyright (c) 2014 x25. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeaterTable.h"
#import "Detail.h"
@interface ViewController : UIViewController
{
  
    IBOutlet UITextField *myText;
}



@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (strong, nonatomic) IBOutlet UITextField *myText;



+(NSString*)newSearch;

@end
