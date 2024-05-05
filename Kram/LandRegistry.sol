// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LandRegistry {
    struct Land {
        address owner;
        string location;
        uint256 area; // In square meters
        uint256 value; // In wei
    }

    mapping(uint256 => Land) public lands;
    uint256 public landIdCounter;

    // Events
    event LandRegistered(uint256 indexed landId, address indexed owner, string location, uint256 area, uint256 value);
    
    // Constructor
    constructor() {
        landIdCounter = 1; // Start land IDs from 1
    }

    // Functions
    function registerLand(address _owner, string memory _location, uint256 _area, uint256 _value) external returns (uint256) {
        lands[landIdCounter] = Land(_owner, _location, _area, _value);
        emit LandRegistered(landIdCounter, _owner, _location, _area, _value);
        landIdCounter++;
        return landIdCounter - 1; // Return the ID of the registered land
    }
}
