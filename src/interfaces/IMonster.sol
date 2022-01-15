// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

interface IMonster {
    function hitDie() external returns (uint8);

    function armorClass() external returns (uint8);

    function exp() external returns (uint256);

    function skills() external returns (bytes32[] memory);

    function senses() external returns (bytes32[] memory);

    function str() external returns (uint8);

    function dex() external returns (uint8);

    function con() external returns (uint8);

    function intel() external returns (uint8);

    function wis() external returns (uint8);

    function char() external returns (uint8);

    function speed() external returns (uint8);

    function size() external returns (bytes32);

    function languages() external returns (bytes32[] memory);

    function nerfHitDie(uint8) external;

    function nerfArmorClass(uint8) external;

    function nerfExp(uint256) external;

    function nerfSkills(bytes32[] memory) external;

    function nerfSpells(bytes32[] memory) external;

    function nerfSenses(bytes32[] memory) external;

    function nerfStr(uint8) external;

    function nerfDex(uint8) external;

    function nerfCon(uint8) external;

    function nerfIntel(uint8) external;

    function nerfWis(uint8) external;

    function nerfChar(uint8) external;

    function nerfSpeed(uint8) external;

    function nerfSize(bytes32) external;

    function nerfLanguages(bytes32[] memory) external;
}
