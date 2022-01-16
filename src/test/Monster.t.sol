// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Monster.sol";
import "../monsters/Troll.sol";
import "../races/Human.sol";
import "../classes/Barbarian.sol";
import "../Character.sol";

contract MonsterTest is DSTest {
    Monster monster;
    Troll troll = new Troll(address(this));


    Human human = new Human(address(this));
    Barbarian barbarian = new Barbarian(address(this));
    Character character;

    function setUp() public {
        monster = new Monster("Monster", "MON", address(this));
        character = new Character("Character", "D&D", address(monster));
    }

    function testParams() public {
        assertEq(monster.name(), "Monster");
        assertEq(monster.symbol(), "MON");
    }

    function testCreate() public {
        assertEq(monster.lastId(), 0);
        monster.create(
            "QmXYAaJ9pvqWDDVbrqGuEfrSyktKppxLA7kFtiwt9rpiiL",
            address(troll)
        );

        assertEq(monster.balanceOf(address(this)), 1);
        assertEq(monster.ownerOf(0), address(this));
        assertEq(monster.lastId(), 1);
        assertEq(monster.idToMonster(0), address(troll));

        monster.create("QmXYAaJ9pvqWDDVbrqGuEfrSyktKppxLA7kFtiwt9rpiiL", address(troll));

        assertEq(monster.balanceOf(address(this)), 2);
        assertEq(monster.ownerOf(1), address(this));
        assertEq(monster.lastId(), 2);
        assertEq(monster.idToMonster(1), address(troll));
        // Checks values
        // Race should be it's own contract and add bonuses,
    }

    function testSetCharacter(address _character) public {
        monster.setCharacter(_character);
        assertEq(monster.characterContract(),_character);
    }

    function testKill() public {
        monster.setCharacter(address(character));

        monster.create(
            "QmXYAaJ9pvqWDDVbrqGuEfrSyktKppxLA7kFtiwt9rpiiL",
            address(troll)
        );

        character.create(
            "QmcoHdzc6E8aYCUM8Q3KEvHycgEHqEzpwJyXwnHU9ShzFv",
            address(human),
            address(barbarian)
        );

        monster.kill(0, 0);
        assertEq(monster.balanceOf(address(this)), 0);
        assertEq(character.characterExp(0), troll.exp());
    }
}
