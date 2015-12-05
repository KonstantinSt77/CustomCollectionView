//
//  SDBrowserViewController.m
//  Safe Drive
//
//  Created by Kostya on 28.11.15.
//  Copyright © 2015 Stolyarenko K.S. All rights reserved.
//

#import "SDBrowserViewController.h"


@interface SDBrowserViewController () <SFSafariViewControllerDelegate>

@end

@implementation SDBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *tapView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditing)];
    [self.view addGestureRecognizer:tapView];
    
}


- (void)endEditing {
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}


-(IBAction)actionsearchgoogle
{
    NSString *searchString1=self.searchgoogle.text;
    NSString *urlAddress1 = [NSString stringWithFormat:@"http://www.google.com/search?q=%@",searchString1];
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlAddress1]];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:urlAddress1] entersReaderIfAvailable:YES];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:YES completion:nil];
    self.searchgoogle.text = nil;
    
}


-(IBAction)actionsearchyandex
{
    NSString *searchString2=self.searchgoogle.text;
    NSString *urlAddress2 = [NSString stringWithFormat:@"https://yandex.ua/search/?text=%@",searchString2];
    // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlAddress2]];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:urlAddress2] entersReaderIfAvailable:YES];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:YES completion:nil];
    self.searchgoogle.text = nil;
    
}
-(IBAction)actionsearchyoutube
{
    NSString *searchString3=self.searchgoogle.text;
    NSString *urlAddress3 = [NSString stringWithFormat:@"https://www.youtube.com/results?search_query=%@",searchString3];
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlAddress3]];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:urlAddress3] entersReaderIfAvailable:YES];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:YES completion:nil];
    self.searchgoogle.text = nil;
    
}
-(IBAction)advancegoogle
{
    NSString *urlAddress4 = [NSString stringWithFormat:@"https://www.google.ru/advanced_search"];
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlAddress3]];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:urlAddress4] entersReaderIfAvailable:YES];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:YES completion:nil];
    self.searchgoogle.text = nil;
}

-(IBAction)actionsearchwolfram
{
    NSString *searchString3=self.searchgoogle.text;
    NSString *urlAddress3 = [NSString stringWithFormat:@"https://www.wolframalpha.com/input/?i=%@",searchString3];
    
    SFSafariViewController *safariVC = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:urlAddress3] entersReaderIfAvailable:YES];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:YES completion:nil];
    self.searchgoogle.text = nil;
    
}


@end
