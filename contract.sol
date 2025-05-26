// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedVoting {

    // Struct for a proposal
    struct Proposal {
        uint256 id;
        string description;
        address proposer;
        uint256 voteCount;
    }

    // Mapping of proposal ID to Proposal
    mapping(uint256 => Proposal) public proposals;

    // Tracks if an address has voted on a given proposal
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    // Total number of proposals
    uint256 public proposalCount;

    // Events
    event ProposalCreated(uint256 proposalId, address proposer, string description);
    event VoteCast(uint256 proposalId, address voter);

    /// @notice Create a new proposal
    /// @param _description Description of the proposal
    function createProposal(string calldata _description) external {
        proposalCount++;
        proposals[proposalCount] = Proposal({
            id: proposalCount,
            description: _description,
            proposer: msg.sender,
            voteCount: 0
        });

        emit ProposalCreated(proposalCount, msg.sender, _description);
    }

    /// @notice Vote on a specific proposal
    /// @param _proposalId ID of the proposal to vote on
    function vote(uint256 _proposalId) external {
        require(_proposalId > 0 && _proposalId <= proposalCount, "Invalid proposal ID");
        require(!hasVoted[_proposalId][msg.sender], "Already voted on this proposal");

        hasVoted[_proposalId][msg.sender] = true;
        proposals[_proposalId].voteCount++;

        emit VoteCast(_proposalId, msg.sender);
    }

    /// @notice Get details of a proposal
    /// @param _proposalId ID of the proposal
    /// @return id Proposal ID
    /// @return description Proposal description
    /// @return proposer Address of the proposer
    /// @return voteCount Total votes received
    function getProposal(uint256 _proposalId)
        external
        view
        returns (uint256 id, string memory description, address proposer, uint256 voteCount)
    {
        require(_proposalId > 0 && _proposalId <= proposalCount, "Invalid proposal ID");
        Proposal memory p = proposals[_proposalId];
        return (p.id, p.description, p.proposer, p.voteCount);
    }
}
