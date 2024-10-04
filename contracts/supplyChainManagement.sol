// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SupplyChain {
    struct Product {
        string name;
        string status;
        uint256 timestamp;
    }

    address public owner;
    mapping(bytes32 => Product) public products;

    event ProductRegistered(bytes32 indexed productId, string name);
    event StatusUpdated(bytes32 indexed productId, string status);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerProduct(bytes32 productId, string memory name) public onlyOwner {
        products[productId] = Product(name, "Registered", block.timestamp);
        emit ProductRegistered(productId, name);
    }

    function updateStatus(bytes32 productId, string memory status) public onlyOwner {
        require(bytes(products[productId].name).length > 0, "Product not found");
        products[productId].status = status;
        products[productId].timestamp = block.timestamp;
        emit StatusUpdated(productId, status);
    }

    function getProduct(bytes32 productId) public view returns (string memory, string memory, uint256) {
        Product memory product = products[productId];
        return (product.name, product.status, product.timestamp);
    }
}
