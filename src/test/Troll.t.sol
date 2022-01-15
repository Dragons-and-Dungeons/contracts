// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../monsters/Troll.sol";

contract TrollTest is DSTest {
    Troll troll;

    function setUp() public {
        troll = new Troll(address(this));
    }

    function testParameters() public {
        assertEq(address(this), troll.owner());
        assertEq(troll.hitDie(), 84);
        assertEq(troll.armorClass(), 15);
        assertEq(troll.exp(), 1800);
        assertEq(troll.str(), 18);
        assertEq(troll.dex(), 13);
        assertEq(troll.con(), 20);
        assertEq(troll.intel(), 7);
        assertEq(troll.wis(), 9);
        assertEq(troll.char(), 7);
        assertEq(troll.speed(), 30);
        assertEq(troll.size(), "large");
        assertEq(troll.languages()[0], "giant");
        assertEq(troll.skills()[0], "multiattack");
        assertEq(troll.skills()[1], "bite");
        assertEq(troll.skills()[2], "claw");
        assertEq(troll.skills()[3], "keen smell");
        assertEq(troll.skills()[4], "regeneration");
        assertEq(troll.senses()[0], "darkvision 60 ft.");
        assertEq(troll.senses()[1], "passive perception 12");
    }

    function testNerfHitDie(uint8 hitDie) public {
        troll.nerfHitDie(hitDie);
        assertEq(hitDie, troll.hitDie());
    }

    function testNerfArmorClass(uint8 armorClass) public {
        troll.nerfArmorClass(armorClass);
        assertEq(armorClass, troll.armorClass());
    }

    function testNerfExp(uint8 exp) public {
        troll.nerfExp(exp);
        assertEq(exp, troll.exp());
    }

    function testNerfSkills(bytes32 skill) public {
        bytes32[] memory newSkills = new bytes32[](1);
        newSkills[0] = skill;
        troll.nerfSkills(newSkills);
        assertEq(newSkills[0], troll.skills()[0]);
    }

    function testNerfSpells(bytes32 spell) public {
        bytes32[] memory newSpells = new bytes32[](1);
        newSpells[0] = spell;
        troll.nerfSpells(newSpells);
        assertEq(newSpells[0], troll.spells()[0]);
    }

    function testNerfSenses(bytes32 sense) public {
        bytes32[] memory newSense = new bytes32[](1);
        newSense[0] = sense;
        troll.nerfSenses(newSense);
        assertEq(newSense[0], troll.senses()[0]);
    }
    // TODO: test calls by not owners
}
