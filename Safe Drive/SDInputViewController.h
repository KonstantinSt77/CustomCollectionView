//
//  SDInputViewController.h
//  Safe Drive
//
//  Created by Kostya on 05.12.15.
//  Copyright © 2015 Stolyarenko K.S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDTableViewController.h"


@interface SDInputViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userLogin;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;

- (IBAction)save:(id)sender;
@end
