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
        character = new Character("Character", "D&D");
    }

    function testParams() public {
        assertEq(character.name(), "Character");
        assertEq(character.symbol(),"D&D");
    }

    function testCreate() public {
        assertEq(character.lastId(), 0);
        character.create(
            "QmcoHdzc6E8aYCUM8Q3KEvHycgEHqEzpwJyXwnHU9ShzFv",
            address(human),
            address(barbarian)
        );

        assertEq(character.balanceOf(address(this)),1);
        assertEq(character.ownerOf(0),address(this));
        assertEq(character.lastId(), 1);

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
