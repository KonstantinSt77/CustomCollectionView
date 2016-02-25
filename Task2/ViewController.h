//
//  ViewController.h
//  task2
//
//  Created by Kostya on 28.11.15.
//  Copyright © 2015 Stolyarenko K.S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UITextField *userAccountLogin;
@property (weak, nonatomic) IBOutlet UICollectionView *userPassView;
@end

