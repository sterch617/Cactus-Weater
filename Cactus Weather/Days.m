//
//  Days.m
//  Cactus Weather
//
//  Created by Admin on 22.05.14.
//  Copyright (c) 2014 x25. All rights reserved.
//

#import "Days.h"

@interface Days ()

@end

@implementation Days
@synthesize searchResult, dict, data, strDate,location;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    NSString *searchUrl = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily%@&mode=json&units=metric&cnt=14",searchResult];
    
    NSLog(@"%@",searchUrl);
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    
    NSURL *url = [NSURL URLWithString:searchUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *conection =[[NSURLConnection alloc]initWithRequest:request delegate:self];
    if (conection) {
        data=[NSMutableData data];
        
        
        
    }
    else {
        NSLog(@"Connection Feiled");
    }
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    data = [[NSMutableData alloc]init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)thedata
{
    [data appendData:thedata];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
    
    
    dict = [NSJSONSerialization JSONObjectWithData:data options:1 error:nil];
      NSLog(@"%@",dict);
    
  
    
    [self.tableView reloadData];
    
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
    UIAlertView *errorView = [[UIAlertView alloc]initWithTitle:@"error!!!!" message:@"Shit happens :(, check Wi-Fi or 3g" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [errorView show];
    
    NSLog(@"Fail");
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr =[dict objectForKey:@"list"]; //берем вложенный в в словарь массив и считаем его значения
    return arr.count;
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellDays" forIndexPath:indexPath];
   
    cell.textLabel.text = [[[[[dict objectForKey:@"list"]
                              objectAtIndex:indexPath.row]
                             objectForKey:@"weather"]
                            objectAtIndex:0]
                           objectForKey:@"description"];
   
   
    
    NSString *date = [[[dict objectForKey:@"list"]
                       objectAtIndex:indexPath.row]
                      objectForKey:@"dt"];
    long int unixDate = [date integerValue];
    
    NSDate *currDate = [NSDate dateWithTimeIntervalSince1970:unixDate];
    NSDateFormatter *gtmDate = [[NSDateFormatter alloc]init];
    [gtmDate setDateFormat:@"dd.MM.YYYY"];
    NSString *finalDate = [gtmDate stringFromDate:currDate];
  
    cell.detailTextLabel.text = finalDate;
    
    NSString *urlForImade =[NSString stringWithFormat:
                            @"http://openweathermap.org/img/w/%@.png",
                            [[[[[dict objectForKey:@"list"]
                                objectAtIndex:indexPath.row]objectForKey:@"weather"]
                              objectAtIndex:0]
                             objectForKey:@"icon"]];
    
    NSURL *imgUrl = [NSURL URLWithString:urlForImade];
    NSData *imgData = [NSData dataWithContentsOfURL:imgUrl];
    UIImage *img = [[UIImage alloc] initWithData:imgData];

    cell.imageView.image =img;
    
    return cell;
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Detail *detailVC = [segue destinationViewController];
    
    UITableViewCell *cell = (UITableViewCell*)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    
    detailVC.strWind = [[[dict objectForKey:@"list"]
                         objectAtIndex:indexPath.row]
                        objectForKey:@"speed"];
    
    
    detailVC.mornStr = [[[[dict objectForKey:@"list"]
                           objectAtIndex:indexPath.row]
                          objectForKey:@"temp"]objectForKey:@"morn"];
    
    detailVC.dayStr = [[[[dict objectForKey:@"list"]
                          objectAtIndex:indexPath.row]
                         objectForKey:@"temp"]objectForKey:@"day"];

    detailVC.eveStr = [[[[dict objectForKey:@"list"]
                         objectAtIndex:indexPath.row]
                        objectForKey:@"temp"]objectForKey:@"eve"];
    
    detailVC.nightStr = [[[[dict objectForKey:@"list"]
                         objectAtIndex:indexPath.row]
                        objectForKey:@"temp"]objectForKey:@"night"];
    
    detailVC.pressureStr = [[[dict objectForKey:@"list"]
                           objectAtIndex:indexPath.row]
                          objectForKey:@"pressure"];
    
    detailVC.cityStr = [NSString stringWithFormat:@"%@,%@",[[dict objectForKey:@"city"]
                                                            objectForKey:@"name"],
                                                        [[dict objectForKey:@"city"]
                                                         objectForKey:@"country"]];

    

    NSString *urlForImade =[NSString stringWithFormat:
                            @"http://openweathermap.org/img/w/%@.png",
                            [[[[[self.dict objectForKey:@"list"]
                                objectAtIndex:indexPath.row]objectForKey:@"weather"]
                              objectAtIndex:0]
                             objectForKey:@"icon"]];
    
    
    
    NSURL *imgUrl = [NSURL URLWithString:urlForImade];
    NSData *imgData = [NSData dataWithContentsOfURL:imgUrl];
    
    
    detailVC.curImage =imgData;

    
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/




@end
