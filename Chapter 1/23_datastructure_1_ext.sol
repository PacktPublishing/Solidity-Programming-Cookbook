pragma solidity ^0.5.1;
contract DonationManager{
    // this is the CONSTRUCTOR it gets called ONCE only when contract is first deployed
    constructor() public {  
    //do nothing for now!!
    }
    //define mapping to store key-value pairs. We can not traverse mapping so use in-combination of array.
    mapping(address => uint) donarAmountMapping;
    //array to store index of mapping data structure.
    address[] allDoners;
    
    //Save donations from different addresses. Though No duplicacy check here.
    function getDonations(address donar, uint amount) public payable  {
        donarAmountMapping[donar] = amount;
        allDoners.push(donar);
    }

    function iterateMapping() public view returns (uint) {
        uint totalDonation = 0; //reset old value because everytime we need total count by traversing all donars.
        for (uint i=0; i < allDoners.length; i++) {
            totalDonation += donarAmountMapping[allDoners[i]];
        }
        return totalDonation;
    }

    //this function will do nothing just do some math with arguments/parameters.
    function calculateAmountAfterExpenses(uint amount, uint expense1, uint expense2) public pure returns(uint){
        return amount = amount - (expense1 + expense2);
    }
}
