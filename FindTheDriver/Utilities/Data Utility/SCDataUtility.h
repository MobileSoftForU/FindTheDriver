//
//  SCDataUtility.h
//  SkillsConnectBusiness
//
//  Created by Dinesh A. Kumar on 6/16/15.
//  Copyright (c) 2015 Endeavour. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCDataUtility : NSObject

/*!
 * Used to convert the object into dictionary
 * @param obj is any kind of object
 * @return NSMutableDictionary
 */
+ (NSMutableDictionary*)getDictionaryBasaedOnObject:(id)obj;

/*!
 * Used to get the error message based on error Code
 * @param errorCodeStr is NSString Object
 * @return NSString
 */
+ (NSString *)getErrorMessageFromPlistWithErrorCode:(NSString *)errorCodeStr;

//Used to fill data in a model from dictnary.
+ (void)addDataInModel:(id)obj fromDataSource:(NSDictionary*)data;


/*!
 * used to get the Random number
 * @return String Value
 */
+ (NSString *)getRandomNumber;

/*!
 * Used to get the captcha string
 * @param length is an input paramater
 * @return NSString returns a captcha string
 */
+ (NSString *)getCaptchaStringWithLength:(int)length;

//Percent Escapes Using Encoding
+ (NSString*)perEspEncode:(NSString*)data;

+ (NSString *)getShiftStatusFromPlistWithStatusCode:(NSString *)statusCodeStr;

//Get Today Date for Dash Board
+(NSString*)getTodayDateForDashBoard;

//Get Today Date, give formatter
+(NSString*)getTodayDate:(NSString*)formatter;

//Get Logged In User Name
+(NSString*)getUserName;

//Get Logged In User Password
+(NSString*)getUserPassword;

+(NSString*)getAppVersion;

+(NSString*)getDeviceToken;

+(BOOL)getNotificationStatus;
+(void)setNotificationStatus:(BOOL)status;

+(NSString*)getHOSNotificationAlertType;
+(void)setHOSNotificationAlertType:(NSString*)alertType;

#pragma mark:- Gallery Image Methods
+(UIImage*)galleryImage:(NSString*)imageName;
+(void)writeGalleryImage:(UIImage*)image imagename:(NSString*)imagename;
+(void)deleteGalleryImage;
+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;

//Store Profile Info
+(void)storeDriverInfo:(id)profileInfoDict;
+(id)getProfileInfoDict;

//Store Duty Cycle
+(void)storeDutyCycle:(id)dutyCycleDict;
+(id)getDutyCycleDict;

//Store Time Zone
+(void)storeTimeZone:(id)timeZoneDict;
+(id)getTimeZoneDict;

//Store Carrier
+(void)storeCarrier:(id)dataDict;
+(id)getStoreCarrierData;

//Store Exceptions
+(void)storeExceptions:(id)dataDict;
+(id)getExceptionsData;

//Store HosStatus
+(void)storeHosStatus:(id)dataDict;
+(id)getHosStatusData;

//Store VIRDefects
+(void)storeVIRDefects:(id)dataDict;
+(id)getVIRDefectsData;

//Store Violations
+(void)storeViolations:(id)dataDict;
+(id)getViolationsData;

//Store Settings Logs
+(void)storeSelectedTimeZone:(NSString*)str;
+(NSString*)getSelectedTimeZone;

+(void)storeSelectedCycle:(NSString*)str;
+(NSString*)getSelectedCycle;

+(void)storeSelectedOdoMeter:(NSString*)str;
+(NSString*)getSelectedOdometer;

+(void)storeSelectedLogIncrement:(NSString*)str;
+(NSString*)getSelectedLogIncrement;

//Dash Board Selected Vehicle
+(void)storeSelectedVehicle:(NSString*)str;
+(NSString*)getSelectedVehicle;
@end





