//
//  SDBrowserViewController.h
//  Safe Drive
//
//  Created by Kostya on 28.11.15.
//  Copyright © 2015 Stolyarenko K.S. All rights reserved.
//

#import <UIKit/UIKit.h>
@import SafariServices;
@interface SDBrowserViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *searchgoogle;



-(IBAction)advancegoogle;
-(IBAction)actionsearchgoogle;
-(IBAction)actionsearchyandex;
-(IBAction)actionsearchyoutube;


@end