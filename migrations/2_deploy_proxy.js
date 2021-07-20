const Dogs = artifacts.require("Dogs");
const DogsUpdated = artifacts.require("DogsUpdated");
const Proxy = artifacts.require("ProxyDogs");

module.exports = async function (deployer,network,accounts) {
  //deploy contracts  
  const dogs = await Dogs.new();
  const proxy = await Proxy.new(dogs.address);
  
  //Using proxy dog to fool truffle telling it that dogs is available at proxy.address
  var proxyDog = await Dogs.at(proxy.address);
  await proxyDog.setNumberOfDogs(10);
  
  // checking the functionality
  var dooo = await proxyDog.getNumberOfDogs();
  console.log("Before Update: " + dooo.toNumber());
  
  //updating the dogs functionality
  const dogsUpdated = await DogsUpdated.new();
  await proxy.upgrade(dogsUpdated.address);
  proxyDog = await DogsUpdated.at(proxy.address);
  
  dooo = await proxyDog.getNumberOfDogs();
  console.log("After update: " + dooo.toNumber());
 
  await proxyDog.initialize(accounts[0]);
  await proxyDog.setNumberOfDogs(23);
  dooo = await proxyDog.getNumberOfDogs();
  console.log("After set update: " + dooo.toNumber());
};
