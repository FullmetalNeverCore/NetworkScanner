//
//  LanScan.h
//  NetworkScanner
//
//  Created by 0xNeverC0RE on 23/02/2024.
//
#import <Foundation/Foundation.h>

@protocol LANScanDelegate <NSObject>

#define MAX_IP_RANGE 254
#define TIMEOUT 0.1

#define DEVICE_NAME @"DEVICE_NAME"
#define DEVICE_IP_ADDRESS @"DEVICE_IP_ADDRESS"

@optional
- (void)lanScanDidFinishScanning;
- (void)lanScanDidFindNewDevice:(NSDictionary *) device;
- (void)lanScanHasUpdatedProgress:(NSInteger) counter address:(NSString*) address;
@end

@interface LanScan : NSObject

@property(nonatomic,weak) id<LANScanDelegate> delegate;

- (id)initWithDelegate:(id<LANScanDelegate>)delegate;
- (void)start;
- (void)stop;
- (NSString*) getCurrentWifiSSID;

@end
