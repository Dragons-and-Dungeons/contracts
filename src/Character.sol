// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "solmate/tokens/ERC721.sol";

// handles nfts, rolls, stats of the character, also is the bridge to the other contracts
contract Character is ERC721 {
    struct Stats {
        uint8 hitDice;
        uint8 armorClass;
        uint8 str;
        uint8 dex;
        uint8 con;
        uint8 intel;
        uint8 wis;
        uint8 char;
    }

    uint256 public lastId = 0;
    mapping(uint256 => string) public characterData;
    mapping(uint256 => uint256) public characterExp;
    mapping(uint256 => Stats) public characterToStats;
    address public monsterContract;

    constructor(string memory _name, string memory _symbol, address _monster) ERC721(_name, _symbol) {
        monsterContract = _monster;
    }

    function tokenURI(uint256 id) public view override returns (string memory){
        return characterData[id];
    }

    function create(string memory _tokenURI, address _race, address _class) public {
        _mint(msg.sender, lastId);
        //TODO: add race and class
        Stats memory stats = Stats(12, 12, 15, 14, 13, 12, 10, 8);
        characterToStats[lastId] = stats;
        lastId++;
    }

    function loot(uint256 _characterID, uint256 _exp) external {
        require(msg.sender == monsterContract, "Not the monster contract");
        characterExp[_characterID] = characterExp[_characterID] + _exp;
    }

    function getStats(uint256 _characterID) public returns (uint8[8] memory){

        return ([characterToStats[_characterID].hitDice, characterToStats[_characterID].armorClass, characterToStats[_characterID].str, characterToStats[_characterID].dex, characterToStats[_characterID].con, characterToStats[_characterID].intel, characterToStats[_characterID].wis, characterToStats[_characterID].char]);
    }
}