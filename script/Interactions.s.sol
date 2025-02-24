// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {FundMe} from "../src/FundMe.sol";
import {Script, console} from "lib/forge-std/src/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function fundfundMe(address mostRecentlyDeployed) public {
        FundMe(payable(mostRecentlyDeployed)).fund{value: SEND_VALUE};

        console.log("Funded FundMe with %s", SEND_VALUE);
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        vm.startBroadcast();
        fundfundMe(mostRecentlyDeployed);
        vm.stopBroadcast();
    }
}

contract WithDrawFundMe is Script {
    function withdrawFundMe(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentlyDeployed)).withdraw();
        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        withdrawFundMe(mostRecentlyDeployed);
    }
}

// Fund
// WithDraw
