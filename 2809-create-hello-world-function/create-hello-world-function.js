/**
 * @return {Function}
 */
var createHelloWorld = function(...args) {
    
    return function(...args) {
        return "Hello World"
    }
};

/**
 * const f = createHelloWorld();
 * f(); // "Hello World"
 */