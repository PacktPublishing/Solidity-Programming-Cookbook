pragma solidity ^0.5.1;
/*though this is not very optimized way to implement queue. 
But for practice solidity exersise it is good choice.*/

//first in first out. Implemented this using mapping
contract QueueFIFO {
    mapping(uint256 => uint) queue; //mapping based queue.
    uint256 first = 1;
    uint256 last = 0;
    //enqueue uint
    function enqueue(uint data) public {
        last += 1;
        queue[last] = data;
    }
    //dequeue uint
    function dequeue() public returns (uint data) {
        require(last >= first);  // to check non-empty queue

        data = queue[first];

        delete queue[first];
        first += 1;
    }
}