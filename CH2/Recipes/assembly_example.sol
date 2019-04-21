/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/

pragma solidity ^0.5.1;
//library to get external contract code and store it in bytes outputByteArray
library ReadAnotherContractCode {
    function contract_at(address externalCodeAddress) public view returns (bytes memory outputByteArray) {
        assembly {
            let extCodeSize := extcodesize(externalCodeAddress) //read code size of external contract.
            outputByteArray := mload(0x40) //output-byte-array allocation. 0x40 is free memory pointer where from memory can be used.
            mstore(0x40, add(outputByteArray, and(add(add(extCodeSize, 32), 0x1f), not(0x1f)))) //find end of memory pointer including padding..
            mstore(outputByteArray, extCodeSize) //what is length of store in memory.
            extcodecopy(externalCodeAddress, add(outputByteArray, 32), 0, extCodeSize) //Now, get the external contract code
        }
    }
}
