// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Character.sol";

contract CharacterTest is DSTest {
    Character character;

    function setUp() public {
        character = new Character();
    }
}
