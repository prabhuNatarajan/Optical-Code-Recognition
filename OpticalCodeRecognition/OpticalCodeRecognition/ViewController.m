//
//  ViewController.m
//  OpticalCodeRecognition
//
//  Created by Apple on 12/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "ViewController.h"
#import "ResultViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImage *selectedImage;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.chooseButton setTitle:@"choose Photo" forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // Show process button
    /*if (self.selectedImage) {
        UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Process"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(processWasPressed:)];
       
        [self.navigationItem setRightBarButtonItem:barButton animated:YES];
        self.processButton.enabled = YES;
        [self.selectedImageView setImage:self.selectedImage];
    }
    */
    [self.selectedImageView setImage:self.selectedImage];
    [self.chooseButton setTitle:@"process Photo" forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*- (void)processWasPressed:(id)sender
{
    ResultViewController *resultsVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ResultViewController"];
    
    // Create loading view.
    resultsVC.loadingView = [[UIView alloc] initWithFrame:self.view.bounds];
    resultsVC.loadingView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    [resultsVC.view addSubview:resultsVC.loadingView];
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] init];
    [resultsVC.loadingView addSubview:activityView];
    activityView.center = resultsVC.loadingView.center;
    [activityView startAnimating];
    
    resultsVC.selectedImage = self.selectedImage;
    [resultsVC.selectedImageView setImage:self.selectedImage];
    
    // Push
    //[self.navigationController pushViewController:resultsVC animated:YES];
    [self.navigationController presentViewController:resultsVC animated:YES completion:nil];
    
}*/
- (IBAction)choosePhoto:(id)sender
{
    if ([self.chooseButton.titleLabel.text  isEqualToString: @"choose Photo"])
    {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        
        
        if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        }
        else {
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
        
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
    else if ([self.chooseButton.titleLabel.text isEqualToString: @"process Photo"])
    {
        [self processPhoto];
    }
   
}
- (void)processPhoto
{
    [self.selectedImageView setImage:self.selectedImage];
    //ResultViewController *resultsVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ResultViewController"];
    NSString * storyboardName = @"Main";
    NSString * viewControllerID = @"ResultViewController";
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    ResultViewController * resultsVC = (ResultViewController *)[storyboard instantiateViewControllerWithIdentifier:viewControllerID];
    
    // Create loading view.
    resultsVC.loadingView = [[UIView alloc] initWithFrame:self.view.bounds];
    resultsVC.loadingView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    [resultsVC.view addSubview:resultsVC.loadingView];
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] init];
    [resultsVC.loadingView addSubview:activityView];
    activityView.center = resultsVC.loadingView.center;
    [activityView startAnimating];
    
    resultsVC.selectedImage = self.selectedImage;
    [resultsVC.selectedImageView setImage:self.selectedImage];
    
    // Push
    //[self.navigationController pushViewController:resultsVC animated:YES];
    //[self.navigationController presentViewController:resultsVC animated:YES completion:nil];
    [self presentViewController:resultsVC animated:YES completion:NULL];
}

@end
