pragma solidity ^0.5.1;
contract EmrPatients{
    // this is the CONSTRUCTOR it gets called ONCE only when contract is first deployed
    constructor() public {  
    //do nothing for now!!
    }
    //define mapping to store key-value pairs.
    mapping(string => medicalRecord) patientRecordMapping;
    
    
    //organize medical records using struct
    struct medicalRecord
    {
        string report_name;
        address owner;
    }
    //Save medical record
    function saveMedicalReport(string memory mr_number, string memory report_name, address p_addr) public payable  {
        patientRecordMapping[mr_number] = medicalRecord(report_name, p_addr);
    }

    function getReportByMedicalRecordNumber(string memory mr_number) public view returns (string memory, address) {
        return (patientRecordMapping[mr_number].report_name, patientRecordMapping[mr_number].owner);
    }
}
