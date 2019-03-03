pragma solidity ^0.5.1;
contract Math {
    //check divisibility
    function isDivisibleBy(uint dividend, uint divisor ) external pure  returns( bool, uint ){
        if((dividend % divisor) == 0){
            return (true, divisor);
     }
     else {
            return (false,divisor);
     }
    }
}
contract MathUser {
    Math util = new Math(); //instance of Math contract
    function outputOfisDivisibleBy(uint balance) public view returns(bool,uint){ 
        require(balance > 2, "No balance to execute"); //if executor has less balace then provide VM error.
        util.isDivisibleBy(45,5);
    }
}
