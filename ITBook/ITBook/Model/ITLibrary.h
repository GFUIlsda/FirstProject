//
//  ITLibrary.h
//  ITBook
//
//  Created by SkyLORD on 04.07.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

// <challenge the directive #import, shall connect a type library that describes the use of COM interfaces>
#import <Foundation/Foundation.h>
@class ITBook;
@class Peron;

// <creating a scripted class "ITBook" and ad parents class name "NSObject", you specify the class interface in an @interface...@end>
@interface ITLibrary : NSObject

// declaration of variables in the project:
{
		NSMutableArray *_books;
		NSMutableArray *_persons;
}

@property (nonatomic, readonly) NSMutableArray *books;
@property (nonatomic, readonly) NSMutableArray *persons;

 // <ad NSDictionary for need a convenient and efficient way to retrieve data associated with an arbitrary key>
- (id)initWithDictionaryRepresentation:(NSDictionary *)aDict;
- (NSDictionary *)dictionaryRepresentation;
 
// <ad addBook and removeBook for need a convenient and efficient way to retrieve data associated with an arbitrary key>
- (void)addBook:(ITBook *)aBook;
- (void)removeBook:(ITBook *)aBook;

// <ad addPerson and removePerson for need a convenient and efficient way to retrieve data associated with an arbitrary key>
- (void)addPerson:(Peron *)aPerson;
- (void)removePerson:(Peron *)aPerson;

@end
