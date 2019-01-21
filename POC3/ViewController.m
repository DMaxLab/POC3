//
//  ViewController.m
//  POC3
//
//  Created by Thobio on 21/01/19.
//  Copyright © 2019 Zerone Consulting. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<AcuantMobileSDKControllerCapturingDelegate,AcuantMobileSDKControllerProcessingDelegate>

#define LicenseKey_Demo                      @"DC8F38993D87"
#define LicenseKey                           @"4F20A16587DA"

@property (strong, nonatomic) AcuantMobileSDKController *acuantMobileSDKController;
@property (nonatomic)           BOOL wasValidated;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.acuantMobileSDKController = [AcuantMobileSDKController initAcuantMobileSDKWithLicenseKey:LicenseKey_Demo andDelegate:self];
    _cardType = AcuantCardTypeAuto;
    _cardRegion = AcuantCardRegionAustralia;
    
    [self.acuantMobileSDKController setInitialMessage:@"Tap screen to capture" frame:CGRectMake(0, 0, 0, 0) backgroundColor:[UIColor clearColor] duration:10.0 orientation: AcuantHUDLandscape];
    [self.acuantMobileSDKController setCapturingMessage:@"Hold Steady" frame:CGRectMake(0, 0, 0, 0) backgroundColor:[UIColor clearColor] duration:10.0 orientation: AcuantHUDLandscape];
    UITapGestureRecognizer *singleTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
    [self.view addGestureRecognizer:singleTap];
}

- (void)mobileSDKWasValidated:(BOOL)wasValidated{
    self.wasValidated = wasValidated;
}
-(void)didCaptureCropImage:(UIImage *)cardImage scanBackSide:(BOOL)scanBackSide andCardType:(AcuantCardType)cardType{

}

-(void)didFailWithError:(AcuantError *)error{
    self.view.userInteractionEnabled = YES;
    NSString *message;
    switch (error.errorType) {
        case AcuantErrorTimedOut:
            message = error.errorMessage;
            break;
        case AcuantErrorUnknown:
            message = error.errorMessage;
            break;
        case AcuantErrorUnableToProcess:
            message = error.errorMessage;
            break;
        case AcuantErrorInternalServerError:
            message = error.errorMessage;
            break;
        case AcuantErrorCouldNotReachServer:
            message = error.errorMessage;
            break;
        case AcuantErrorUnableToAuthenticate:
            message = error.errorMessage;
            break;
        case AcuantErrorAutoDetectState:
            message = error.errorMessage;
            break;
        case AcuantErrorWebResponse:
            message = error.errorMessage;
            break;
        case AcuantErrorUnableToCrop:
            message = error.errorMessage;
            break;
        case AcuantErrorInvalidLicenseKey:
            message = error.errorMessage;
            break;
        case AcuantErrorInactiveLicenseKey:
            message = error.errorMessage;
            break;
        case AcuantErrorAccountDisabled:
            message = error.errorMessage;
            break;
        case AcuantErrorOnActiveLicenseKey:
            message = error.errorMessage;
            break;
        case AcuantErrorValidatingLicensekey:
            message = error.errorMessage;
            break;
        case AcuantErrorCameraUnauthorized:
            message = error.errorMessage;
            break;
        default:
            message = @"Error try again";
            break;
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"MyTech Facial Recognition Poc1" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didCaptureCropImage:(UIImage *)cardImage scanBackSide:(BOOL)scanBackSide andCardType:(AcuantCardType)cardType withImageMetrics:(NSDictionary *)imageMetrics {
    
}


- (void)didCaptureData:(NSString *)data {
    
}


- (void)didFinishProcessingCardWithResult:(AcuantCardResult *)result {
    
}


- (void)didFinishValidatingImageWithResult:(AcuantCardResult *)result {
    
}


-(void)tapView:(UITapGestureRecognizer *) sender {
    [self.acuantMobileSDKController setWidth:1478];
    [self.acuantMobileSDKController showManualCameraInterfaceInViewController:self delegate:self cardType:self.cardType region:self.cardRegion andBackSide:NO];
}



@end
