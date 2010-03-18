//
//  SDWebImageDataSource.m
//  Sample
//
//  Created by Kirby Turner on 3/18/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "SDWebImageDataSource.h"

#define FULL_SIZE_INDEX 0
#define THUMBNAIL_INDEX 1

@implementation SDWebImageDataSource

- (void)dealloc {
   [images_ release], images_ = nil;
   [super dealloc];
}

- (id)init {
   self = [super init];
   if (self) {
      // Create a 2-dimensional array. First element of
      // the sub-array is the full size image URL and 
      // the second element is the thumbnail URL.
      images_ = [[NSArray alloc] initWithObjects:
                 [NSArray arrayWithObjects:@"http://farm3.static.flickr.com/2735/4430131154_95212b8e88_o.jpg", @"http://farm3.static.flickr.com/2735/4430131154_17d8a02b8c_s.jpg", nil],
                 nil];
   }
   return self;
}

- (UIImage *)imageWithURLString:(NSString *)string {
   NSURL *url = [NSURL URLWithString:string];
   NSData *data = [NSData dataWithContentsOfURL:url];
   UIImage *image = [UIImage imageWithData:data];
   return image;
}

#pragma mark -
#pragma mark KTPhotoBrowserDataSource

- (NSInteger)numberOfPhotos {
   NSInteger count = [images_ count];
   return count;
}

- (UIImage *)imageAtIndex:(NSInteger)index {
   NSArray *imageUrls = [images_ objectAtIndex:index];
   NSString *url = [imageUrls objectAtIndex:FULL_SIZE_INDEX];

   return [self imageWithURLString:url];
}

- (UIImage *)thumbImageAtIndex:(NSInteger)index {
   NSArray *imageUrls = [images_ objectAtIndex:index];
   NSString *url = [imageUrls objectAtIndex:THUMBNAIL_INDEX];

   return [self imageWithURLString:url];
}

@end
