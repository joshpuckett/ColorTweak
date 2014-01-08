//
//  ViewController.h
//  BlurredThumbCollectionViewExample
//
//  Created by Josh Puckett on 1/7/14.
//  Copyright (c) 2014 Josh Puckett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}

//Set up slider labels
@property (weak, nonatomic) IBOutlet UILabel *tintLabel;
@property (weak, nonatomic) IBOutlet UILabel *saturationLabel;
@property (weak, nonatomic) IBOutlet UILabel *blurLabel;

//Set up sliders
@property (weak, nonatomic) IBOutlet UISlider *tintSlider;
@property (weak, nonatomic) IBOutlet UISlider *saturationSlider;
@property (weak, nonatomic) IBOutlet UISlider *blurSlider;

//Set up slider actions
- (IBAction)tintValueChanged:(UISlider *)sender;
- (IBAction)saturationValueChanged:(UISlider *)sender;
- (IBAction)blurSliderChanged:(UISlider *)sender;


//set up touch up actions
- (IBAction)tintTouchUp:(UISlider *)sender;
- (IBAction)saturationTouchUp:(UISlider *)sender;
- (IBAction)blurTouchUp:(UISlider *)sender;


@property (weak, nonatomic) IBOutlet UISwitch *blurOn;
- (IBAction)switchChanged:(UISwitch *)sender;


@end
