// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Monster.sol";
import "../monsters/Troll.sol";

contract MonsterTest is DSTest {
    Monster monster;
    Troll troll = new Troll(address(this));

    function setUp() public {
        monster = new Monster("Monster", "MON", address(this));
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

        monster.create("QmXYAaJ9pvqWDDVbrqGuEfrSyktKppxLA7kFtiwt9rpiiL", address(troll));

        assertEq(monster.balanceOf(address(this)), 2);
        assertEq(monster.ownerOf(1), address(this));
        assertEq(monster.lastId(), 2);

        // Checks values
        // Race should be it's own contract and add bonuses,
    }
    //
    //    function testSetAbilities() public {
    //        monster.setAbilities(1, 15, 14, 13, 12, 10, 8);
    //        // Check values
    //    }
}
