// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address public admin;
    uint public totalVotes;
    mapping(address => bool) public hasVoted;

    constructor() {
        admin = msg.sender;
        totalVotes = 0;
    }

    function vote(bool choice) external {
        require(!hasVoted[msg.sender], "You have already voted.");
        totalVotes++;
        hasVoted[msg.sender] = true;
        emit Voted(msg.sender, choice);
    }

    function getVoteStatus(address voter) external view returns (bool) {
        return hasVoted[voter];
    }

    event Voted(address indexed voter, bool choice);
}
