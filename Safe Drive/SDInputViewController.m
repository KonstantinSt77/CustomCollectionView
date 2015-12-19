//
//  SDInputViewController.m
//  Safe Drive
//
//  Created by Kostya on 05.12.15.
//  Copyright © 2015 Stolyarenko K.S. All rights reserved.
//

#import "SDInputViewController.h"

@interface SDInputViewController ()

@end

@implementation SDInputViewController



- (IBAction)save:(id)sender
{
    
    //(IBAction)test:(id)sender; как вызвать функцию 
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPickerView * picker = [UIPickerView new];
    picker.delegate = self;
    picker.dataSource = self;
    picker.showsSelectionIndicator = YES;
    [self.view addSubview:picker];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * title = nil;
    switch(row) {
        case 0:
            title = @"User Password";
            break;
        case 1:
            title = @"Mail.ru";
            break;
        case 2:
            title = @"Vkontakte.ru";
            break;
        case 3:
            title = @"FaceBook";
            break;
        case 4:
            title = @"Instagramm";
            break;
        case 5:
            title = @"Twitter";
            break;
        case 6:
            title = @"YouTube";
            break;
        case 7:
            title = @"Skype";
            break;
        case 8:
            title = @"Torrent";
            break;
        case 9:
            title = @"Yandex";
            break;
        case 10:
            title = @"Payment";
            break;
            
    }
    return title;
}

@end
