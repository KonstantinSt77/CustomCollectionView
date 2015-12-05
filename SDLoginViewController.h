//
//  SDLoginViewController.h
//  Safe Drive
//
//  Created by Kostya on 28.11.15.
//  Copyright © 2015 Stolyarenko K.S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDLoginViewController : UIViewController

@property (strong,nonatomic) IBOutlet UITextField *LoginTextField;

-(IBAction)login:(id)sender;
@end
