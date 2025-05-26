# 🗳️ Decentralized Voting Smart Contract

A simple and secure **decentralized voting system** built using **Solidity** and Ethereum smart contracts. This contract allows users to:

- Create proposals using their wallet address.
- Vote on existing proposals (1 vote per user per proposal).
- View proposal details and current vote counts.

---

## 🚀 Features

- ✅ Proposal creation by any Ethereum wallet
- ✅ One vote per user per proposal
- ✅ Transparent on-chain storage of proposals and votes
- ✅ Event emission for easy front-end integration

---

## 🔧 Smart Contract Details

### Contract Name: `DecentralizedVoting`

### Functions

#### `createProposal(string calldata _description)`
Creates a new proposal.
- `@param _description`: A short description of the proposal.
- Emits: `ProposalCreated(proposalId, msg.sender, _description)`

#### `vote(uint256 _proposalId)`
Vote on a proposal using your wallet address.
- `@param _proposalId`: The ID of the proposal you want to vote on.
- Emits: `VoteCast(proposalId, msg.sender)`
- Reverts if:
  - Invalid proposal ID.
  - Caller has already voted on that proposal.

#### `getProposal(uint256 _proposalId)`
Returns details about a proposal.
- `@returns`: Proposal ID, description, proposer address, and vote count.

---

## 🛠 Deployment

To deploy the contract on a testnet or local blockchain:

1. Install [Hardhat](https://hardhat.org/) or [Remix](https://remix.ethereum.org/)
2. Compile the contract with Solidity version ^0.8.0
3. Deploy using MetaMask or a script


## contract address : 0xb2269ae0fc93c9a949b956a7c18da6827b9cb8b1

##transaction link: https://scan.test2.btcs.network/tx/0x4fb6dfd950b65bbb86b89d30b109b097ab025e44a56767192df9295e8777432c

![image](https://github.com/user-attachments/assets/3606fe38-c552-4e74-8d53-75aed85ebdb8)


Example using Hardhat:

```bash
npx hardhat run scripts/deploy.js --network sepolia





# Decentralized-Voting
