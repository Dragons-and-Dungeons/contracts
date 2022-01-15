// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Barbarian.sol";

contract BarbarianTest is DSTest {
    Barbarian barbarian;

    function setUp() public {
        barbarian = new Barbarian(address(this));
    }

    function testParameters() public {
        assertEq(address(this), barbarian.owner());
        assertEq(barbarian.primaryAbilities()[0], "str");
        assertEq(barbarian.savingThrows()[0], "str");
        assertEq(barbarian.savingThrows()[1], "con");
        assertEq(barbarian.skills()[0], "rage");
        assertEq(barbarian.skills()[1], "unarmored defense");
        assertEq(barbarian.proficiencies()[0], "light armor");
        assertEq(barbarian.proficiencies()[1], "medium armor");
        assertEq(barbarian.proficiencies()[2], "shields");
        assertEq(barbarian.proficiencies()[3], "simple weapons");
        assertEq(barbarian.proficiencies()[4], "martial weapons");
    }

    function testNerfHitDie(int8 hitDie) public {
        barbarian.nerfHitDie(hitDie);
        assertEq(hitDie, barbarian.hitDie());
    }

    function testNerfSpells(bytes32 spell) public {
        bytes32[] memory newSpells = new bytes32[](1);
        newSpells[0] = spell;
        barbarian.nerfSpells(newSpells);
        assertEq(newSpells[0], barbarian.spells()[0]);
    }
    // TODO: test calls by not owners
}
