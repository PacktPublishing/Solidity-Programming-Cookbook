pragma solidity ^0.5.1;
contract Math {
    /* Anyone can call the function, It is part of contract interface and can be either called internally or via messages. 
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

