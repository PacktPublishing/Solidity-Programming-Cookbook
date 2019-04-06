pragma solidity ^0.5.1;

//Last-in first-out implementation.
contract StackLIFO {
    uint[] stack; //dynamic sized stack
    
    //put uint elements in array.
    function push(uint data) public {
        stack.push(data);
    }

    function pop() public returns (uint data) {
        require(stack.length > 0); //if stack is empty then do not try pop.
        data = stack[stack.length - 1];
        //delete pop element. Although this line is not required. Last line will do delete element as well with decreasing array size.
        delete stack[stack.length - 1]; 
        stack.length -= 1; //decrease array length by 1. 
    }
    //fetch stack everytime to see push pop after results.
    function getStack() public view returns (uint[] memory){
        return stack;
    }
}