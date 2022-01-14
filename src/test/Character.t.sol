// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Character.sol";

contract CharacterTest is DSTest {
    Character character;

    function setUp() public {
        character = new Character();
    }

    //    function testCreateCharacter() public {
    //        character.create(
    //            "Bigby",
    //            "male",
    //            "eip155:1/erc721:0x0d8c864DA1985525e0af0acBEEF6562881827bd5/197",
    //            "Human",
    //            "Wizard",
    //            "IPFS/HASH"
    //        );
    //        // Bonds, Personality Traits, Ideals, Flaws, Alignment, Background; should be saved on ipfs
    //
    //        // Checks values
    //        // Race should be it's own contract and add bonuses,
    //        // Class should be a contract
    //    }
    //
    //    function testSetAbilities() public {
    //        character.setAbilities(1, 15, 14, 13, 12, 10, 8);
    //        // Check values
    //    }
}
