var Users = artifacts.require("./Users.sol");
var CryptoLoveLetter = artifacts.require("./CryptoLoveLetter.sol");

module.exports = function(deployer) {
  deployer.deploy(Users);
  deployer.deploy(CryptoLoveLetter);
};
