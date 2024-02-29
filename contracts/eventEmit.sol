//SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;
contract EmittingEvents{

   mapping (address => uint) public balances;
   

  event deposit( address indexed reciever, uint ammount);

  event withdraw(address indexed owner, uint ammount);

   event transfer(address indexed owner, address indexed reciever, uint ammount );




   function Depositing( address _reciever, uint _amount) external payable {

               require( _reciever != address(0) , "can't transfer to a zero account");

               balances[_reciever] += _amount;
               
               emit deposit( _reciever, _amount);
   }





   function Withdrawing( address _owner, uint _ammount)external payable {
                  
               if( (balances[_owner]<0) && (balances[_owner]<= _ammount ) ){

                        revert("insufficient balance");
                }

               balances[_owner] -= _ammount;

               emit withdraw( _owner,  _ammount);
   }





   function tranferring(address _owner, address _reciever , uint _ammount)external payable {

               require( _reciever != address(0), "can't transfer to a zero account");

               require(balances[_owner] > _ammount, "insufficient balance");
               
               balances[_reciever] += _ammount;

               balances[_owner] -=  _ammount;

               emit transfer( _owner, _reciever, _ammount);
   }



function remainingBalance(address _owner)external view returns (uint){

   return balances[_owner];
}




}
