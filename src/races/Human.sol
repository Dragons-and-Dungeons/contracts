// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "../interfaces/IRace.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract Human is IRace, Ownable {
    int8 public str = 1;
    int8 public dex = 1;
    int8 public con = 1;
    int8 public intel = 1;
    int8 public wis = 1;
    int8 public char = 1;
    uint8 public speed = 30;
    bytes32 public size = "medium";
    bytes32[] private _languages;

    constructor(address dm) {
        _languages.push(("common"));
        transferOwnership(dm);
    }

    function languages() external returns (bytes32[] memory) {
        return _languages;
    }

    function nerfStr(int8 _str) external onlyOwner {
        str = _str;
    }

    function nerfDex(int8 _dex) external onlyOwner {
        dex = _dex;
    }

    function nerfCon(int8 _con) external onlyOwner {
        con = _con;
    }

    function nerfIntel(int8 _intel) external onlyOwner {
        intel = _intel;
    }

    function nerfWis(int8 _wis) external onlyOwner {
        wis = _wis;
    }

    function nerfChar(int8 _char) external onlyOwner {
        char = _char;
    }

    function nerfSpeed(uint8 _speed) external onlyOwner {
        speed = _speed;
    }

    function nerfSize(bytes32 _size) external onlyOwner {
        size = _size;
    }

    function nerfLanguages(bytes32[] memory newLanguages) external onlyOwner {
       _languages =newLanguages;
    }
}
