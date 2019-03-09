/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
contract IntegerOverFlow {
    mapping (address => uint256) public balanceOf;

    // INSECURE
    function transfer(address _to, uint256 _value) public { //Trt arguments (0xca35b7d915458ef540ade6068dfe2f44e8fa733c,200) on remix.
        balanceOf[msg.sender] = 100; //set balance of code executer address to 100.
        /* Check if sender has balance 
        can cause integer overflow. balances[msg.sender] – _value >= 0 condition 
        is always satisfied because uint minus uint operation always results uint and 
        uint is always greater or equal to 0.

        We have set sender address balance to 100. And we require to check that transfer occour only
        when sender has sufficient balance to send money i.e balanceOf[msg.sender] - _value >= 0. But due to interger overflow 
        reasons that we explained above condition balanceOf[msg.sender] - _value >= 0 is always true. Thus sender can transfer 
        any amount to destination address.
        */
        require(balanceOf[msg.sender] - _value >= 0);  //this line of code can create disaster.
        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
}


