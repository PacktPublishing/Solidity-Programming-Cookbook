/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
library myLibraryForCalculations {
    /**
     * @dev Safe substraction between two uint.
     */
    function sub(uint256 one, uint256 two) internal pure returns (uint256) {
        require(two <= one);
        uint256 tmp = one - two;
        return tmp;
    }

    /**
     * @dev Safe addition between two uint.
     */
    function add(uint256 one, uint256 two) internal pure returns (uint256) {
        uint256 tmp = one + two;
        require(tmp >= one);
        return tmp;
    }
}


contract calculator{
    using myLibraryForCalculations for uint; //include library for uint datatype
    function add_numbers(uint a, uint b) public pure returns (uint){
        return a.add(b); //using-for declaration allow to use syntatically sugar syntax like a.add(b);
    }

    function substract_numbers(uint a, uint b) public pure returns (uint){
        return a.sub(b); //using-for declaration allow to use syntatically sugar syntax like a.sub(b);
    }
}

contract calculator1{
    function add_numbers(uint a, uint b) public pure returns (uint){
        return myLibraryForCalculations.add(a,b); //when not using "using for" declaration
    }

    function substract_numbers(uint a, uint b) public pure returns (uint){
        return myLibraryForCalculations.sub(a,b); //when not using "using for" declaration
    }
}

