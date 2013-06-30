//
//  Person.h
//  ITBook
//
//  Created by SkyLORD on 29.06.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

// <challenge the directive #import, shall connect a type library that describes the use of COM interfaces>
#import <Foundation/Foundation.h>

// <creating a scripted class "Person" and ad parents class name "NSObject", you specify the class interface in an @interface...@end>
@interface Person: NSObject

// declaration of variables in the project:
{
	NSString *_firstName;
	NSString *_lastName;
}

// <given the following class declaration>
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

// ad processing methods in the project:
- (id)initWithFirstName:(NSString *)aFirstName;
- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName;

// <description of pointers to type of information>
- (void)setFirstName:(NSString *)aFirstName;
- (NSString *)firstName;
- (void)setLastName:(NSString *)aLastName;
- (NSString *)lastName;

// <ad NSDictionary for need a convenient and efficient way to retrieve data associated with an arbitrary key>
- (id)initWithDictionaryRepresentation:(NSDictionary *)aDict;
- (NSDictionary *)dictionaryRepresentation;

- (NSString *)stringRepresentation;

// sorting the input data:
+ (NSArray *)booksSortByFirstNameWithSet:(NSSet *)aPersons;
+ (NSArray *)booksSortByLastNameWithSet:(NSSet *)aPersons;

+ (NSArray *)booksSortByFirstNameWithArray:(NSArray *)aPersons;
+ (NSArray *)booksSortByLastNameWithArray:(NSArray *)aPersons;

@end
