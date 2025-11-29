// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SomeContract {
    mapping(address => uint256) public balances;

    // Deposit Ether into the contract
    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    // BAD Practice !!!!!!
    /* function withdraw(uint256 _amount) external {
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        // Send Ether to the caller
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transfer failed");

        // Update the balance AFTER sending (vulnerability!)
        balances[msg.sender] -= _amount;
    } */


    // Withdraw Ether from the contract
    // Follows CEI Pattern (Checks, Effects, Interactions)
    function withdraw(uint256 _amount) external {
        // Check
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        // Update the balance BEFORE sending (Effect)
        balances[msg.sender] -= _amount;

        // Send Ether to the caller (Interaction)
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transfer failed");
    }

    // Check contract balance
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
