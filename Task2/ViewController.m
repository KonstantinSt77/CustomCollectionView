//
//  ViewController.m
//  task2
//
//  Created by Kostya on 28.11.15.
//  Copyright © 2015 Stolyarenko K.S. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) NSMutableArray *myArray;
@property (nonatomic) NSInteger numberOfItemsInCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionHeight;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _userAccountLogin.delegate = self;
    
    self.myArray = [NSMutableArray new];

    UIBarButtonItem *editButton         = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                           target:self
                                           action:@selector(editButton:)];
    UIBarButtonItem *createButton         = [[UIBarButtonItem alloc]
                                             initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                             target:self
                                             action:@selector(createButton:)];
    
    self.navigationItem.rightBarButtonItems =
    [NSArray arrayWithObjects:editButton,createButton,nil];
    
   [self.myCollectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
  
    self.numberOfItemsInCollectionView = [self.myArray count];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)editButton:(id)sender
{
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark Animation

-(void)createButton:(id)sender
{
    NSString  *userAccountL =  self.userAccountLogin.text;
    [self.myArray insertObject:userAccountL atIndex:0];
    [_myCollectionView reloadData];
    self.userAccountLogin.text = @"";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.collectionHeight.constant = self.myCollectionView.contentSize.height;
        [UIView animateWithDuration:0.3 animations:^{
            [self.view layoutIfNeeded];
        }];
    });
}

#pragma mark CollectionView


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return self.numberOfItemsInCollectionView;
    return [self.myArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //MyCell *cell = [self.myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
   MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 20;
    cell.layer.borderColor = [UIColor whiteColor].CGColor;
    cell.layer.borderWidth = 3.0f;
    cell.myCustomlabel.text = [self.myArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark configurating cell
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{    static MyCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [[[UINib nibWithNibName:@"MyCell" bundle:nil] instantiateWithOwner:self options:nil] firstObject];
    });
    sizingCell.myCustomlabel.text = [self.myArray objectAtIndex:indexPath.row];
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGFloat wids = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].width;
    float floatHeigth = wids;
    NSLog(@"height is %f",floatHeigth);
    return CGSizeMake(wids, 40);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

@end
