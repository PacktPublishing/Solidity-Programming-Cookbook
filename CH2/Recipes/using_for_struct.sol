/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
library structLib {
    struct Container { mapping(uint => bool) items; } //our items struct

    function insert(Container storage self, uint value) public returns (bool) //
    {
        if (self.items[value])
            return false; // if already present
        self.items[value] = true; //insert in struct and return true.
        return true;
    }

    function contains(Container storage self, uint value) public view returns (bool)
    {
        return self.items[value]; //check item in items list.
    }
}


contract structOperations{
   using structLib for structLib.Container; // using for struct
    structLib.Container items; //make items as struct
    //test-data - (80)
    function pushItems(uint value) public {
        require(items.insert(value)); //insert in struct
    }
     //test-data - (80)
     function checkItems(uint value) public view returns (bool) {
        return items.contains(value); //check item in items.
    }
    
}

