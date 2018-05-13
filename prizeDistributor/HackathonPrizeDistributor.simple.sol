pragma solidity ^0.4.21;

contract ERC20TransferFrom {
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool);
}

/**
 * @title Seoul Ethereum Hackathon 1st Prize Distributor
 * @author M.H.Kang <guap.root@gmail.com> (https://github.com/cancue)
 */
contract HackathonPrizeDistributor {

  // Token Contracts
  address aragon;
  address raiden;
  address melon;
  address dai;
  address gnosis;
  /**
    * Team06 - 6 people
    * 조산구 S.K.Jo
    * 홍승우 S.W.Hong
    * 강명훈 M.H.Kang
    * 배윤진 Y.J.Bae
    * 배연진 Y.J.Bae
    * 김현준 H.J.Kim
   */
  address holder;

  function HackathonPrizeDistributor() public {
    // Token Contracts
    aragon = address(0x960b236A07cf122663c4303350609A66A7B288C0);
    raiden = address(0x255Aa6DF07540Cb5d3d297f0D0D4D84cb52bc8e6);
    melon = address(0xBEB9eF514a379B997e0798FDcC901Ee474B6D9A1);
    dai = address(0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359);
    gnosis = address(0x6810e776880C02933D47DB1b9fc05908e5386b96);
    // S.W.Hong
    holder = address(0x8550d15c493e97afcE6F34DaceBc3a1F2E309e21);
  }

  function award(address[] _members) external {
    require(msg.sender == holder);

    for(uint i = 0; i < _members.length; i++) {
      _award(_members[i]);
    }
  }

  function _award(address _member) internal {
    bool _a = ERC20TransferFrom(aragon).transferFrom(
      holder, _member, 16.26 ether
    );
    bool _r = ERC20TransferFrom(raiden).transferFrom(
      holder, _member, 34.9 ether
    );
    bool _m = ERC20TransferFrom(melon).transferFrom(
      holder, _member, 0.98 ether
    );
    bool _d = ERC20TransferFrom(dai).transferFrom(
      holder, _member, 66.66 ether
    );
    bool _g = ERC20TransferFrom(gnosis).transferFrom(
      holder, _member, 0.66 ether
    );

    require(_a && _r && _m && _d && _g);
  }

}
