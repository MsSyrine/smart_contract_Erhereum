const ApprovalContract = artifacts.require('ApprovalContract.sol');

contract('ApprovalContract',function (accounts){
it('initiates contract', async function(){
  const contract = await ApprovalContract.deployed();
  const approver = await contract.approver.call();
  assert.equal(approver, 0x31C99b4163E8b6E5D9E52e862AcB8B069E5A628B , "approvers don't match");
})  ;

 it('takes a deposit',async function(){
   const contract=await ApprovalContract.deployed();
  await contract.deposit(accounts[0],{value: 1e+18, from: accounts[1]});

const balance = await web3.eth.getBalance(contract.address);
const expected = web3.utils.toBN(1e+18);
assert.equal(balance.toString(), expected.toString(), "amount did not match");
 });
});
