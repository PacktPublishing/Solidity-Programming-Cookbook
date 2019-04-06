/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;  
contract StringLessthen32CharecterToByte32 {  
//conversion of string less than 32 characters long to bytes32
    function toBytes32(string memory _string) public pure returns (bytes32) {//try argument ("Packt solidity Book")
        // pure means we are not accessing state nor changing state
        // make sure string should be less than 32 characters
        require(bytes(_string).length <= 32); 
        bytes32 _stringBytes;
        //best way of conversion from string to bytes32
        assembly {
          // load the memory pointer of string with an offset of 32
          // 32 passes over non-core data parts of string such as length of text
          _stringBytes := mload(add(_string, 32)) 
            }
        return _stringBytes;
    }
}
