pragma solidity ^0.4.2;

contract Election {
  // Model a candidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  // Store accounts that have voted
  mapping (address => bool) public voters;

  // Store candidates
  // Fetch candidate
  mapping (uint => Candidate) public candidates;
  // Store candidate count
  uint public  candidatesCount;

  // voted event
  event votedEvent(
    uint indexed _candidateId
  );

  function Election() public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  function addCandidate(string _name) private {
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  function vote(uint _candidateId) public {
    // check that the account address has not voted before
    require(!voters[msg.sender]);

    // require a valid candidate
    require(_candidateId > 0 && _candidateId <= candidatesCount);

    // record the voter (address) has voted
    voters[msg.sender] = true;
    // update vote count
    candidates[_candidateId].voteCount++;

    // trigger voted event
    votedEvent(_candidateId);
  }
}
