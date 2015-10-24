//
//  ViewController.m
//  core-location
//
//  Created by Treinamento Mobile on 10/24/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

//lembrar de assinar o delegate
@interface ViewController () <CLLocationManagerDelegate>
@property (nonatomic, weak) IBOutlet UILabel *latitudeLabel;
@property (nonatomic, weak) IBOutlet UILabel *longitudelabel;
@property (nonatomic, weak) IBOutlet UILabel *speedLabel;

@property (nonatomic, strong) IBOutlet CLLocationManager *locationManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
   
    // [self.locationManager requestWhenInUseAuthorization];
    // OU
    [self.locationManager requestAlwaysAuthorization];
    
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    
    self.latitudeLabel.text = [NSString
       stringWithFormat:@"Latitude: %@", [NSString
       stringWithFormat:@"%.8f", location.coordinate.latitude]]
       ;
    self.longitudelabel.text = [NSString
       stringWithFormat:@"Longitude: %@", [NSString
       stringWithFormat:@"%.8f", location.coordinate.longitude]]
       ;
    self.speedLabel.text = [NSString
       stringWithFormat:@"Velocidade: %@", [NSString
       stringWithFormat:@"%.8f", location.speed]];
}
@end
