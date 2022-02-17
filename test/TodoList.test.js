const TodoListTest = artifacts.require("./TodoList.sol");

contract("TodoListTest", (accounts) =>{

    before(async () => {
        this.todoList = await TodoListTest.deployed();
    });

    it("deploy contract successfully", async () => {
        const address = await this.todoList.address;
        assert.notEqual(address, 0x0);
        assert.notEqual(address, "");
        assert.notEqual(address, null);
        assert.notEqual(address, undefined);
    })

    it('lists tasks', async () => {
        const taskCount = await this.todoList.taskCount();
        const task = await this.todoList.tasks(taskCount);
        assert.equal(task.taskID.toNumber(), taskCount.toNumber())
        assert.equal(task.content, 'Work on Thesis')
        assert.equal(task.completed, false)
        assert.equal(taskCount.toNumber(), 1)
    });

    it("create tasks", async () => {
        const result = await this.todoList.createTask("New Task");
        const taskCount = await this.todoList.taskCount();
        assert.equal(taskCount, 2);
        const event = result.logs[0].args;
        assert.equal(event.id.toNumber(), 2);
        assert.equal(event.content, "New Task");
        assert.equal(event.completed, false);
    })
})
