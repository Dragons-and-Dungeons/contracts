// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

interface IRace {
    function str() external returns (int8);

    function dex() external returns (int8);

    function con() external returns (int8);

    function intel() external returns (int8);

    function wis() external returns (int8);

    function char() external returns (int8);

    function speed() external returns (uint8);

    function size() external returns (bytes32);

    function languages() external returns (bytes32[] memory);

    function nerfStr(int8) external;

    function nerfDex(int8) external;

    function nerfCon(int8) external;

    function nerfIntel(int8) external;

    function nerfWis(int8) external;

    function nerfChar(int8) external;

    function nerfSpeed(uint8) external;

    function nerfSize(bytes32) external;

    function nerfLanguages() external;

    function addLanguage(bytes32) external;
}
