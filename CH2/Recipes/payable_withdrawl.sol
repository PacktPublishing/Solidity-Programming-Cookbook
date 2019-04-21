pragma solidity ^0.5.1;
contract myGame {
    uint fixhighestScore = 100; //highest score is 100. So players has to be score above it to win.
    mapping (address => uint256) public rewards;
    constructor () public payable{} //payable constructor.

    function play(uint score, address payable contractAddr) external payable { //external play function
        if(score >= fixhighestScore){
            //instead push transfer just record here and allow recipients to pull using withdrawReward function.
            rewards[contractAddr] = msg.value; 
        }
    }
    
    function withdrawReward(address payable _toReward) external payable { //withdraw function
        uint reward = rewards[_toReward];
        rewards[_toReward] = 0;
        _toReward.transfer(reward);
    }
    
    function () external payable{ //payable fallback function.
        
    }
}


contract Player1{
    myGame mg;
    constructor (address payable _mg) public payable{ //payable constructor.
        mg = myGame(_mg); //initialize myGame contract inside this contract.
    }
    
    function playGame(uint score) public payable { //call of function from myGame external contract.
        mg.play.value(msg.value)(score,address(this));
    }
    
    function getRewardAmount() public payable { //pull reward amount
        mg.withdrawReward.value(msg.value)(address(this));
    }
    
    function chkBalance() public view returns (uint256){ //balance of palyer1 contract
        return address(this).balance;
    }
    
    function () external payable{ //payable fallback function.
        // revert(); //case when external call fail due to milicious contract who throws error in fallback function. Due to that
        //every transfer to this contract will fail and cause transaction amount loss to account who triggred transaction.
    }
}