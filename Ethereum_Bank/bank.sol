// SPDX-License-Identifier: MIT
pragma solidity  >=0.4.22 <0.7.0;

contract banking{

  mapping(address=>uint) public userAccount;

  
  function deposit() public payable{
      require(msg.value>0, 'Value for deposit is Zero');
      userAccount[msg.sender] = userAccount[msg.sender]+msg.value;
  }
  
  function withdraw(uint amount) public payable returns(string memory){
      require(userAccount[msg.sender]>amount, 'insufficeint balance in Bank account');
      require(amount>0, 'Enter non-zero value for withdrawal');
      userAccount[msg.sender]=userAccount[msg.sender]-amount;
      msg.sender.transfer(amount);
      return 'withdrawal Succesful';
  }
  
  function getbalance() public view returns(uint){
      return userAccount[msg.sender];
  }
  
  
}
