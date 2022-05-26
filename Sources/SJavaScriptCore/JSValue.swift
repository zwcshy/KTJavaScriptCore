
#if os(Linux)
import CJavaScriptCore
#else
import JavaScriptCore
#endif

/**
@interface
@discussion A JSValue is a reference to a JavaScript value. Every JSValue
 originates from a JSContext and holds a strong reference to it.
 When a JSValue instance method creates a new JSValue, the new value
 originates from the same JSContext.

 All JSValues values also originate from a JSVirtualMachine
 (available indirectly via the context property). It is an error to pass a
 JSValue to a method or property of a JSValue or JSContext originating from a
 different JSVirtualMachine. Doing so will raise an Objective-C exception.
*/
@available(macOS 10.9, *)
open class JSValue : NSObject {

    
    /**
    @property
    @abstract The JSContext that this value originates from.
    */
    open var context: JSContext! { get }

    
    /**
    @methodgroup Creating JavaScript Values
    */
    /*!
    @method
    @abstract Create a JSValue by converting an Objective-C object.
    @discussion The resulting JSValue retains the provided Objective-C object.
    @param value The Objective-C object to be converted.
    @result The new JSValue.
    */
    public /*not inherited*/ init!(object value: Any!, in context: JSContext!)

    
    /**
    @method
    @abstract Create a JavaScript value from a BOOL primitive.
    @param context The JSContext in which the resulting JSValue will be created.
    @result The new JSValue representing the equivalent boolean value.
    */
    public /*not inherited*/ init!(bool value: Bool, in context: JSContext!)

    
    /**
    @method
    @abstract Create a JavaScript value from a double primitive.
    @param context The JSContext in which the resulting JSValue will be created.
    @result The new JSValue representing the equivalent boolean value.
    */
    public /*not inherited*/ init!(double value: Double, in context: JSContext!)

    
    /**
    @method
    @abstract Create a JavaScript value from an <code>int32_t</code> primitive.
    @param context The JSContext in which the resulting JSValue will be created.
    @result The new JSValue representing the equivalent boolean value.
    */
    public /*not inherited*/ init!(int32 value: Int32, in context: JSContext!)

    
    /**
    @method
    @abstract Create a JavaScript value from a <code>uint32_t</code> primitive.
    @param context The JSContext in which the resulting JSValue will be created.
    @result The new JSValue representing the equivalent boolean value.
    */
    public /*not inherited*/ init!(uInt32 value: UInt32, in context: JSContext!)

    
    /**
    @method
    @abstract Create a new, empty JavaScript object.
    @param context The JSContext in which the resulting object will be created.
    @result The new JavaScript object.
    */
    public /*not inherited*/ init!(newObjectIn context: JSContext!)

    
    /**
    @method
    @abstract Create a new, empty JavaScript array.
    @param context The JSContext in which the resulting array will be created.
    @result The new JavaScript array.
    */
    public /*not inherited*/ init!(newArrayIn context: JSContext!)

    
    /**
    @method
    @abstract Create a new JavaScript regular expression object.
    @param pattern The regular expression pattern.
    @param flags The regular expression flags.
    @param context The JSContext in which the resulting regular expression object will be created.
    @result The new JavaScript regular expression object.
    */
    public /*not inherited*/ init!(newRegularExpressionFromPattern pattern: String!, flags: String!, in context: JSContext!)

    
    /**
    @method
    @abstract Create a new JavaScript error object.
    @param message The error message.
    @param context The JSContext in which the resulting error object will be created.
    @result The new JavaScript error object.
    */
    public /*not inherited*/ init!(newErrorFromMessage message: String!, in context: JSContext!)

    
    /**
    @method
    @abstract Create a new promise object using the provided executor callback.
    @param callback A callback block invoked while the promise object is being initialized. The resolve and reject parameters are functions that can be called to notify any pending reactions about the state of the new promise object.
    @param context The JSContext to which the resulting JSValue belongs.
    @result The JSValue representing a new promise JavaScript object.
    @discussion This method is equivalent to calling the Promise constructor in JavaScript. the resolve and reject callbacks each normally take a single value, which they forward to all relevent pending reactions. While inside the executor callback context will act as if it were in any other callback, except calleeFunction will be <code>nil</code>. This also means means the new promise object may be accessed via <code>[context thisValue]</code>.
    */
    @available(macOS 10.15, *)
    public /*not inherited*/ init!(newPromiseIn context: JSContext!, fromExecutor callback: ((JSValue?, JSValue?) -> Void)!)

    
    /**
    @method
    @abstract Create a new resolved promise object with the provided value.
    @param result The result value to be passed to any reactions.
    @param context The JSContext to which the resulting JSValue belongs.
    @result The JSValue representing a new promise JavaScript object.
    @discussion This method is equivalent to calling <code>[JSValue valueWithNewPromiseFromExecutor:^(JSValue *resolve, JSValue *reject) { [resolve callWithArguments:@[result]]; } inContext:context]</code>
    */
    @available(macOS 10.15, *)
    public /*not inherited*/ init!(newPromiseResolvedWithResult result: Any!, in context: JSContext!)

    
    /**
    @method
    @abstract Create a new rejected promise object with the provided value.
    @param reason The result value to be passed to any reactions.
    @param context The JSContext to which the resulting JSValue belongs.
    @result The JSValue representing a new promise JavaScript object.
    @discussion This method is equivalent to calling <code>[JSValue valueWithNewPromiseFromExecutor:^(JSValue *resolve, JSValue *reject) { [reject callWithArguments:@[reason]]; } inContext:context]</code>
    */
    @available(macOS 10.15, *)
    public /*not inherited*/ init!(newPromiseRejectedWithReason reason: Any!, in context: JSContext!)

    
    /**
    @method
    @abstract Create a new, unique, symbol object.
    @param description The description of the symbol object being created.
    @param context The JSContext to which the resulting JSValue belongs.
    @result The JSValue representing a unique JavaScript value with type symbol.
    */
    @available(macOS 10.15, *)
    public /*not inherited*/ init!(newSymbolFromDescription description: String!, in context: JSContext!)

    
    /**
    @method
    @abstract Create the JavaScript value <code>null</code>.
    @param context The JSContext to which the resulting JSValue belongs.
    @result The JSValue representing the JavaScript value <code>null</code>.
    */
    public /*not inherited*/ init!(nullIn context: JSContext!)

    
    /**
    @method
    @abstract Create the JavaScript value <code>undefined</code>.
    @param context The JSContext to which the resulting JSValue belongs.
    @result The JSValue representing the JavaScript value <code>undefined</code>.
    */
    public /*not inherited*/ init!(undefinedIn context: JSContext!)

    
    /**
    @methodgroup Converting to Objective-C Types
    @discussion When converting between JavaScript values and Objective-C objects a copy is
     performed. Values of types listed below are copied to the corresponding
     types on conversion in each direction. For NSDictionaries, entries in the
     dictionary that are keyed by strings are copied onto a JavaScript object.
     For dictionaries and arrays, conversion is recursive, with the same object
     conversion being applied to all entries in the collection.
    
    <pre>
    @textblock
       Objective-C type  |   JavaScript type
     --------------------+---------------------
             nil         |     undefined
            NSNull       |        null
           NSString      |       string
           NSNumber      |   number, boolean
         NSDictionary    |   Object object
           NSArray       |    Array object
            NSDate       |     Date object
           NSBlock (1)   |   Function object (1)
              id (2)     |   Wrapper object (2)
            Class (3)    | Constructor object (3)
    @/textblock
    </pre>
    
     (1) Instances of NSBlock with supported arguments types will be presented to
     JavaScript as a callable Function object. For more information on supported
     argument types see JSExport.h. If a JavaScript Function originating from an
     Objective-C block is converted back to an Objective-C object the block will
     be returned. All other JavaScript functions will be converted in the same
     manner as a JavaScript object of type Object.
    
     (2) For Objective-C instances that do not derive from the set of types listed
     above, a wrapper object to provide a retaining handle to the Objective-C
     instance from JavaScript. For more information on these wrapper objects, see
     JSExport.h. When a JavaScript wrapper object is converted back to Objective-C
     the Objective-C instance being retained by the wrapper is returned.
    
     (3) For Objective-C Class objects a constructor object containing exported
     class methods will be returned. See JSExport.h for more information on
     constructor objects.
    
     For all methods taking arguments of type id, arguments will be converted
     into a JavaScript value according to the above conversion.
    */
    /*!
    @method
    @abstract Convert this JSValue to an Objective-C object.
    @discussion The JSValue is converted to an Objective-C object according
     to the conversion rules specified above.
    @result The Objective-C representation of this JSValue.
    */
    open func toObject() -> Any!

    
    /**
    @method
    @abstract Convert a JSValue to an Objective-C object of a specific class.
    @discussion The JSValue is converted to an Objective-C object of the specified Class.
     If the result is not of the specified Class then <code>nil</code> will be returned.
    @result An Objective-C object of the specified Class or <code>nil</code>.
    */
    open func toObjectOf(_ expectedClass: AnyClass!) -> Any!

    
    /**
    @method
    @abstract Convert a JSValue to a boolean.
    @discussion The JSValue is converted to a boolean according to the rules specified
     by the JavaScript language.
    @result The boolean result of the conversion.
    */
    open func toBool() -> Bool

    
    /**
    @method
    @abstract Convert a JSValue to a double.
    @discussion The JSValue is converted to a number according to the rules specified
     by the JavaScript language.
    @result The double result of the conversion.
    */
    open func toDouble() -> Double

    
    /**
    @method
    @abstract Convert a JSValue to an <code>int32_t</code>.
    @discussion The JSValue is converted to an integer according to the rules specified
     by the JavaScript language.
    @result The <code>int32_t</code> result of the conversion.
    */
    open func toInt32() -> Int32

    
    /**
    @method
    @abstract Convert a JSValue to a <code>uint32_t</code>.
    @discussion The JSValue is converted to an integer according to the rules specified
     by the JavaScript language.
    @result The <code>uint32_t</code> result of the conversion.
    */
    open func toUInt32() -> UInt32

    
    /**
    @method
    @abstract Convert a JSValue to a NSNumber.
    @discussion If the JSValue represents a boolean, a NSNumber value of YES or NO
     will be returned. For all other types the value will be converted to a number according
     to the rules specified by the JavaScript language.
    @result The NSNumber result of the conversion.
    */
    open func toNumber() -> NSNumber!

    
    /**
    @method
    @abstract Convert a JSValue to a NSString.
    @discussion The JSValue is converted to a string according to the rules specified
     by the JavaScript language.
    @result The NSString containing the result of the conversion.
    */
    open func toString() -> String!

    
    /**
    @method
    @abstract Convert a JSValue to a NSDate.
    @discussion The value is converted to a number representing a time interval
     since 1970 which is then used to create a new NSDate instance.
    @result The NSDate created using the converted time interval.
    */
    open func toDate() -> Date!

    
    /**
    @method
    @abstract Convert a JSValue to a NSArray.
    @discussion If the value is <code>null</code> or <code>undefined</code> then <code>nil</code> is returned.
     If the value is not an object then a JavaScript TypeError will be thrown.
     The property <code>length</code> is read from the object, converted to an unsigned
     integer, and an NSArray of this size is allocated. Properties corresponding
     to indices within the array bounds will be copied to the array, with
     JSValues converted to equivalent Objective-C objects as specified.
    @result The NSArray containing the recursively converted contents of the
     converted JavaScript array.
    */
    open func toArray() -> [Any]!

    
    /**
    @method
    @abstract Convert a JSValue to a NSDictionary.
    @discussion If the value is <code>null</code> or <code>undefined</code> then <code>nil</code> is returned.
     If the value is not an object then a JavaScript TypeError will be thrown.
     All enumerable properties of the object are copied to the dictionary, with
     JSValues converted to equivalent Objective-C objects as specified.
    @result The NSDictionary containing the recursively converted contents of
     the converted JavaScript object.
    */
    open func toDictionary() -> [AnyHashable : Any]!

    
    /*!
    @functiongroup Checking JavaScript Types
    */
    
    /**
    @property
    @abstract Check if a JSValue corresponds to the JavaScript value <code>undefined</code>.
    */
    open var isUndefined: Bool { get }

    
    /**
    @property
    @abstract Check if a JSValue corresponds to the JavaScript value <code>null</code>.
    */
    open var isNull: Bool { get }

    
    /**
    @property
    @abstract Check if a JSValue is a boolean.
    */
    open var isBoolean: Bool { get }

    
    /**
    @property
    @abstract Check if a JSValue is a number.
    @discussion In JavaScript, there is no differentiation between types of numbers.
     Semantically all numbers behave like doubles except in special cases like bit
     operations.
    */
    open var isNumber: Bool { get }

    
    /**
    @property
    @abstract Check if a JSValue is a string.
    */
    open var isString: Bool { get }

    
    /**
    @property
    @abstract Check if a JSValue is an object.
    */
    open var isObject: Bool { get }

    
    /**
    @property
    @abstract Check if a JSValue is an array.
    */
    @available(macOS 10.11, *)
    open var isArray: Bool { get }

    
    /**
    @property
    @abstract Check if a JSValue is a date.
    */
    @available(macOS 10.11, *)
    open var isDate: Bool { get }

    
    /**
     @property
     @abstract Check if a JSValue is a symbol.
     */
    @available(macOS 10.15, *)
    open var isSymbol: Bool { get }

    
    /**
    @method
    @abstract Compare two JSValues using JavaScript's <code>===</code> operator.
    */
    open func isEqual(to value: Any!) -> Bool

    
    /**
    @method
    @abstract Compare two JSValues using JavaScript's <code>==</code> operator.
    */
    open func isEqualWithTypeCoercion(to value: Any!) -> Bool

    
    /**
    @method
    @abstract Check if a JSValue is an instance of another object.
    @discussion This method has the same function as the JavaScript operator <code>instanceof</code>.
     If an object other than a JSValue is passed, it will first be converted according to
     the aforementioned rules.
    */
    open func isInstance(of value: Any!) -> Bool

    
    /**
    @methodgroup Calling Functions and Constructors
    */
    /*!
    @method
    @abstract Invoke a JSValue as a function.
    @discussion In JavaScript, if a function doesn't explicitly return a value then it
     implicitly returns the JavaScript value <code>undefined</code>.
    @param arguments The arguments to pass to the function.
    @result The return value of the function call.
    */
    open func call(withArguments arguments: [Any]!) -> JSValue!

    
    /**
    @method
    @abstract Invoke a JSValue as a constructor.
    @discussion This is equivalent to using the <code>new</code> syntax in JavaScript.
    @param arguments The arguments to pass to the constructor.
    @result The return value of the constructor call.
    */
    open func construct(withArguments arguments: [Any]!) -> JSValue!

    
    /**
    @method
    @abstract Invoke a method on a JSValue.
    @discussion Accesses the property named <code>method</code> from this value and
     calls the resulting value as a function, passing this JSValue as the <code>this</code>
     value along with the specified arguments.
    @param method The name of the method to be invoked.
    @param arguments The arguments to pass to the method.
    @result The return value of the method call.
    */
    open func invokeMethod(_ method: String!, withArguments arguments: [Any]!) -> JSValue!
}

/**
@category
@discussion Objective-C methods exported to JavaScript may have argument and/or return
 values of struct types, provided that conversion to and from the struct is
 supported by JSValue. Support is provided for any types where JSValue
 contains both a class method <code>valueWith<Type>:inContext:</code>, and and instance
 method <code>to<Type></code>- where the string <code><Type></code> in these selector names match,
 with the first argument to the former being of the same struct type as the
 return type of the latter.
 Support is provided for structs of type CGPoint, NSRange, CGRect and CGSize.
*/
extension JSValue {

    
    /**
    @method
    @abstract Create a JSValue from a CGPoint.
    @result A newly allocated JavaScript object containing properties
     named <code>x</code> and <code>y</code>, with values from the CGPoint.
    */
    public /*not inherited*/ init!(point: CGPoint, in context: JSContext!)

    
    /**
    @method
    @abstract Create a JSValue from a NSRange.
    @result A newly allocated JavaScript object containing properties
     named <code>location</code> and <code>length</code>, with values from the NSRange.
    */
    public /*not inherited*/ init!(range: NSRange, in context: JSContext!)

    
    /**
    @method
    @abstract
    Create a JSValue from a CGRect.
    @result A newly allocated JavaScript object containing properties
     named <code>x</code>, <code>y</code>, <code>width</code>, and <code>height</code>, with values from the CGRect.
    */
    public /*not inherited*/ init!(rect: CGRect, in context: JSContext!)

    
    /**
    @method
    @abstract Create a JSValue from a CGSize.
    @result A newly allocated JavaScript object containing properties
     named <code>width</code> and <code>height</code>, with values from the CGSize.
    */
    public /*not inherited*/ init!(size: CGSize, in context: JSContext!)

    
    /**
    @method
    @abstract Convert a JSValue to a CGPoint.
    @discussion Reads the properties named <code>x</code> and <code>y</code> from
     this JSValue, and converts the results to double.
    @result The new CGPoint.
    */
    open func toPoint() -> CGPoint

    
    /**
    @method
    @abstract Convert a JSValue to an NSRange.
    @discussion Reads the properties named <code>location</code> and
     <code>length</code> from this JSValue and converts the results to double.
    @result The new NSRange.
    */
    open func toRange() -> NSRange

    
    /**
    @method
    @abstract Convert a JSValue to a CGRect.
    @discussion Reads the properties named <code>x</code>, <code>y</code>,
     <code>width</code>, and <code>height</code> from this JSValue and converts the results to double.
    @result The new CGRect.
    */
    open func toRect() -> CGRect

    
    /**
    @method
    @abstract Convert a JSValue to a CGSize.
    @discussion Reads the properties named <code>width</code> and
     <code>height</code> from this JSValue and converts the results to double.
    @result The new CGSize.
    */
    open func toSize() -> CGSize
}

/**
 @category
 @discussion These methods enable querying properties on a JSValue.
 */
extension JSValue {

    
    /**
     @method
     @abstract Access a property of a JSValue.
     @result The JSValue for the requested property or the JSValue <code>undefined</code>
     if the property does not exist.
     @discussion Corresponds to the JavaScript operation <code>object[property]</code>. Starting with macOS 10.15 and iOS 13, 'property' can be any 'id' and will be converted to a JSValue using the conversion rules of <code>valueWithObject:inContext:</code>. Prior to macOS 10.15 and iOS 13, 'property' was expected to be an NSString *.
     */
    open func forProperty(_ property: Any!) -> JSValue!

    
    /**
     @method
     @abstract Set a property on a JSValue.
     @discussion Corresponds to the JavaScript operation <code>object[property] = value</code>. Starting with macOS 10.15 and iOS 13, 'property' can be any 'id' and will be converted to a JSValue using the conversion rules of <code>valueWithObject:inContext:</code>. Prior to macOS 10.15 and iOS 13, 'property' was expected to be an NSString *.
     */
    open func setValue(_ value: Any!, forProperty property: Any!)

    
    /**
     @method
     @abstract Delete a property from a JSValue.
     @result YES if deletion is successful, NO otherwise.
     @discussion Corresponds to the JavaScript operation <code>delete object[property]</code>. Starting with macOS 10.15 and iOS 13, 'property' can be any 'id' and will be converted to a JSValue using the conversion rules of <code>valueWithObject:inContext:</code>. Prior to macOS 10.15 and iOS 13, 'property' was expected to be an NSString *.
     */
    open func deleteProperty(_ property: Any!) -> Bool

    
    /**
     @method
     @abstract Check if a JSValue has a property.
     @discussion This method has the same function as the JavaScript operator <code>in</code>.
     @result Returns YES if property is present on the value.
     @discussion Corresponds to the JavaScript operation <code>property in object</code>. Starting with macOS 10.15 and iOS 13, 'property' can be any 'id' and will be converted to a JSValue using the conversion rules of <code>valueWithObject:inContext:</code>. Prior to macOS 10.15 and iOS 13, 'property' was expected to be an NSString *.
     */
    open func hasProperty(_ property: Any!) -> Bool

    
    /**
     @method
     @abstract Define properties with custom descriptors on JSValues.
     @discussion This method may be used to create a data or accessor property on an object.
     This method operates in accordance with the Object.defineProperty method in the JavaScript language. Starting with macOS 10.15 and iOS 13, 'property' can be any 'id' and will be converted to a JSValue using the conversion rules of <code>valueWithObject:inContext:</code>. Prior to macOS 10.15 and iOS 13, 'property' was expected to be an NSString *.
     */
    open func defineProperty(_ property: Any!, descriptor: Any!)

    
    /**
     @method
     @abstract Access an indexed (numerical) property on a JSValue.
     @result The JSValue for the property at the specified index.
     Returns the JavaScript value <code>undefined</code> if no property exists at that index.
     */
    open func atIndex(_ index: Int) -> JSValue!

    
    /**
     @method
     @abstract Set an indexed (numerical) property on a JSValue.
     @discussion For JSValues that are JavaScript arrays, indices greater than
     UINT_MAX - 1 will not affect the length of the array.
     */
    open func setValue(_ value: Any!, at index: Int)
}
public typealias JSValueProperty = AnyObject

/**
@category
@discussion Instances of JSValue implement the following methods in order to enable
 support for subscript access by key and index, for example:

@textblock
    JSValue *objectA, *objectB;
    JSValue *v1 = object[@"X"]; // Get value for property "X" from 'object'.
    JSValue *v2 = object[42];   // Get value for index 42 from 'object'.
    object[@"Y"] = v1;          // Assign 'v1' to property "Y" of 'object'.
    object[101] = v2;           // Assign 'v2' to index 101 of 'object'.
@/textblock

 An object key passed as a subscript will be converted to a JavaScript value,
 and then the value using the same rules as <code>valueWithObject:inContext:</code>. In macOS
 10.14 and iOS 12 and below, the <code>key</code> argument of
 <code>setObject:object forKeyedSubscript:key</code> was restricted to an
 <code>NSObject <NSCopying> *</code> but that restriction was never used internally.
*/
extension JSValue {

    
    open func objectForKeyedSubscript(_ key: Any!) -> JSValue!

    open func objectAtIndexedSubscript(_ index: Int) -> JSValue!

    open func setObject(_ object: Any!, forKeyedSubscript key: Any!)

    open func setObject(_ object: Any!, atIndexedSubscript index: Int)
}

/**
@category
@discussion  These functions are for bridging between the C API and the Objective-C API.
*/
extension JSValue {

    
    /**
    @method
    @abstract Creates a JSValue, wrapping its C API counterpart.
    @result The Objective-C API equivalent of the specified JSValueRef.
    */
    public /*not inherited*/ init!(jsValueRef value: JSValueRef!, in context: JSContext!)

    
    /**
    @property
    @abstract Returns the C API counterpart wrapped by a JSContext.
    @result The C API equivalent of this JSValue.
    */
    open var jsValueRef: JSValueRef! { get }
}

/**
@group Property Descriptor Constants
@discussion These keys may assist in creating a property descriptor for use with the
 defineProperty method on JSValue.
 Property descriptors must fit one of three descriptions:

 Data Descriptor:
  - A descriptor containing one or both of the keys <code>value</code> and <code>writable</code>,
    and optionally containing one or both of the keys <code>enumerable</code> and
    <code>configurable</code>. A data descriptor may not contain either the <code>get</code> or
    <code>set</code> key.
    A data descriptor may be used to create or modify the attributes of a
    data property on an object (replacing any existing accessor property).

 Accessor Descriptor:
  - A descriptor containing one or both of the keys <code>get</code> and <code>set</code>, and
    optionally containing one or both of the keys <code>enumerable</code> and
    <code>configurable</code>. An accessor descriptor may not contain either the <code>value</code>
    or <code>writable</code> key.
    An accessor descriptor may be used to create or modify the attributes of
    an accessor property on an object (replacing any existing data property).

 Generic Descriptor:
  - A descriptor containing one or both of the keys <code>enumerable</code> and
    <code>configurable</code>. A generic descriptor may not contain any of the keys
    <code>value</code>, <code>writable</code>, <code>get</code>, or <code>set</code>.
    A generic descriptor may be used to modify the attributes of an existing
    data or accessor property, or to create a new data property.
*/
/*!
@const
*/
public let JSPropertyDescriptorWritableKey: String
/**
@const
*/
public let JSPropertyDescriptorEnumerableKey: String
/**
@const
*/
public let JSPropertyDescriptorConfigurableKey: String
/**
@const
*/
public let JSPropertyDescriptorValueKey: String
/**
@const
*/
public let JSPropertyDescriptorGetKey: String
/**
@const
*/
public let JSPropertyDescriptorSetKey: String
