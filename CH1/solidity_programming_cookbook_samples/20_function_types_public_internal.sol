pragma solidity ^0.5.1;
contract Math {
    /* Anyone can call the function, being part of contract interface it is callable internally or through messages.  
    An automatic getter function is generated For public state variables.*/
    function getFactorial(uint number) public pure returns( uint ){
        return factorial(number); //call of internal function.
    }

    //can only be accessed internally (i.e. from within the current contract or contracts deriving from it), without using this.
    function factorial(uint number) internal pure returns( uint ){
        if(number == 0) {
            return 1;
        } else {
            return number * factorial(number - 1);
    }
    }
}

