/*
    @AUTHOR - Raj Jha & Harish Jaggi
*/
pragma solidity ^0.5.1;

/**
 * @title Insurance interface
 */
interface IInsurance {
    function approveInsurance() external returns (bool);
    function calculatePremium() external pure returns (string memory);
    function registerClaim() external returns (bool);
    function claimRelease() external returns (bool);
}