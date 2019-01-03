pragma solidity ^0.5.0;

contract Payment {
  address transferFrom;
  address payable transferTo;

  constructor() public {
    transferFrom = msg.sender;
  }

  event TransferFund(address _transferTo, address _transferFrom, uint amount);

  function transferFund( address payable _transferTo ) public payable returns (bool){
      transferTo = _transferTo;

      transferTo.transfer(msg.value);

      emit TransferFund(transferTo, transferFrom, msg.value);

      return true;
  }

  function getBalanceOfCurrentAccount() public payable returns (uint) {
    return transferFrom.balance;
  }

}
