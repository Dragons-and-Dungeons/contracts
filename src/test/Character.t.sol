// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Character.sol";
import "../Human.sol";
import "../Barbarian.sol";

contract CharacterTest is DSTest {
    Character character;
    Human human = new Human(address(this));
    Barbarian barbarian = new Barbarian(address(this));

    function setUp() public {
        character = new Character();
    }

        function testCreateCharacter() public {
//            character.create(
//                "Bigby",
//                "male",
//                "eip155:100/erc721:0xCF964c89f509a8c0Ac36391c5460dF94B91daba5/36758",
//                address(human),
//                address(barbarian),
//                "IPFS/HASH"
//            );
            // Bonds, Personality Traits, Ideals, Flaws, Alignment, Background; should be saved on ipfs

            // Checks values
            // Race should be it's own contract and add bonuses,
            // Class should be a contract
        }
    //
    //    function testSetAbilities() public {
    //        character.setAbilities(1, 15, 14, 13, 12, 10, 8);
    //        // Check values
    //    }
}
