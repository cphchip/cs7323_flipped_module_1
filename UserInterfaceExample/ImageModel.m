//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//
//  Modified by: Ches Smith


#import "ImageModel.h"

@interface ImageModel()
@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSDictionary* imagesDictionary;
@end

@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize imagesDictionary = _imagesDictionary;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[@"Bill",@"Eric",@"Jeff", @"ape", @"elephant", @"giraffe"];
    
    return _imageNames; 
}

- (NSDictionary*)imagesDictionary {
    if (!_imagesDictionary) {
        NSMutableDictionary *mutableImagesDictionary = [[NSMutableDictionary alloc] init];
        for (NSString *name in [self imageNames]) {
            UIImage *image = [UIImage imageNamed:name];
            if (image) {
                [mutableImagesDictionary setObject:image forKey:name];
            }
        }
        _imagesDictionary = [mutableImagesDictionary copy]; // Make it immutable
    }
    return _imagesDictionary;
}


-(UIImage* _Nullable)getImageWithName:(NSString*)name{
    
    return [self.imagesDictionary objectForKey:name];
}

-(UIImage* _Nullable)getImageWithIndex:(NSInteger)index{
    if (index >= 0 && index < [self.imageNames count]) {
        NSString *name = [self.imageNames objectAtIndex:index];
        return [self getImageWithName:name];
    }
    return nil;
}

-(NSInteger)numberOfImages{
    return [self.imageNames count];
}

-(NSString* _Nullable)getImageNameForIndex:(NSInteger)index{
    if (index >= 0 && index < [self.imageNames count]) {
        return [self.imageNames objectAtIndex:index];
    }
    return nil;
}

@end
