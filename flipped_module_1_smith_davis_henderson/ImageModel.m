//
//  ImageModel.m
//  flipped_module_1_smith_davis_hendersonExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

// Create the private proprety
@interface ImageModel ()
@property (strong, nonatomic) NSArray *imageNames;
// Create property for image dictionary
@property (strong, nonatomic) NSDictionary *imageDict;
@end


@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize imageDict = _imageDict; // add private property to synthesize


+(ImageModel*)sharedInstance
{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    
        // Initialize imageNames and imageDict as part of the sharedInstance
        _sharedInstance.imageNames = @[@"Bill",@"Eric",@"Jeff"];
    
        // Temporary variables to hold the images
        UIImage *jeffImg = [UIImage imageNamed:@"Jeff.png"];
        UIImage *billImg = [UIImage imageNamed:@"Bill.png"];
        UIImage *ericImg = [UIImage imageNamed:@"Eric.png"];
        
        // Map the imageNames indexes to keys and image variables to values
        _sharedInstance.imageDict = @{
            _sharedInstance.imageNames[0]: billImg,
            _sharedInstance.imageNames[1]: ericImg,
            _sharedInstance.imageNames[2]: jeffImg
        };
    } );
    return _sharedInstance;
}


-(UIImage*)getImageWithName:(NSString*)name
{
    return [_imageDict objectForKey:name];
}


-(UIImage*)getImageWithIndex:(NSInteger)index
{
    NSString *imageKey = _imageNames[index];
    
    return [_imageDict objectForKey:imageKey];
}


-(NSInteger)numberOfImages
{
    return [_imageDict count];
}


-(NSString*)getImageNameForIndex:(NSInteger)index
{
    return _imageNames[index];
}


@end
