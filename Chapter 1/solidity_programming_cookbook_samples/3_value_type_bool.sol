/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
//using latest pragma version to execute our code on https://remix.ethereum.org
pragma solidity ^0.5.1;
//our contract name.
contract SchoolTrip{
    bool public tripDecider; //boolean variable that will initiate with intial default value false;
    //pure keyword - function will not alter the storage and even not read storage state.
    //internal keyword - Only accessible to this contract and contracts deriving from this contract.
    function tripAnalyzer(uint256 studentCount, bool principleApproval, bool legalApproval) internal pure returns(bool){
    /*Trip decider logic
    Operators && and || adhere to the common short-circuit rules. 
    i.e if in an expression a(x) | | b(y) the expression a(x) evaluates to true,
    the b(y) expression will not be evaluated
    */
        return (studentCount >= 100 && (principleApproval || legalApproval)); 
    }
    function checkTripStatus() public returns(bool){
        //...Other logical part here 
        return tripDecider = tripAnalyzer(100,true,false);
    }
}
