
#if os(Linux)
import CJavaScriptCore
#else
import JavaScriptCore
#endif

/**
@enum JSType
@abstract     A constant identifying the type of a JSValue.
@constant     kJSTypeUndefined  The unique undefined value.
@constant     kJSTypeNull       The unique null value.
@constant     kJSTypeBoolean    A primitive boolean value, one of true or false.
@constant     kJSTypeNumber     A primitive number value.
@constant     kJSTypeString     A primitive string value.
@constant     kJSTypeObject     An object value (meaning that this JSValueRef is a JSObjectRef).
@constant     kJSTypeSymbol     A primitive symbol value.
*/
public struct JSType : Equatable, RawRepresentable {

    public init(_ rawValue: UInt32)

    public init(rawValue: UInt32)

    public var rawValue: UInt32
}
public var kJSTypeUndefined: JSType { get }
public var kJSTypeNull: JSType { get }
public var kJSTypeBoolean: JSType { get }
public var kJSTypeNumber: JSType { get }
public var kJSTypeString: JSType { get }
public var kJSTypeObject: JSType { get }
@available(iOS 13.0, macCatalyst 13.1, *)
public var kJSTypeSymbol: JSType { get }

/**
 @enum JSTypedArrayType
 @abstract     A constant identifying the Typed Array type of a JSObjectRef.
 @constant     kJSTypedArrayTypeInt8Array            Int8Array
 @constant     kJSTypedArrayTypeInt16Array           Int16Array
 @constant     kJSTypedArrayTypeInt32Array           Int32Array
 @constant     kJSTypedArrayTypeUint8Array           Uint8Array
 @constant     kJSTypedArrayTypeUint8ClampedArray    Uint8ClampedArray
 @constant     kJSTypedArrayTypeUint16Array          Uint16Array
 @constant     kJSTypedArrayTypeUint32Array          Uint32Array
 @constant     kJSTypedArrayTypeFloat32Array         Float32Array
 @constant     kJSTypedArrayTypeFloat64Array         Float64Array
 @constant     kJSTypedArrayTypeBigInt64Array        BigInt64Array
 @constant     kJSTypedArrayTypeBigUint64Array       BigUint64Array
 @constant     kJSTypedArrayTypeArrayBuffer          ArrayBuffer
 @constant     kJSTypedArrayTypeNone                 Not a Typed Array

 */
@available(iOS 10.0, macCatalyst 13.1, *)
public struct JSTypedArrayType : Equatable, RawRepresentable {

    public init(_ rawValue: UInt32)

    public init(rawValue: UInt32)

    public var rawValue: UInt32
}
public var kJSTypedArrayTypeInt8Array: JSTypedArrayType { get }
public var kJSTypedArrayTypeInt16Array: JSTypedArrayType { get }
public var kJSTypedArrayTypeInt32Array: JSTypedArrayType { get }
public var kJSTypedArrayTypeUint8Array: JSTypedArrayType { get }
public var kJSTypedArrayTypeUint8ClampedArray: JSTypedArrayType { get }
public var kJSTypedArrayTypeUint16Array: JSTypedArrayType { get }
public var kJSTypedArrayTypeUint32Array: JSTypedArrayType { get }
public var kJSTypedArrayTypeFloat32Array: JSTypedArrayType { get }
public var kJSTypedArrayTypeFloat64Array: JSTypedArrayType { get }
public var kJSTypedArrayTypeArrayBuffer: JSTypedArrayType { get }
public var kJSTypedArrayTypeNone: JSTypedArrayType { get }
public var kJSTypedArrayTypeBigInt64Array: JSTypedArrayType { get }
public var kJSTypedArrayTypeBigUint64Array: JSTypedArrayType { get }

/**
@function
@abstract       Returns a JavaScript value's type.
@param ctx  The execution context to use.
@param value    The JSValue whose type you want to obtain.
@result         A value of type JSType that identifies value's type.
*/
public func JSValueGetType(_ ctx: JSContextRef!, _ value: JSValueRef!) -> JSType

/**
@function
@abstract       Tests whether a JavaScript value's type is the undefined type.
@param ctx  The execution context to use.
@param value    The JSValue to test.
@result         true if value's type is the undefined type, otherwise false.
*/
public func JSValueIsUndefined(_ ctx: JSContextRef!, _ value: JSValueRef!) -> Bool

/**
@function
@abstract       Tests whether a JavaScript value's type is the null type.
@param ctx  The execution context to use.
@param value    The JSValue to test.
@result         true if value's type is the null type, otherwise false.
*/
public func JSValueIsNull(_ ctx: JSContextRef!, _ value: JSValueRef!) -> Bool

/**
@function
@abstract       Tests whether a JavaScript value's type is the boolean type.
@param ctx  The execution context to use.
@param value    The JSValue to test.
@result         true if value's type is the boolean type, otherwise false.
*/
public func JSValueIsBoolean(_ ctx: JSContextRef!, _ value: JSValueRef!) -> Bool

/**
@function
@abstract       Tests whether a JavaScript value's type is the number type.
@param ctx  The execution context to use.
@param value    The JSValue to test.
@result         true if value's type is the number type, otherwise false.
*/
public func JSValueIsNumber(_ ctx: JSContextRef!, _ value: JSValueRef!) -> Bool

/**
@function
@abstract       Tests whether a JavaScript value's type is the string type.
@param ctx  The execution context to use.
@param value    The JSValue to test.
@result         true if value's type is the string type, otherwise false.
*/
public func JSValueIsString(_ ctx: JSContextRef!, _ value: JSValueRef!) -> Bool

/**
@function
@abstract       Tests whether a JavaScript value's type is the symbol type.
@param ctx      The execution context to use.
@param value    The JSValue to test.
@result         true if value's type is the symbol type, otherwise false.
*/
@available(iOS 13.0, macCatalyst 13.1, *)
public func JSValueIsSymbol(_ ctx: JSContextRef!, _ value: JSValueRef!) -> Bool

/**
@function
@abstract       Tests whether a JavaScript value's type is the object type.
@param ctx  The execution context to use.
@param value    The JSValue to test.
@result         true if value's type is the object type, otherwise false.
*/
public func JSValueIsObject(_ ctx: JSContextRef!, _ value: JSValueRef!) -> Bool

/**
@function
@abstract Tests whether a JavaScript value is an object with a given class in its class chain.
@param ctx The execution context to use.
@param value The JSValue to test.
@param jsClass The JSClass to test against.
@result true if value is an object and has jsClass in its class chain, otherwise false.
*/
public func JSValueIsObjectOfClass(_ ctx: JSContextRef!, _ value: JSValueRef!, _ jsClass: JSClassRef!) -> Bool

/**
@function
@abstract       Tests whether a JavaScript value is an array.
@param ctx      The execution context to use.
@param value    The JSValue to test.
@result         true if value is an array, otherwise false.
*/
@available(iOS 9.0, macCatalyst 13.1, *)
public func JSValueIsArray(_ ctx: JSContextRef!, _ value: JSValueRef!) -> Bool

/**
@function
@abstract       Tests whether a JavaScript value is a date.
@param ctx      The execution context to use.
@param value    The JSValue to test.
@result         true if value is a date, otherwise false.
*/
@available(iOS 9.0, macCatalyst 13.1, *)
public func JSValueIsDate(_ ctx: JSContextRef!, _ value: JSValueRef!) -> Bool

/**
@function
@abstract           Returns a JavaScript value's Typed Array type.
@param ctx          The execution context to use.
@param value        The JSValue whose Typed Array type to return.
@param exception    A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
@result             A value of type JSTypedArrayType that identifies value's Typed Array type, or kJSTypedArrayTypeNone if the value is not a Typed Array object.
 */
@available(iOS 10.0, macCatalyst 13.1, *)
public func JSValueGetTypedArrayType(_ ctx: JSContextRef!, _ value: JSValueRef!, _ exception: UnsafeMutablePointer<JSValueRef?>!) -> JSTypedArrayType

/* Comparing values */

/**
@function
@abstract Tests whether two JavaScript values are equal, as compared by the JS == operator.
@param ctx The execution context to use.
@param a The first value to test.
@param b The second value to test.
@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
@result true if the two values are equal, false if they are not equal or an exception is thrown.
*/
public func JSValueIsEqual(_ ctx: JSContextRef!, _ a: JSValueRef!, _ b: JSValueRef!, _ exception: UnsafeMutablePointer<JSValueRef?>!) -> Bool

/**
@function
@abstract       Tests whether two JavaScript values are strict equal, as compared by the JS === operator.
@param ctx  The execution context to use.
@param a        The first value to test.
@param b        The second value to test.
@result         true if the two values are strict equal, otherwise false.
*/
public func JSValueIsStrictEqual(_ ctx: JSContextRef!, _ a: JSValueRef!, _ b: JSValueRef!) -> Bool

/**
@function
@abstract Tests whether a JavaScript value is an object constructed by a given constructor, as compared by the JS instanceof operator.
@param ctx The execution context to use.
@param value The JSValue to test.
@param constructor The constructor to test against.
@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
@result true if value is an object constructed by constructor, as compared by the JS instanceof operator, otherwise false.
*/
public func JSValueIsInstanceOfConstructor(_ ctx: JSContextRef!, _ value: JSValueRef!, _ constructor: JSObjectRef!, _ exception: UnsafeMutablePointer<JSValueRef?>!) -> Bool

/* Creating values */

/**
@function
@abstract       Creates a JavaScript value of the undefined type.
@param ctx  The execution context to use.
@result         The unique undefined value.
*/
public func JSValueMakeUndefined(_ ctx: JSContextRef!) -> JSValueRef!

/**
@function
@abstract       Creates a JavaScript value of the null type.
@param ctx  The execution context to use.
@result         The unique null value.
*/
public func JSValueMakeNull(_ ctx: JSContextRef!) -> JSValueRef!

/**
@function
@abstract       Creates a JavaScript value of the boolean type.
@param ctx  The execution context to use.
@param boolean  The bool to assign to the newly created JSValue.
@result         A JSValue of the boolean type, representing the value of boolean.
*/
public func JSValueMakeBoolean(_ ctx: JSContextRef!, _ boolean: Bool) -> JSValueRef!

/**
@function
@abstract       Creates a JavaScript value of the number type.
@param ctx  The execution context to use.
@param number   The double to assign to the newly created JSValue.
@result         A JSValue of the number type, representing the value of number.
*/
public func JSValueMakeNumber(_ ctx: JSContextRef!, _ number: Double) -> JSValueRef!

/**
@function
@abstract       Creates a JavaScript value of the string type.
@param ctx  The execution context to use.
@param string   The JSString to assign to the newly created JSValue. The
 newly created JSValue retains string, and releases it upon garbage collection.
@result         A JSValue of the string type, representing the value of string.
*/
public func JSValueMakeString(_ ctx: JSContextRef!, _ string: JSStringRef!) -> JSValueRef!

/**
 @function
 @abstract            Creates a JavaScript value of the symbol type.
 @param ctx           The execution context to use.
 @param description   A description of the newly created symbol value.
 @result              A unique JSValue of the symbol type, whose description matches the one provided.
 */
@available(iOS 13.0, macCatalyst 13.1, *)
public func JSValueMakeSymbol(_ ctx: JSContextRef!, _ description: JSStringRef!) -> JSValueRef!

/* Converting to and from JSON formatted strings */

/**
 @function
 @abstract       Creates a JavaScript value from a JSON formatted string.
 @param ctx      The execution context to use.
 @param string   The JSString containing the JSON string to be parsed.
 @result         A JSValue containing the parsed value, or NULL if the input is invalid.
 */
@available(iOS 7.0, macCatalyst 13.1, *)
public func JSValueMakeFromJSONString(_ ctx: JSContextRef!, _ string: JSStringRef!) -> JSValueRef!

/**
 @function
 @abstract       Creates a JavaScript string containing the JSON serialized representation of a JS value.
 @param ctx      The execution context to use.
 @param value    The value to serialize.
 @param indent   The number of spaces to indent when nesting.  If 0, the resulting JSON will not contains newlines.  The size of the indent is clamped to 10 spaces.
 @param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
 @result         A JSString with the result of serialization, or NULL if an exception is thrown.
 */
@available(iOS 7.0, macCatalyst 13.1, *)
public func JSValueCreateJSONString(_ ctx: JSContextRef!, _ value: JSValueRef!, _ indent: UInt32, _ exception: UnsafeMutablePointer<JSValueRef?>!) -> JSStringRef!

/* Converting to primitive values */

/**
@function
@abstract       Converts a JavaScript value to boolean and returns the resulting boolean.
@param ctx  The execution context to use.
@param value    The JSValue to convert.
@result         The boolean result of conversion.
*/
public func JSValueToBoolean(_ ctx: JSContextRef!, _ value: JSValueRef!) -> Bool

/**
@function
@abstract       Converts a JavaScript value to number and returns the resulting number.
@param ctx  The execution context to use.
@param value    The JSValue to convert.
@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
@result         The numeric result of conversion, or NaN if an exception is thrown.
*/
public func JSValueToNumber(_ ctx: JSContextRef!, _ value: JSValueRef!, _ exception: UnsafeMutablePointer<JSValueRef?>!) -> Double

/**
@function
@abstract       Converts a JavaScript value to string and copies the result into a JavaScript string.
@param ctx  The execution context to use.
@param value    The JSValue to convert.
@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
@result         A JSString with the result of conversion, or NULL if an exception is thrown. Ownership follows the Create Rule.
*/
public func JSValueToStringCopy(_ ctx: JSContextRef!, _ value: JSValueRef!, _ exception: UnsafeMutablePointer<JSValueRef?>!) -> JSStringRef!

/**
@function
@abstract Converts a JavaScript value to object and returns the resulting object.
@param ctx  The execution context to use.
@param value    The JSValue to convert.
@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
@result         The JSObject result of conversion, or NULL if an exception is thrown.
*/
public func JSValueToObject(_ ctx: JSContextRef!, _ value: JSValueRef!, _ exception: UnsafeMutablePointer<JSValueRef?>!) -> JSObjectRef!

/* Garbage collection */
/**
@function
@abstract Protects a JavaScript value from garbage collection.
@param ctx The execution context to use.
@param value The JSValue to protect.
@discussion Use this method when you want to store a JSValue in a global or on the heap, where the garbage collector will not be able to discover your reference to it.
 
A value may be protected multiple times and must be unprotected an equal number of times before becoming eligible for garbage collection.
*/
public func JSValueProtect(_ ctx: JSContextRef!, _ value: JSValueRef!)

/**
@function
@abstract       Unprotects a JavaScript value from garbage collection.
@param ctx      The execution context to use.
@param value    The JSValue to unprotect.
@discussion     A value may be protected multiple times and must be unprotected an
 equal number of times before becoming eligible for garbage collection.
*/
public func JSValueUnprotect(_ ctx: JSContextRef!, _ value: JSValueRef!)
