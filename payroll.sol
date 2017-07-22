pragma solidity ^0.4.13;

contract Payroll {
    address owner;
    address employee;
    uint salary = 100;
    uint lastPaidDay;

    function Payroll() {
        owner = msg.sender;
    }

    function updateEmployee(address newEmployee, uint newSalary) {
        require(msg.sender == owner);
        employee = newEmployee;
        salary = newSalary * 1 ether;
        lastPaidDay = now;
    }

    function addFund() payable returns (uint) {
        require(msg.value > 0);
        return this.balance;
    }

    function calculateRunWay() returns (uint) {
        assert(salary > 0);
        return this.balance / salary;
    }

    function hasEnoughFund() returns (bool) {
        return calculateRunWay() > 0;
    }

    function getPaid() {
        require(employee == msg.sender);
        assert(hasEnoughFund());
        employee.transfer(salary);
    }
}