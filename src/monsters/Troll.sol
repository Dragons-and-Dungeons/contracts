// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "../interfaces/IMonster.sol";

contract Troll is IMonster, Ownable {
    uint8 public hitDie = 84;
    uint8 public armorClass = 15;
    uint256 public exp = 1800;
    uint8 public str = 18;
    uint8 public dex = 13;
    uint8 public con = 20;
    uint8 public intel = 7;
    uint8 public wis = 9;
    uint8 public char = 7;
    uint8 public speed = 30;
    bytes32 public size = "large";
    bytes32[] private _languages;
    bytes32[] private _skills;
    bytes32[] private _spells;
    bytes32[] private _senses;

    constructor(address dm) {
        _languages.push("giant");
        _skills.push("multiattack");
        _skills.push("bite");
        _skills.push("claw");
        _skills.push("keen smell");
        _skills.push("regeneration");
        _senses.push("darkvision 60 ft.");
        _senses.push("passive perception 12");
        transferOwnership(dm);
    }

    function languages() external returns (bytes32[] memory) {
        return _languages;
    }

    function skills() external returns (bytes32[] memory) {
        return _skills;
    }

    function spells() external returns (bytes32[] memory) {
        return _spells;
    }

    function senses() external returns (bytes32[] memory) {
        return _senses;
    }

    function nerfHitDie(uint8 _hitDie) external onlyOwner {
        hitDie = _hitDie;
    }

    function nerfArmorClass(uint8 _armorClass) external onlyOwner {
        armorClass = _armorClass;
    }

    function nerfExp(uint256 _exp) external onlyOwner {
        exp = _exp;
    }

    function nerfStr(uint8 _str) external onlyOwner {
        str = _str;
    }

    function nerfDex(uint8 _dex) external onlyOwner {
        dex = _dex;
    }

    function nerfCon(uint8 _con) external onlyOwner {
        con = _con;
    }

    function nerfIntel(uint8 _intel) external onlyOwner {
        intel = _intel;
    }

    function nerfWis(uint8 _wis) external onlyOwner {
        wis = _wis;
    }

    function nerfChar(uint8 _char) external onlyOwner {
        char = _char;
    }

    function nerfSpeed(uint8 _speed) external onlyOwner {
        speed = _speed;
    }

    function nerfSize(bytes32 _size) external onlyOwner {
        size = _size;
    }

    function nerfLanguages(bytes32[] memory newLanguages) external onlyOwner {
        _languages = newLanguages;
    }

    function nerfSkills(bytes32[] memory newSkills) external {
        _skills = newSkills;
    }

    function nerfSpells(bytes32[] memory newSpells) external {
        _spells = newSpells;
    }

    function nerfSenses(bytes32[] memory newSenses) external {
        _senses = newSenses;
    }
}
