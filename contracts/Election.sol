pragma solidity ^0.4.2;

contract Election {
  // Model a candidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }
  // Store candidates
  // Fetch candidate
  mapping (uint => Candidate) public candidates;
  // Store candidate count
  uint public  candidatesCount;

  function Election() public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  function addCandidate(string _name) private {
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }
}
