pragma solidity 0.8.11;

contract TodoList {

    uint public taskCount = 0; // state variable written directly to the blockchain

    struct Task {
        uint taskID;
        string content;
        bool completed;
    }

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    mapping(uint => Task) public tasks;

    constructor() public {
        createTask("Work on Thesis");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }
}
