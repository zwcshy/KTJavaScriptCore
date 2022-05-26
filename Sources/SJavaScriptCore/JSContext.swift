
#if os(Linux)
import CJavaScriptCore
#else
import JavaScriptCore
#endif

/**
@interface
@discussion A JSContext is a JavaScript execution environment. All
 JavaScript execution takes place within a context, and all JavaScript values
 are tied to a context.
*/
@available(iOS 7.0, macCatalyst 13.1, *)
open class JSContext : NSObject {

    
    /**
    @methodgroup Creating New JSContexts
    */
    /*!
    @method
    @abstract Create a JSContext.
    @result The new context.
    */
    public init!()

    
    /**
    @method
    @abstract Create a JSContext in the specified virtual machine.
    @param virtualMachine The JSVirtualMachine in which the context will be created.
    @result The new context.
    */
    public init!(virtualMachine: JSVirtualMachine!)

    
    /**
    @methodgroup Evaluating Scripts
    */
    /*!
    @method
    @abstract Evaluate a string of JavaScript code.
    @param script A string containing the JavaScript code to evaluate.
    @result The last value generated by the script.
    */
    open func evaluateScript(_ script: String!) -> JSValue!

    
    /**
    @method
    @abstract Evaluate a string of JavaScript code, with a URL for the script's source file.
    @param script A string containing the JavaScript code to evaluate.
    @param sourceURL A URL for the script's source file. Used by debuggers and when reporting exceptions. This parameter is informative only: it does not change the behavior of the script.
    @result The last value generated by the script.
    */
    @available(iOS 8.0, macCatalyst 13.1, *)
    open func evaluateScript(_ script: String!, withSourceURL sourceURL: URL!) -> JSValue!

    
    /**
    @methodgroup Callback Accessors
    */
    /*!
    @method
    @abstract Get the JSContext that is currently executing.
    @discussion This method may be called from within an Objective-C block or method invoked
     as a callback from JavaScript to retrieve the callback's context. Outside of
     a callback from JavaScript this method will return nil.
    @result The currently executing JSContext or nil if there isn't one.
    */
    open class func current() -> JSContext!

    
    /**
    @method
    @abstract Get the JavaScript function that is currently executing.
    @discussion This method may be called from within an Objective-C block or method invoked
     as a callback from JavaScript to retrieve the callback's context. Outside of
     a callback from JavaScript this method will return nil.
    @result The currently executing JavaScript function or nil if there isn't one.
    */
    @available(iOS 8.0, macCatalyst 13.1, *)
    open class func currentCallee() -> JSValue!

    
    /**
    @method
    @abstract Get the <code>this</code> value of the currently executing method.
    @discussion This method may be called from within an Objective-C block or method invoked
     as a callback from JavaScript to retrieve the callback's this value. Outside
     of a callback from JavaScript this method will return nil.
    @result The current <code>this</code> value or nil if there isn't one.
    */
    open class func currentThis() -> JSValue!

    
    /**
    @method
    @abstract Get the arguments to the current callback.
    @discussion This method may be called from within an Objective-C block or method invoked
     as a callback from JavaScript to retrieve the callback's arguments, objects
     in the returned array are instances of JSValue. Outside of a callback from
     JavaScript this method will return nil.
    @result An NSArray of the arguments nil if there is no current callback.
    */
    open class func currentArguments() -> [Any]!

    
    /*!
    @functiongroup Global Properties
    */
    
    /**
    @property
    @abstract Get the global object of the context.
    @discussion This method retrieves the global object of the JavaScript execution context.
     Instances of JSContext originating from WebKit will return a reference to the
     WindowProxy object.
    @result The global object.
    */
    open var globalObject: JSValue! { get }

    
    /**
    @property
    @discussion The <code>exception</code> property may be used to throw an exception to JavaScript.
     
     Before a callback is made from JavaScript to an Objective-C block or method,
     the prior value of the exception property will be preserved and the property
     will be set to nil. After the callback has completed the new value of the
     exception property will be read, and prior value restored. If the new value
     of exception is not nil, the callback will result in that value being thrown.
     
     This property may also be used to check for uncaught exceptions arising from
     API function calls (since the default behaviour of <code>exceptionHandler</code> is to
     assign an uncaught exception to this property).
    */
    open var exception: JSValue!

    
    /**
    @property
    @discussion If a call to an API function results in an uncaught JavaScript exception, the
     <code>exceptionHandler</code> block will be invoked. The default implementation for the
     exception handler will store the exception to the exception property on
     context. As a consequence the default behaviour is for uncaught exceptions
     occurring within a callback from JavaScript to be rethrown upon return.
     Setting this value to nil will cause all exceptions occurring
     within a callback from JavaScript to be silently caught.
    */
    open var exceptionHandler: ((JSContext?, JSValue?) -> Void)!

    
    /**
    @property
    @discussion All instances of JSContext are associated with a JSVirtualMachine.
    */
    open var virtualMachine: JSVirtualMachine! { get }

    
    /**
    @property
    @discussion Name of the JSContext. Exposed when remote debugging the context.
    */
    @available(iOS 8.0, macCatalyst 13.1, *)
    open var name: String!
}

/**
@category
@discussion Instances of JSContext implement the following methods in order to enable
 support for subscript access by key and index, for example:

@textblock
    JSContext *context;
    JSValue *v = context[@"X"]; // Get value for "X" from the global object.
    context[@"Y"] = v;          // Assign 'v' to "Y" on the global object.
@/textblock

 An object key passed as a subscript will be converted to a JavaScript value,
 and then the value converted to a string used to resolve a property of the
 global object.
*/
extension JSContext {

    
    /**
    @method
    @abstract Get a particular property on the global object.
    @result The JSValue for the global object's property.
    */
    open func objectForKeyedSubscript(_ key: Any!) -> JSValue!

    
    /**
    @method
    @abstract Set a particular property on the global object.
    */
    open func setObject(_ object: Any!, forKeyedSubscript key: (NSCopying & NSObjectProtocol)!)
}

/**
@category
@discussion These functions are for bridging between the C API and the Objective-C API.
*/
extension JSContext {

    
    /**
    @method
    @abstract Create a JSContext, wrapping its C API counterpart.
    @result The JSContext equivalent of the provided JSGlobalContextRef.
    */
    public /*not inherited*/ init!(jsGlobalContextRef: JSGlobalContextRef!)

    
    /**
    @property
    @abstract Get the C API counterpart wrapped by a JSContext.
    @result The C API equivalent of this JSContext.
    */
    open var jsGlobalContextRef: JSGlobalContextRef! { get }
}
