pragma solidity ^0.5.1;
contract GasUsesforBytesAndStrings {
    string constant _string = "Solidity Cook Book";
  /*
  for bytes32 constant _bytes keep string charecter less than 32 else you would get error compile time error.
  */
    bytes32 constant _bytes = "Solidity Cook Book"; 
    function  getString() public pure returns(string memory) {
        return _string;
    }

    function  getBytes() public pure returns(bytes32) {
        return _bytes;
    }
}