// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Human.sol";

contract HumanTest is DSTest {
    Human human;

    function setUp() public {
        human = new Human(address(this));
    }

    function testParameters() public {
        assertEq(address(this), human.owner());
        assertEq(human.str(), 1);
        assertEq(human.dex(), 1);
        assertEq(human.con(), 1);
        assertEq(human.intel(), 1);
        assertEq(human.wis(), 1);
        assertEq(human.char(), 1);
        assertEq(human.speed(), 30);
        assertEq(human.size(), "medium");
        assertEq(human.languages()[0], "common");
    }

    function testNerfStr(int8 str) public {
        human.nerfStr(str);
        assertEq(str, human.str());
    }

    function testNerfDex(int8 dex) public {
        human.nerfDex(dex);
        assertEq(dex, human.dex());
    }

    function testNerfCon(int8 con) public {
        human.nerfCon(con);
        assertEq(con, human.con());
    }

    function testNerfIntel(int8 intel) public {
        human.nerfIntel(intel);
        assertEq(intel, human.intel());
    }

    function testNerfWis(int8 wis) public {
        human.nerfWis(wis);
        assertEq(wis, human.wis());
    }

    function testNerfChar(int8 char) public {
        human.nerfChar(char);
        assertEq(char, human.char());
    }

    function testNerfSpeed(uint8 speed) public {
        human.nerfSpeed(speed);
        assertEq(speed, human.speed());
    }

    function testNerfSize(bytes32 size) public {
        human.nerfSize(size);
        assertEq(size, human.size());
    }

    function testNerfLanguages() public {
        assertEq(human.languages().length, 1);
        human.nerfLanguages();
        assertEq(human.languages().length, 0);
    }

    function testAddLanguage(bytes32 language) public {
        human.addLanguage(language);
        assertEq(human.languages()[1], language);
        assertEq(human.languages().length, 2);
    }

    // TODO: test calls by not owners
}
