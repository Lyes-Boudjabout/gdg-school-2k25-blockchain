// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {Test} from "forge-std/Test.sol";
import {FavoriteColorVote} from "../src/VoteFavouriteColor.sol";

contract TestContract is Test {
    FavoriteColorVote favouriteColorVote;
    address account = makeAddr("account");
    address deployer = makeAddr("deployer");

    error OwnableUnauthorizedAccount();
    error FavoriteColorVote__NotOwner();

    function setUp() external {
        vm.startBroadcast(deployer);
        favouriteColorVote = new FavoriteColorVote();
        vm.stopBroadcast();
    }

    function testTxRevertOnDoubleVote() public {
        vm.prank(account);
        favouriteColorVote.vote("Red");

        vm.prank(account);
        vm.expectRevert();
        favouriteColorVote.vote("Yellow");
    }

    function testOnlyOwnerCanCallGetWinner() public {
        vm.startPrank(account);
        vm.expectRevert(abi.encodeWithSelector(FavoriteColorVote__NotOwner.selector));
        (string memory color, uint voteCount) = favouriteColorVote.getWinner();
        vm.stopPrank();
    }

    function testIsNumberSeven(uint value) public {

        vm.prank(account);
        vm.expectRevert();
        favouriteColorVote.isNotNumberSeven(value);
    }
}