const CompileTimeError = artifacts.require("Contract1");
const RunTimeError = artifacts.require("Contract2");
const LogicalError = artifacts.require("Contract3");

module.exports = function(deployer) {
  deployer.deploy(CompileTimeError);
  deployer.deploy(RunTimeError);
  deployer.deploy(LogicalError);
};
