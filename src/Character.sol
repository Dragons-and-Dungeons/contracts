// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "solmate/tokens/ERC721.sol";


// handles nfts, rolls, stats of the character, also is the bridge to the other contracts
contract Character is ERC721 {
    uint256 public lastId = 0;
    mapping(uint256 => string) public characterData;
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}

    function tokenURI(uint256 id) public view override returns (string memory){
        return characterData[id];
    }

    function create(string memory _tokenURI, address _race, address _class) public {
        _mint(msg.sender, lastId);
        lastId++;
    }

}