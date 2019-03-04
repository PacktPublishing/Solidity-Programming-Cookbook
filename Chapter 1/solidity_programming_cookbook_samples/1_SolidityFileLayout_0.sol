/*
    @AUTHOR - Raj Jha & Harish Jaggi
    @INFO - Top level declaration in solidity file.
*/
pragma solidity ^0.4.23; //To indicate that this source code is not intended to be compiled with a compiler earlier than version 0.4.23 and with 0.5.0 and higher (this second condition is added by using ^).
pragma solidity >=0.4.23 < 0.6.0; //To indicate that this source code will work with compiler version 0.4.23 and above but not work if version 0.6.0 and above. 
pragma solidity 0.4.23; //To lock the contract compiler for 0.4.23. 

//will import all symbols from "otherfile" into the current global scope.
import "otherfile.sol";
//Creates a new global symbol customSymbolName whose members are all symbols from " otherfile.sol". 
import * as symbolName from "otherfile.sol";
//creates new global symbols alias and symbol2 which reference symbol1 and symbal2 from "otherfile.sol", respectively. 
import {symbol1 as alias, symbol2} from "otherfile.sol" 
//same as import * as symbolName from "otherfile.sol";
import "otherfile.sol" as symbolName; 

//Other import examples:
//importing contract from other folder path.
import "other_folder/another_test.sol";
//import from npm package folder 
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

//Importing from 
import "https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/ownership/Ownable.sol";
import "git://github.com/<path>";
import "github.com/<path>";

//Example code to understand use of Import statement.
//npm install openzeppelin-solidity
pragma solidity ^0.4.23;
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
contract ExampleToken is ERC20, ERC20Detailed {};

//This is single line comment.
/*this is multi
  line comment */