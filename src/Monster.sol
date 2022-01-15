// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "solmate/tokens/ERC721.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";


// handles nfts, rolls, stats of the character, also is the bridge to the other contracts
contract Monster is ERC721, Ownable {
    uint256 public lastId = 0;
    mapping(uint256 => string) public monsterData;
    constructor(string memory _name, string memory _symbol, address dm) ERC721(_name, _symbol) {
        transferOwnership(dm);
    }

    function tokenURI(uint256 id) public view override returns (string memory){
        return monsterData[id];
    }

    function create(string memory _tokenURI, address _race) onlyOwner public {
        _mint(msg.sender, lastId);
        lastId++;
    }
}