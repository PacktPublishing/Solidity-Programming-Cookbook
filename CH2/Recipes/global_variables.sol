pragma solidity ^0.5.1;

contract globalVariables{
    function getBlockRelatedGlobalVariables() 
    public view 
    returns (address,uint,uint,uint,bytes32,uint){
        /*
        block.coinbase - get miner addrss for current block.
        block.difficulty - get difficulty of current block.
        block.gaslimit - gaslimit of current block.
        block.number - number of current block.
        block.blockhash - hash of block.
        block.timestamp - timestamp of current block.
        */
        bytes32 blockchash = blockhash(block.number);
        return (block.coinbase, block.difficulty, block.gaslimit, block.number, blockchash, block.timestamp);
    }

    function getMessageRelatedGlobalVariables() 
    public payable 
    returns (bytes memory,uint, address, uint){ //see output in Remix console.
        /*
        msg.data - calldata (complete).
        gasleft - Gas Remaining.Previously it was msg.gas.
        msg.sender - sender of message.
        msg.value - no. of wei sent with message.
        */
        uint gas_left = gasleft();
        return (msg.data, gas_left, msg.sender, msg.value); //see output in Remix console.
    }
    
    function getTxRelatedGlobalVariables() 
    public view 
    returns (uint, address){
        /*
        tx.gasprice - Transaction's gas price.
        tx.origin - message sender (full call chain)
        */
        return (tx.gasprice, tx.origin); //get miner addrss for current block.
    }

    function getOtherGlobalVariables() 
    public view 
    returns (uint, uint){
        /*
        address(this).balance - Balance of current contract.
        addr.balance - get balance of given ethereum account(addr).
        */
        return (address(this).balance, msg.sender.balance); //get miner addrss for current block.
    }


}