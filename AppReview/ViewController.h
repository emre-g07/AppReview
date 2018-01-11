//
//  ViewController.h
//  AppReview
//
//  Created by EmreG on 25.09.2017.
//  Copyright © 2017 EmreG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *img1Star;
@property (strong, nonatomic) IBOutlet UIImageView *img2Star;
@property (strong, nonatomic) IBOutlet UIImageView *img3Star;
@property (strong, nonatomic) IBOutlet UIImageView *img4Star;
@property (strong, nonatomic) IBOutlet UIImageView *img5Star;
@property (strong, nonatomic) IBOutlet UIView *sendFeedBackView;
@property (strong, nonatomic) IBOutlet UIView *feedBackTextView;
@property (strong, nonatomic) IBOutlet UILabel *lblSendButtonTitle;
@property (strong, nonatomic) IBOutlet UIImageView *imgSendActionButtonBackground;
@property (strong, nonatomic) IBOutlet UITextView *txtAppReviewText;
- (IBAction)clickedNativeAppReview:(id)sender;

- (IBAction)clicked1Star:(id)sender;
- (IBAction)clicked2Star:(id)sender;
- (IBAction)clicked3Star:(id)sender;
- (IBAction)clicked4Star:(id)sender;
- (IBAction)clicked5Star:(id)sender;
- (IBAction)closeAppReviewPage:(id)sender;
- (IBAction)clickedSendAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnSendAction;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *sendFeedBackViewConstraintHeight;
@end

