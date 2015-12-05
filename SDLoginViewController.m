//
//  SDLoginViewController.m
//  Safe Drive
//
//  Created by Kostya on 28.11.15.
//  Copyright © 2015 Stolyarenko K.S. All rights reserved.
//

#import "SDLoginViewController.h"

@interface SDLoginViewController ()

@end

@implementation SDLoginViewController

-(IBAction)login:(id)sender
{
    NSString *userPassword = self.LoginTextField.text;
    
    NSString *useConstantLogin =[[NSUserDefaults standardUserDefaults] valueForKey:@"userPass"];
    if(useConstantLogin !=nil)
    {
        if ([userPassword isEqualToString:useConstantLogin])
        {
            
            [self performSegueWithIdentifier:@"login" sender:sender];
            NSLog(@"okay");
        }
        else
        {
            UIAlertController *alertController =
            [UIAlertController alertControllerWithTitle:@"Incorrect Login"
                                                message:@"Your password was entered incorrectly."
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Okay"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                                     NSLog(@"User pressed Cancel");
                                                                 }];
            
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:^{
                NSLog(@"false");}];
        }
    }
    else{    [[NSUserDefaults standardUserDefaults] setValue:userPassword forKey:@"userPass"];
    }
    
}


@end
