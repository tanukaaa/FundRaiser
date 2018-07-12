pragma solidity ^0.4.24;
contract FundingFactory {


}

interface Identifiable {
    function getType() public view returns (string);
}

contract Fund {

    address public owner;

    event Donation(address sender, uint256 amount);

    constructor() public {
        owner = msg.sender;
    }

    function getBalance() constant public returns (uint256){
        return address(this).balance;
    }

    function getAddress() constant public returns (address) {
        return address(this);
    }

    function() public payable {
        emit Donation(msg.sender, msg.value);
    }
}

contract DonationsFund is Fund, Identifiable {

    uint256 public expires;

    constructor(uint256 _expires) {
        expires = now + _expires;
    }

    function getType() public view returns (string) {
        return "DonationsFund";
    }
}