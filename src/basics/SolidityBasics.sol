// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Solidity Basics Example (with Custom Errors)
/// @notice Demonstrates key Solidity concepts for beginners, using modern error handling
contract SolidityBasics {
    // -------------------------
    // Custom Errors
    // -------------------------
    error NotOwner();
    error InvalidEtherAmount();
    error InsufficientBalance(uint256 requested, uint256 available);

    // -------------------------
    // State Variables
    // -------------------------
    string public message;
    uint256 public counter;
    uint8 private test;
    bool public isActive;
    address public owner;

    // -------------------------
    // Structs & Arrays
    // -------------------------
    struct User {
        string name;
        uint256 age;
        address account;
    }

    mapping(address => uint256) private valuesToBooleans;

    User[] public users;

    // -------------------------
    // Events
    // -------------------------
    event MessageUpdated(string oldMessage, string newMessage);
    event UserAdded(string name, uint256 age, address account);

    // -------------------------
    // Modifiers
    // -------------------------
    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    // -------------------------
    // Constructor
    // -------------------------
    constructor(string memory initialMessage) {
        message = initialMessage;
        owner = msg.sender;
        isActive = true;
        counter = 0;
    }

    // -------------------------
    // Functions
    // -------------------------

    /// @notice Update the message
    /// @param newMessage The new message string
    function updateMessage(string memory newMessage) public onlyOwner {
        string memory oldMessage = message;
        message = newMessage;

        emit MessageUpdated(oldMessage, newMessage);
    }

    /// @notice Increment counter by 1
    function incrementCounter() public {
        counter += 1;
    }

    /// @notice Add a new user
    function addUser(string memory name, uint256 age) public {
        users.push(User(name, age, msg.sender));
        emit UserAdded(name, age, msg.sender);
    }

    /// @notice Get total number of users
    function getUsersCount() public view returns (uint256) {
        return users.length;
    }

    function add(uint256 x, uint256 y) public pure returns (uint256) {
        return x + y;
    }

    /// @notice Example of sending Ether to contract
    function deposit() public payable {
        /* if (msg.value == 0) {
            revert InvalidEtherAmount();
        } */
        require(msg.value > 0, "Invalid Ether Amount");
        valuesToBooleans[msg.sender] = msg.value;
    }

    /// @notice Withdraw Ether (only owner)
    function withdraw(uint256 amount) public onlyOwner {
        uint256 balance = address(this).balance;
        uint256 amountDeposited = valuesToBooleans[msg.sender];
        if (amount > balance) revert InsufficientBalance(amount, balance);

        payable(owner).transfer(amount);
    }

    /// @notice Get contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {}

    fallback() external payable {}
}
