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
    event TaskCompleted(
        uint id,
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

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}
