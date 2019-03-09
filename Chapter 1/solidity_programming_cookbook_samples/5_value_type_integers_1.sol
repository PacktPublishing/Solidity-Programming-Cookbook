/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
contract SecureIntegerFlow {
    mapping (address => uint256) public balanceOf;

    // SECURE
    function transfer(address _to, uint256 _value) { //Trt arguments (0xca35b7d915458ef540ade6068dfe2f44e8fa733c,200) on remix.
    /* Check if sender has balance 
      Thank god no overflow and underflow here.
    */
    require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]); 
    /* balance adjustments*/ 
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
}
}

