pragma solidity ^0.5.1;
contract Math {

    function isDivisibleBy(uint dividend, uint divisor ) public pure  returns( bool ){
        // if statement will be executed if given condition is true(bool)
        if((dividend % divisor) == 0){
            return true;
        }
        else {
            // this will be executed if IF statement is false
            return false;
        }
        /*We can write above statement using conditional operator (? :) as well
          return bool flag = (dividend % divisor) == 0) ? true : false

        */

    }

    function getFactorial(uint number) public pure returns( uint ){
        if(number == 0){ //if loop
            return 1; //return result
        }
        else {
            uint factorial = 1;
            for(uint i = number;i>1;i--) //for loop
            {
                factorial = factorial * i;
                if(factorial > 100){
                    break; //terminate loop
                }
            }
            return factorial; //return result
     }
    }
}


pragma solidity ^0.5.1;
contract Math {

    function isDivisibleBy(uint dividend, uint divisor ) public pure  returns( bool ){
        //We can write above statement using conditional operator (? :) as well
          return (dividend % divisor) == 0) ? true : false

    }
}

