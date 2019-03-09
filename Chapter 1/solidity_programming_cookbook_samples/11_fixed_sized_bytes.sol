/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
contract BytesMultiReturner {
    function getData() public pure  returns (uint8, uint8) {
        bytes8 a = "Solidity";
        bytes32 b = "Packt Solidity cookbook";
        return (a.length, b.length);
    }
}
