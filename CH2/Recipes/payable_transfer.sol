pragma solidity ^0.5.1;
contract myGame {
    uint fixhighestScore = 100; //highest score is 100. So players has to be score above it to win.
    
    constructor () public payable{} //payable constructor.

    function play(uint score, address payable contractAddr) external payable { //external play function
        if(score >= fixhighestScore){
            contractAddr.transfer(msg.value); // Transfer to Player1 contract address. No one else can play if this external call fails. 
        }
    }
    
    function chkBalanceOfAccount() public view returns (uint256){ //get balance of account using which we execute contract on Remix.
        return msg.sender.balance;
    }
    
    function () external payable{ //payable fallback function.
        
    }
}


contract Player1{
    myGame mg;
    constructor (address payable _mg) public payable{ //payable constructor.
        mg = myGame(_mg); //initialize myGame contract inside this contract.
    }
    
    //test data - (200)
    function playGame(uint score) public payable { //call of function from myGame external contract.
        mg.play.value(msg.value)(score,address(this));
    }
    
    function chkBalance() public view returns (uint256){ //balance of palyer1 contract
        return address(this).balance;
    }
    
    function () external payable{ //payable fallback function.
        //nothing is here.
    }
}


contract Player2{
    myGame mg;
    constructor (address payable _mg) public payable{ //payable constructor.
        mg = myGame(_mg); //initialize myGame contract inside this contract.
    }
    
    function playGame(uint score) public payable { //call of function from myGame external contract.
        mg.play.value(msg.value)(score,address(this));
    }
    
    function chkBalance() public view returns (uint256){ //balance of palyer1 contract
        return address(this).balance;
    }
    
    function () external payable{ //payable fallback function.
        /*
        case when external call fail due to milicious contract who throws error in fallback function. Due to that
        every transfer to this contract will fail and cause transaction amount loss to account who triggred transaction.
        */
        revert(); 
    }
}