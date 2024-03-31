//SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {HorseStore} from "../../src/horseStoreV1/HorseStore.sol";
import {IHorseStore} from "../../src/horseStoreV1/IHorseStore.sol";

abstract contract Base_TestV1 is Test{

    IHorseStore horseStore;

    function setUp() public virtual{
        horseStore = IHorseStore(address(new HorseStore()));
    }

    function testReadValue() public{
        uint256 initialValue = horseStore.readNumberOfHorses();
        assertEq(0, initialValue);
    }
    function testWriteValue() public{
        uint256 writeValue = 777;
        horseStore.updateHorseNumber(writeValue);
        assertEq(writeValue, horseStore.readNumberOfHorses());  
        }
}
