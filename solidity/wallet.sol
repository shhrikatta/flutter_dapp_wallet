//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.5.0 <0.9.0;

contract Wallet {
    uint balance;

    function getBalance() public view returns(uint) {
        return balance;
    }

    function dedosit(uint amount) public {
        balance = balance + amount;
    }

    function withdraw(uint amount) public {
        balance = balance - amount;
    }

}