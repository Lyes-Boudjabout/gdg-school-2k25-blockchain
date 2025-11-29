// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {FavoriteColorVote} from "../src/VoteFavouriteColor.sol";

contract DeployContract is Script {
    FavoriteColorVote favouriteColorVote;

    function run() public {
        vm.startBroadcast();
        favouriteColorVote = new FavoriteColorVote();
        vm.stopBroadcast();
    }
}
