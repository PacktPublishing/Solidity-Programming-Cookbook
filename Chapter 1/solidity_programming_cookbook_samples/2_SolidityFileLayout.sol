/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
//Ordering inside contract:
contract layoutSetter {

    /*  State Variables
        Events
        Function Modifiers
        Value and Reference Types : Struct, arrays or Enum
        Constructor
        Fallback function (if exists)
        External
        Public
        Internal
        Private
        Default/fallback Functions
    */
    // State Variables
    address public stateVariable1;
    uint public stateVariable2;
    address owner;
    address mortal;
    
    // Events
    event Event1(address param1, uint param2);
    event Event2(address param1);
    event Event3();

    // Function Modifiers
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    modifier onlyIfMortalModifier() { 
        require(msg.sender == mortal);
        _;
    }

    // Value and Reference Types : Struct, arrays or Enum if any here
    enum enum1 { val1, val2, val3 }
    struct Person { 
        uint name;
        uint addr;
        address location;
    }
    mapping (address => uint) balances;

    // Define consutruct here
    constructor() public {
       // Initialize state variables here
    }
    

    // External functions
    function externalFun() external pure returns(string memory){
        return "External function get called";
    }

    // External functions that are constant
    function externalViewFun() external pure returns(string memory){
        return "External constant function get called";
    }

    // Public functions
    function publicViewConstantFun() public pure returns(string memory){
        return "Public function get called";
    }

    // Internal functions
    function internalFun() internal pure returns(string memory){
        return "Internal function get called";
    }

    // Private functions
    function a() private pure returns(string memory){
        return "private function get called";
    }

    //default or fallback function
    function() external{
        revert(); //transaction should revert to initial state
    }

    
}
