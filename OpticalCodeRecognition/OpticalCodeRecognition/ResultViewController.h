//
//  ResultViewController.h
//  OpticalCodeRecognition
//
//  Created by Apple on 12/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController

@property (nonatomic, strong) UIView *loadingView;
@property (weak, nonatomic) UIImage *selectedImage;
@property (strong, nonatomic) IBOutlet UIImageView *selectedImageView;
@property (strong, nonatomic) IBOutlet UITextView *resultsTextView;
- (IBAction)testAnother:(id)sender;

@end
