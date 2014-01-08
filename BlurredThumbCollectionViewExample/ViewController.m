//
//  ViewController.m
//  BlurredThumbCollectionViewExample
//
//  Created by Josh Puckett on 1/7/14.
//  Copyright (c) 2014 Josh Puckett. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects.h"

@interface ViewController () {
    NSArray *thumbImages;
    UIImage *image;
    float tintOpacity;
    float saturation;
    float blur;
    int toggle;
}

@end

@implementation ViewController



- (void)viewDidLoad
{
    toggle = 0;
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    thumbImages = [NSArray arrayWithObjects:@"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg", @"5.jpg", @"6.jpg", @"7.jpg", @"8.jpg", @"9.jpg", @"10.jpg", @"11.jpg", @"12.jpg", @"13.jpg", @"14.jpg", @"15.jpg", @"16.jpg", @"17.jpg", @"18.jpg", @"19.jpg", @"20.jpg", @"21.jpg", @"22.jpg", @"23.jpg", @"24.jpg", @"25.jpg", nil];
    CGRect cView = CGRectMake(360, 60, 628, 628);
    _collectionView=[[UICollectionView alloc] initWithFrame:cView collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:_collectionView];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];

    _tintLabel.text = [NSString stringWithFormat:@"%.02f", (float)_tintSlider.value];
    _saturationLabel.text = [NSString stringWithFormat:@"%.02f", (float)_saturationSlider.value];
    _blurLabel.text = [NSString stringWithFormat:@"%.02f", (float)_blurSlider.value];
    tintOpacity = _tintSlider.value;
    saturation = _saturationSlider.value;
    blur = _blurSlider.value;
    
    [super viewDidLoad];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 25;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    //Set background image of cell to image
    image = [UIImage imageNamed:[thumbImages objectAtIndex:indexPath.row]];
    UIImage *effectImage = nil;
    effectImage = [image applyTintEffectWithColor:[UIColor blackColor] colorOpacity:tintOpacity saturationDeltaFactor:saturation blurRadius:blur];
    cell.backgroundColor=[UIColor colorWithPatternImage:effectImage];
    
    //Set label of cell
    UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%d", indexPath.row];
    [label setFont:[UIFont boldSystemFontOfSize:32]];
    label.textColor = [UIColor whiteColor];
    [cell.contentView addSubview:label];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath

{
    return CGSizeMake(112, 112);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tintValueChanged:(UISlider *)sender {
    _tintLabel.text = [NSString stringWithFormat:@"%.02f", (float)sender.value];
    tintOpacity = _tintSlider.value;

}

- (IBAction)saturationValueChanged:(UISlider *)sender {
  _saturationLabel.text = [NSString stringWithFormat:@"%.02f", (float)sender.value];
    saturation = _saturationSlider.value;
}

- (IBAction)blurSliderChanged:(UISlider *)sender {
    _blurLabel.text = [NSString stringWithFormat:@"%.02f", (float)sender.value];
    blur = _blurSlider.value;
}

- (IBAction)tintTouchUp:(UISlider *)sender {
    for (UICollectionViewCell *cell in [_collectionView visibleCells]) {
        NSIndexPath *indexPath = [_collectionView indexPathForCell:cell];
        image = [UIImage imageNamed:[thumbImages objectAtIndex:indexPath.row]];
        UIImage *effectImage = nil;
        effectImage = [image applyTintEffectWithColor:[UIColor blackColor] colorOpacity:tintOpacity saturationDeltaFactor:saturation blurRadius:blur];
        cell.backgroundColor=[UIColor colorWithPatternImage:effectImage];
    }
}

- (IBAction)saturationTouchUp:(UISlider *)sender {
    for (UICollectionViewCell *cell in [_collectionView visibleCells]) {
        NSIndexPath *indexPath = [_collectionView indexPathForCell:cell];
        image = [UIImage imageNamed:[thumbImages objectAtIndex:indexPath.row]];
        UIImage *effectImage = nil;
        effectImage = [image applyTintEffectWithColor:[UIColor blackColor] colorOpacity:tintOpacity saturationDeltaFactor:saturation blurRadius:blur];
        cell.backgroundColor=[UIColor colorWithPatternImage:effectImage];
    }
}


- (IBAction)blurTouchUp:(UISlider *)sender {
    for (UICollectionViewCell *cell in [_collectionView visibleCells]) {
        NSIndexPath *indexPath = [_collectionView indexPathForCell:cell];
        image = [UIImage imageNamed:[thumbImages objectAtIndex:indexPath.row]];
        UIImage *effectImage = nil;
        effectImage = [image applyTintEffectWithColor:[UIColor blackColor] colorOpacity:tintOpacity saturationDeltaFactor:saturation blurRadius:blur];
        cell.backgroundColor=[UIColor colorWithPatternImage:effectImage];
    }
}
- (IBAction)switchChanged:(UISwitch *)sender {
    if (toggle == 0) {
        for (UICollectionViewCell *cell in [_collectionView visibleCells]) {
            NSIndexPath *indexPath = [_collectionView indexPathForCell:cell];
            image = [UIImage imageNamed:[thumbImages objectAtIndex:indexPath.row]];
            cell.backgroundColor=[UIColor colorWithPatternImage:image];
        }
        toggle = 1;
    } else {
        for (UICollectionViewCell *cell in [_collectionView visibleCells]) {
            NSIndexPath *indexPath = [_collectionView indexPathForCell:cell];
            image = [UIImage imageNamed:[thumbImages objectAtIndex:indexPath.row]];
            UIImage *effectImage = nil;
            effectImage = [image applyTintEffectWithColor:[UIColor blackColor] colorOpacity:tintOpacity saturationDeltaFactor:saturation blurRadius:blur];
            cell.backgroundColor=[UIColor colorWithPatternImage:effectImage];
        }
        toggle = 0;
    }
}
@end
