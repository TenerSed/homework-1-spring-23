// SPDX - License - Identifier : MIT
pragma solidity ^0.8.20;

contract Bank {
    struct Account {
        address owner;
        uint256 balance;
    }

    mapping ( address => Account ) public accounts ;

    function createAccount () public {
        require(accounts[msg.sender].owner == address(0), "Account already exists"); // Check if the account already exists
        accounts[msg.sender] = Account({
            owner: msg.sender,
            balance: 0
        });
    }

    // 3) Deposit funds (+12 points)
    function deposit(uint256 amount) public {
        require(accounts[msg.sender].owner != address(0), "No account found"); // Check if the account exists

        accounts[msg.sender].balance += amount; // Add the amount to the account's balance
    }

    function withdraw ( uint256 amount ) public {
        require(accounts[msg.sender].owner != address(0), "No account found"); 
        require(accounts[msg.sender].balance >= amount, "Insufficient funds"); 

        accounts[msg.sender].balance = accounts[msg.sender].balance - amount;
    }

    function getBalance() public view returns (uint256) {
        require(accounts[msg.sender].owner != address(0), "No account found");
        return accounts[msg.sender].balance;
    }
}
