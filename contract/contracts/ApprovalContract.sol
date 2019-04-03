pragma solidity ^0.5.0;

contract ApprovalContract {
address public sender;
address  payable public receiver;
address public constant approver= 0x31C99b4163E8b6E5D9E52e862AcB8B069E5A628B ;

function deposit(address  payable  _receiver) external payable {
  require(msg.value > 0); // the ether value must be positive while paying
  sender = msg.sender;// will be saved in the smart ApprovalContract
  receiver =_receiver;

}

function viewApprover() external pure returns(address){
  return (approver);
}
//external do not cost gas
function approve() external {
  require(msg.sender == approver );
  receiver.transfer(address(this).balance);//return the balance and sends it to the receipient
  //transfer or send method to send the money
  //transfer will throw an error ?
  //we call on the account where the money is being transfered to

}

}
