/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;
//Create cars based on customer customization and default options.
contract CustomerCustomizationForCar {
    //Enum assignment
    enum WheelsChoices { Alloy,Steel} //available wheels options.
    enum ColorChoices { red,blue,orange,gray,white,yellow }//available color options
    enum RoofChoices { Hardtops,Sunroofs,Ttops,Targa,Vinyl} //available roof options

    WheelsChoices constant defaultWheel = WheelsChoices.Steel; //default car wheel.
    ColorChoices constant defaultColor = ColorChoices.red; //defualt car color.
    RoofChoices constant defaultRoof = RoofChoices.Hardtops; //default car roof

    //create cars using struct. We will see Struct in further sections.
    struct CustomizedCar {
        string vin; //car identification number
        WheelsChoices wheel; //wheel choosen
        ColorChoices color; //color choosen
        RoofChoices roof; //roof choosen
    }
  
    mapping(string => CustomizedCar) customerCarMapping; //keep mapping of cars
    //create car with customer selected options.
    function createCustomizedCarForCustomer(string memory vin) public { //try any unique string as argument i.e ("111")
        customerCarMapping[vin] = CustomizedCar(vin,WheelsChoices.Steel,ColorChoices.yellow,RoofChoices.Vinyl);
    }
    
    //create car with default available options.
    function createDefaultCarForCustomer(string memory vin) public { //try any unique string as argument i.e ("222")
        customerCarMapping[vin] = CustomizedCar(vin,defaultWheel,defaultColor,defaultRoof);
    }
    
    //fetch back car information
    function getCar(string memory vin) public view returns (uint256,uint256,uint256) { //fetch using unique string i.e ("111") or ("222")
        //enum is convertible to integer.
        return (uint256(customerCarMapping[vin].wheel), uint256(customerCarMapping[vin].color),uint256(customerCarMapping[vin].roof));
    }
}
