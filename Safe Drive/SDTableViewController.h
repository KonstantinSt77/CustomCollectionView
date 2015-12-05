//
//  SDTableViewController.h
//  Safe Drive
//
//  Created by Kostya on 05.12.15.
//  Copyright © 2015 Stolyarenko K.S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITableView *userPassTabel;
@property (strong, nonatomic) NSMutableArray *userPassArray;

@property (weak, nonatomic) IBOutlet UITextField *userAccountLogin;
-(IBAction)test:(id)sender;



@end
