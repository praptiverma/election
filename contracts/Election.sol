pragma solidity 0.5.8;

contract Election {
    //candidate struct
     struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    event votedEvent (
        uint indexed _candidateId
    );
    //read or write candidate
     mapping(uint => Candidate) public candidates;
     mapping(address => bool) public voters;

    // Constructor
    //  function elec () public {
    //     candidate = "Candidate 1";
    // }

    //store candidate count
     uint public candidatesCount;
    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
      constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
        addCandidate("Candidate 3");
        addCandidate("Candidate 4");

    }
    function vote (uint _candidateId) public {
    // require that they haven't voted before
    require(!voters[msg.sender]);

    // require a valid candidate
    require(_candidateId > 0 && _candidateId <= candidatesCount);

    // record that voter has voted
    voters[msg.sender] = true;

    // update candidate vote Count
    candidates[_candidateId].voteCount ++;

    // trigger voted event
    emit votedEvent(_candidateId);
}

}

