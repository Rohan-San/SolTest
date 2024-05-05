// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnershipTransfer {
    struct Land {
        address owner;
        string location;
        uint256 area; // In square meters
        uint256 value; // In wei
    }

    mapping(uint256 => Land) public lands; // Add mapping for storing land details
    
    struct Transfer {
        address from;
        address to;
        uint256 landId;
    }

    Transfer[] public transfers;

    // Events
    event OwnershipTransferred(address indexed from, address indexed to, uint256 indexed landId);

    // Functions
    function transferOwnership(address _to, uint256 _landId) external {
        // Perform ownership transfer
        require(msg.sender == lands[_landId].owner, "You are not the owner of this land");
        lands[_landId].owner = _to;
        transfers.push(Transfer(msg.sender, _to, _landId));
        emit OwnershipTransferred(msg.sender, _to, _landId);
    }
}
