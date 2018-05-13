pragma solidity ^0.4.21;

contract ERC20TransferFrom {
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool);
}

/**
 * @title Seoul Ethereum Hackathon 1st Prize Distributor
 * @author M.H. Kang <guap.root@gmail.com> (https://github.com/cancue)
 */
contract HackathonPrizeDistributor {

  event Receive(address winner);
  event Winner(string name, address winner);
  event Remove(address addr);

  // Token Contracts
  address aragon;
  address raiden;
  address melon;
  address dai;
  address gnosis;
  // Team06 - 6 people
  // 홍승우
  address manager;
  /**
    * 조산구
    * 강명훈
    * 배윤진
    * 배연진
    * 김현준
   */
  mapping (address => bool) winners;

  function HackathonPrizeDistributor() public {
    // Token Contracts
    aragon = address(0x960b236A07cf122663c4303350609A66A7B288C0);
    raiden = address(0x255Aa6DF07540Cb5d3d297f0D0D4D84cb52bc8e6);
    melon = address(0xBEB9eF514a379B997e0798FDcC901Ee474B6D9A1);
    dai = address(0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359);
    gnosis = address(0x6810e776880C02933D47DB1b9fc05908e5386b96);
    // Team Leader - S.W. Hong (홍승우)
    manager = address(0x8550d15c493e97afcE6F34DaceBc3a1F2E309e21);
    emit Winner("Hong", manager);
    // Solidity Code Writer - M.H. Kang (강명훈)
    winners[msg.sender] = true;
    emit Winner("M.H. Kang", msg.sender);
  }

  function receive() external {
    require(winners[msg.sender]);
    delete winners[msg.sender];

    _award(msg.sender);
  }

  function addWinner(address _winner, string _name)
    external
    onlyManager
  {
    emit Winner(_name, _winner);
    _award(_winner);
  }

  function removeWrongAddress(address _addr)
    external
    onlyManager
  {
    winners[_addr] = false;

    emit Remove(_addr);
  }

  function callFor(
    address _to,
    uint256 _value,
    uint256 _gas,
    bytes _code
  )
    external
    payable
    onlyManager
    returns (bool)
  {
    return _to.call.value(_value).gas(_gas)(_code);
  }

  function _award(address _member) internal {
    bool _a = ERC20TransferFrom(aragon).transferFrom(
      manager, _member, 16.26 ether
    );
    bool _r = ERC20TransferFrom(raiden).transferFrom(
      manager, _member, 34.9 ether
    );
    bool _m = ERC20TransferFrom(melon).transferFrom(
      manager, _member, 0.98 ether
    );
    bool _d = ERC20TransferFrom(dai).transferFrom(
      manager, _member, 66.66 ether
    );
    bool _g = ERC20TransferFrom(gnosis).transferFrom(
      manager, _member, 0.66 ether
    );

    _result = _a && _r && _m && _d && _g;
    require(_result);

    emit Receive(_member);
  }

  modifier onlyManager
  {
    require(msg.sender == manager);
    _;
  }

}
