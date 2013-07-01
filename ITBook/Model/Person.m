//
//  Person.m
//  ITBook
//
//  Created by SkyLORD on 29.06.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

// <challenge the directive #import, shall connect a type library that describes the use of COM interfaces>
			#import "Person.h"

// <ad constants is a good way to make these constants defined once for the whole app>
			static NSString *const sPersonDefaultFirstName = @"No First Name";
			static NSString *const sPersonDefaultLastName = @"No Last Name";

			NSString *const kPersonFirstNameKey = @"firstName";
			NSString *const kPersonLastNameKey = @"lastName";

//* <These directives provide the scoping information the compiler needs to associate the enclosed methods with the corresponding class. A method’s definition therefore matches its corresponding declaration in the interface, except for the inclusion of a code block.> *//
			@implementation Person

// <compiler directive to ask the compiler to generate the methods according to the specification in the declaration>
			@synthesize firstName = _firstName, lastName = _lastName;

// ad method declararation for variable "firstName":
			- (id)initWithFirstName:(NSString *)aFirstName
						{
								return [self initWithFirstName:aFirstName lastName:nil];
						}

// ad method declararation for variable "lastName":
			- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName
						{
								return [self initWithFirstName:aFirstName lastName:aLastName];
						}

//the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -

// ad method declararation for variable "dict":
			- (id)initWithDictionaryRepresentation:(NSDictionary *)aDict
						{
								self = [super init];
								if (self)
								{
										self.firstName = [aDict objectForKey:kPersonFirstNameKey];
										self.lastName = [aDict objectForKey:kPersonLastNameKey];
								}
	
								return self;
						}

// ad method declararation for variable "representation":
			- (NSDictionary *)dictionaryRepresentation
						{
								NSMutableDictionary *theRepresentation = [NSMutableDictionary dictionary];
	
								if (nil != self.firstName || NO == [sPersonDefaultFirstName isEqualToString:self.firstName])
								{
										[theRepresentation setObject:self.firstName forKey:kPersonFirstNameKey];
								}
	
								if (nil != self.lastName)
								{
										[theRepresentation setObject:self.lastName forKey:kPersonLastNameKey];
								}
	
								return [[theRepresentation copy] autorelease];
						}


// free the memory:
			- (void)dealloc
						{
								[_firstName release];
								[_lastName release];
	
								[super dealloc];
						}

// the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -

// ad method declararation for variable "firstName":
			- (void)setFirstName:(NSString *)aFirstName
						{
								if (_firstName != aFirstName)
								{
										[_firstName autorelease];
										_firstName = [aFirstName copy];
								}
						}

			- (NSString *)firstName
						{
								return (nil == _firstName) ? sPersonDefaultFirstName : _firstName;
						}

// ad method declararation for variable "lastName":
			- (void)setLastName:(NSString *)aLastName
						{
								if (_lastName != aLastName)
								{
										[_lastName autorelease];
										_lastName = [aLastName copy];
								}
						}

			- (NSString *)lastName
						{
								return _lastName;
						}

// the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -

//???			- (NSString *)stringRepresentation
//						{
//???									NSString *theCoverTypeStringRepresentahion = self.isPaperback ? @"Paperback": @"Hardcover";

//??								return [NSString stringWithFormat:@"FirstName:%@. LastName:%@.", self.firstName, self.lastName];
//						}

// the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -

// ad to return a new array that is a copy of the receiving array for "firstName"
			+ (NSArray *)personsSortByFirstNameWithSet:(NSSet *)aPersons
						{
								return [aPersons.allObjects sortedArrayUsingSelector:@selector(isEqualByFirstName:)];
						}

// ad to return a new array that is a copy of the receiving array for "lastName"
			+ (NSArray *)personSortByLastNameWithSet:(NSSet *)aPersons
						{
								return [aPersons.allObjects sortedArrayUsingSelector:@selector(isEqualByLastName:)];
						}

// ad to return a new array that is a copy of the receiving array for "firstName"
			+ (NSArray *)personsSortByFirstNameWithArray:(NSArray *)aPersons
						{
								return [aPersons sortedArrayUsingSelector:@selector(isEqualByFirstName:)];
						}

// ad to return a new array that is a copy of the receiving array for "lastName"
			+ (NSArray *)personsSortByLastNameWithArray:(NSArray *)aPersons
						{
								return [aPersons sortedArrayUsingSelector:@selector(isEqualByLastName:)];
						}

// the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -
// sorting request for "firstName":
			- (NSComparisonResult)isEqualByFirstName:(Person *)aPerson
						{
								return [self.firstName compare:aPerson.firstName];
						}

// sorting request for "lastName":
			- (NSComparisonResult)isEqualByLastName:(Person *)aPerson
						{
								return [self.lastName compare:aPerson.lastName];
						}

			@end
