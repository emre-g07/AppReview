//
//  ViewController.m
//  AppReview
//
//  Created by EmreG on 25.09.2017.
//  Copyright © 2017 EmreG. All rights reserved.
//

#import "ViewController.h"
#import "SCLAlertView.h"
#import "BSKeyboardControls.h"

#import <StoreKit/StoreKit.h>

typedef NS_ENUM(NSInteger,SEND_ACTION_BUTTON_TYPE){
    SEND_BACKLOG,
    SEND_APP_STORE,
};

@interface ViewController ()<BSKeyboardControlsDelegate,UITextViewDelegate,SCALertViewDelegate>{
    
    NSUInteger selectedStar;
}
@property (strong, nonatomic) BSKeyboardControls *keyboardControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareForKeyboardControls];
    [self initialStars];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)prepareForKeyboardControls{
    NSArray *fields = @[self.txtAppReviewText];
    self.keyboardControl = [[BSKeyboardControls alloc] initWithFields:fields];
    [self.keyboardControl addDelegate:self];
}

-(void)initialStars{
    
    self.txtAppReviewText.text = @"";
    [self.txtAppReviewText  setFont: [UIFont fontWithName:@"GothamNarrow-Book" size:12]];
    self.txtAppReviewText.textColor = [UIColor lightGrayColor];
    self.txtAppReviewText.text = @"Do you like the ehliyetCepte application?";
    
    selectedStar = 0;
    [self prepareSendActionButton:SEND_BACKLOG];
    [self.img1Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
    [self.img2Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
    [self.img3Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
    [self.img4Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
    [self.img5Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
}

- (IBAction)clickedNativeAppReview:(id)sender {
    [SKStoreReviewController requestReview];
}

- (IBAction)clicked1Star:(id)sender {
    [self setSelectedStar:1];
}

- (IBAction)clicked2Star:(id)sender {
    [self setSelectedStar:2];
}

- (IBAction)clicked3Star:(id)sender {
    [self setSelectedStar:3];
}

- (IBAction)clicked4Star:(id)sender {
    [self setSelectedStar:4];
}

- (IBAction)clicked5Star:(id)sender {
    [self setSelectedStar:5];
}

-(void)openFeedBackView{
    self.sendFeedBackView.hidden = NO;
    self.feedBackTextView.hidden = NO;
    self.sendFeedBackViewConstraintHeight.constant = 195;
    [self.sendFeedBackView setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

-(void)closeFeedBackView{
    self.feedBackTextView.hidden = YES;
    self.sendFeedBackViewConstraintHeight.constant = 100;
    [self.sendFeedBackView setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        //self.sendFeedBackView.hidden = YES;
    }];
}

- (IBAction)closeAppReviewPage:(id)sender {
    
}

- (IBAction)clickedSendAction:(id)sender {
    if (selectedStar == 5) {
        [self openAppStoreLink:@"https://itunes.apple.com/tr/app/ehliyetcepte-ehliyet-%C3%A7%C4%B1kmis-sorular/id1164076057?l=tr&mt=8"];
    }else {
        if (![self.txtAppReviewText.text isEqualToString:@"Do you like the ehliyetCepte application?"] && self.txtAppReviewText.text.length > 0) {
            [self.txtAppReviewText resignFirstResponder];
            SCLAlertView *alert = [[SCLAlertView alloc] init];
            alert.delegate = self;
            UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
            [alert showInfo:controller title:@"" subTitle:@"We have been already working ...." withCustomImage:[UIImage imageNamed:@"mavi_info_icon"] closeButtonTitle:@"OK" duration:0.0f];
        }else {
            //Alert manager
        }
    }
}

-(void)setSelectedStar:(NSUInteger)selectedIndex{
    
    [self openFeedBackView];
    selectedStar = selectedIndex;
    
    switch (selectedIndex) {
        case 1:{
            [self prepareSendActionButton:SEND_BACKLOG];
            [self.img1Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img2Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
            [self.img3Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
            [self.img4Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
            [self.img5Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
        }
            break;
        case 2:{
            [self prepareSendActionButton:SEND_BACKLOG];
            [self.img1Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img2Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img3Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
            [self.img4Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
            [self.img5Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
        }
            break;
        case 3:{
            [self prepareSendActionButton:SEND_BACKLOG];
            [self.img1Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img2Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img3Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img4Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
            [self.img5Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
        }
            break;
        case 4:{
            [self prepareSendActionButton:SEND_BACKLOG];
            [self.img1Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img2Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img3Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img4Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img5Star setImage:[UIImage imageNamed:@"star_ikon_passive"]];
        }
            break;
        case 5:{
            [self prepareSendActionButton:SEND_APP_STORE];
            [self closeFeedBackView];
            [self.img1Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img2Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img3Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img4Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
            [self.img5Star setImage:[UIImage imageNamed:@"star_ikon_active"]];
        }
            break;
            
        default:
            break;
    }
}

-(void)prepareSendActionButton:(SEND_ACTION_BUTTON_TYPE)sendButtonType{
    
    switch (sendButtonType) {
        case SEND_BACKLOG:{
            [self.lblSendButtonTitle setText:@"SEND"];
            [self.imgSendActionButtonBackground setImage:[UIImage imageNamed:@"button_red_BG"]];
        }
            break;
        case SEND_APP_STORE:{
            [self.lblSendButtonTitle setText:@"APP STORE"];
            [self.imgSendActionButtonBackground setImage:[UIImage imageNamed:@"button_blue_BG"]];
        }
            break;
            
        default:
            break;
    }
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self.keyboardControl setActiveField:textView];
    self.txtAppReviewText.text = @"";
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    if (textView == self.txtAppReviewText) {
        if(self.txtAppReviewText.text.length == 0){
            [self.txtAppReviewText  setFont: [UIFont fontWithName:@"GothamNarrow-Book" size:12]];
            self.txtAppReviewText.textColor = [UIColor lightGrayColor];
            self.txtAppReviewText.text = @"Do you like the ehliyetCepte application?";
        }
    }
}

- (void)textFieldDidBeginEditing:(UIView *)textField {
    [self.keyboardControl setActiveField:textField];
}

- (void)keyboardControls:(BSKeyboardControls *)keyboardControls selectedField:(UIView *)field inDirection:(BSKeyboardControlsDirection)direction {
    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls {
    
    if ([keyboardControls.activeField isKindOfClass:[UITextView class]]) {
        [keyboardControls.activeField resignFirstResponder];
    }
}

-(void)openAppStoreLink:(NSString*)itunesLink{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:itunesLink]];
}

-(void)dismisAlertView{
    [self closeAppReviewPage:nil];
}



@end
