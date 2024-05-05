// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Verification {
    // Mapping to store land ownership records
    mapping(uint256 => address) public landOwners;

    // Event emitted when ownership of a land is verified
    event OwnershipVerified(uint256 indexed landId, address indexed owner, bool isVerified);

    // Function to verify ownership of a land
    function verifyOwnership(uint256 _landId, address _owner) public {
        // Check if the provided owner matches the recorded owner of the land
        bool isVerified = (landOwners[_landId] == _owner);
        
        // Emit event
        emit OwnershipVerified(_landId, _owner, isVerified);
    }
}
