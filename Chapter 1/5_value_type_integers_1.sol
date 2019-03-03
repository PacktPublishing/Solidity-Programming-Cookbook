pragma solidity ^0.5.1;
contract IntegerNoOverFlow {
    mapping (address => uint256) public balanceOf;

    // SECURE
    function transfer(address _to, uint256 _value) {
    /* Check if sender has balance 
      Thankgod no overflow here.
    */
    require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]); 
    /* Add and subtract new balances */
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
}
}
