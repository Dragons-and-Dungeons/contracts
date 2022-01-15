// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;
//TODO: instead of bytes32 should be NFTs

interface IClass {
    function hitDie() external returns (int8);

    function savingThrows() external returns (bytes32[] memory);

    function primaryAbilities() external returns (bytes32[] memory);

    function proficiencies() external returns (bytes32[] memory);

    function skills() external returns (bytes32[] memory);

    function spells() external returns (bytes32[] memory);

    function nerfHitDie(int8) external;

    function nerfSavingThrows(bytes32[] memory) external;

    function nerfPrimaryAbilities(bytes32[] memory) external;

    function nerfProficiencies(bytes32[] memory) external;

    function nerfSkills(bytes32[] memory) external;

    function nerfSpells(bytes32[] memory) external;
}
