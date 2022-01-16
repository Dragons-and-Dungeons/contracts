// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "solmate/tokens/ERC721.sol";
import "./interfaces/IMonster.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

interface ICharacter {
    function loot(uint256, uint256) external;
}


// handles nfts, rolls, stats of the character, also is the bridge to the other contracts
contract Monster is ERC721, Ownable {
    uint256 public lastId = 0;
    mapping(uint256 => string) public monsterData;
    mapping(uint256 => address) public idToMonster;
    address public characterContract;

    constructor(string memory _name, string memory _symbol, address dm) ERC721(_name, _symbol) {
        transferOwnership(dm);
    }

    function tokenURI(uint256 id) public view override returns (string memory){
        return monsterData[id];
    }

    function create(string memory _tokenURI, address _race) onlyOwner public {
        _mint(msg.sender, lastId);
        idToMonster[lastId] = _race;
        lastId++;
    }

    function kill(uint256 _monsterID, uint256 _characterID) onlyOwner public {
        _burn(_monsterID);
        address monsterContract = idToMonster[_monsterID];
        ICharacter(characterContract).loot(_characterID, IMonster(monsterContract).exp());
    }

    function setCharacter(address _character) public {
        characterContract = _character;
    }
}