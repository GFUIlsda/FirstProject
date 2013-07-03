//
//  ITLibrary.h
//  ITBook
//
//  Created by SkyLORD on 04.07.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITBook;
@class Peron;

@interface ITLibrary : NSObject
{
		NSMutableArray *_books;
		NSMutableArray *_persons;
}

- (void)addBook:(ITBook *)aBook;
- (void)removeBook:(ITBook *)aBook;

- (void)addPerson:(Peron *)aPerson;
- (void)removePerson:(Peron *)aPerson;

@end
