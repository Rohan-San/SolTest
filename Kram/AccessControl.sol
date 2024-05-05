// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessControl {
    // Mapping to store user roles
    mapping(address => bool) public isAdmin;

    // Event emitted when user role is updated
    event UserRoleUpdated(address indexed user, bool isAdmin);

    // Function to grant or revoke admin role
    function updateAdminRole(address _user, bool _isAdmin) public {
        // Require that the sender is an admin
        require(isAdmin[msg.sender], "You are not authorized to update user roles");
        
        // Update user role
        isAdmin[_user] = _isAdmin;
        
        // Emit event
        emit UserRoleUpdated(_user, _isAdmin);
    }
}
