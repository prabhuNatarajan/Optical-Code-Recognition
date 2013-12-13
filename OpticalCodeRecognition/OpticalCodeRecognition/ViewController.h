//
//  ViewController.h
//  OpticalCodeRecognition
//
//  Created by Apple on 12/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *selectedImageView;
- (IBAction)choosePhoto:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *chooseButton;

@end
