const GeneralAgent = artifacts.require("GeneralAgent");

module.exports = function(deployer) {
  deployer.deploy(GeneralAgent);
};