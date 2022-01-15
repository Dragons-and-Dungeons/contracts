// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "./interfaces/IClass.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract Barbarian is IClass, Ownable {

    int8 public hitDie = 12;
    bytes32[] private _primaryAbilities;
    bytes32[] private _savingThrows;
    bytes32[] private _proficiencies;
    bytes32[] private _skills;
    bytes32[] private _spells;

    constructor(address dm) {
        _primaryAbilities.push("str");
        _savingThrows.push("str");
        _savingThrows.push("con");
        _skills.push("rage");
        _skills.push("unarmored defense");
        _proficiencies.push("light armor");
        _proficiencies.push("medium armor");
        _proficiencies.push("shields");
        _proficiencies.push("simple weapons");
        _proficiencies.push("martial weapons");

        transferOwnership(dm);
    }

    function savingThrows() external returns (bytes32[] memory) {
        return _savingThrows;
    }

    function primaryAbilities() external returns (bytes32[] memory) {
        return _primaryAbilities;
    }

    function proficiencies() external returns (bytes32[] memory) {
        return _proficiencies;
    }

    function skills() external returns (bytes32[] memory) {
        return _skills;
    }

    function spells() external returns (bytes32[] memory) {
        return _spells;
    }

    function nerfHitDie(int8 _hitDie) external {
        hitDie = _hitDie;
    }

    function nerfSavingThrows(bytes32[] memory newSavingThrows) external {
        _savingThrows = newSavingThrows;
    }

    function nerfPrimaryAbilities(bytes32[] memory newPrimaryAbilities) external {
        _primaryAbilities = newPrimaryAbilities;
    }

    function nerfProficiencies(bytes32[] memory newProficiencies) external {
        _proficiencies = newProficiencies;
    }

    function nerfSkills(bytes32[] memory newSkills) external {
        _skills = newSkills;
    }

    function nerfSpells(bytes32[] memory newSpells) external {
        _spells = newSpells;
    }
}