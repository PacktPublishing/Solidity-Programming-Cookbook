pragma solidity ^0.5.1;
contract IntegerOverFlow {
    mapping (address => uint256) public balanceOf;

    // INSECURE
    function transfer(address _to, uint256 _value) public {
    /* Check if sender has balance 
    
    can cause integer overflow. balances[msg.sender] – _value >= 0 condition 
    is always satisfied because unit minus unit operation produces unit and 
    unit is always greater or equal to 0.
    
    */
    require(balanceOf[msg.sender] >= _value); 
    /* Add and subtract new balances */
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    }
}

