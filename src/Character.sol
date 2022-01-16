// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "solmate/tokens/ERC721.sol";

// handles nfts, rolls, stats of the character, also is the bridge to the other contracts
contract Character is ERC721 {
    uint256 public lastId = 0;
    mapping(uint256 => string) public characterData;
    mapping(uint256 => uint256) public characterExp;
    address public monsterContract;
    constructor(string memory _name, string memory _symbol, address _monster) ERC721(_name, _symbol) {
        monsterContract = _monster;
    }

    function tokenURI(uint256 id) public view override returns (string memory){
        return characterData[id];
    }

    function create(string memory _tokenURI, address _race, address _class) public {
        _mint(msg.sender, lastId);
        lastId++;
    }

    function loot(uint256 _characterID, uint256 _exp) external {
        require(msg.sender == monsterContract, "Not the monster contract");
        characterExp[_characterID] = characterExp[_characterID] + _exp;
    }
}