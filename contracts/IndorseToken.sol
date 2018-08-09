pragma solidity ^0.4.11;
import "./library/StandardToken.sol";
import "./library/SafeMath.sol";
import "./library/Pausable.sol";

contract IndorseToken is SafeMath, StandardToken, Pausable {
    // metadata
    string public constant name = "Indorse Token";
    string public constant symbol = "IND";
    uint256 public constant decimals = 18;
    string public version = "1.0";

    // contracts
    // Amending these for ganache - the first two are the real addresses 
    // address public indSaleDeposit        = 0x0053B91E38B207C97CBff06f48a0f7Ab2Dd81449;      // deposit address for Indorse Sale contract
    // address public indSeedDeposit        = 0x0083fdFB328fC8D07E2a7933e3013e181F9798Ad;      // deposit address for Indorse Seed Contributors
    address public indSaleDeposit        = 0x2fcCBADe8e134E03db9914cd99d75f00745d87c4;      // deposit address for Indorse Sale contract
    address public indSeedDeposit        = 0x5E8DbdAb25467ab1907af4a59F7FF6cBC20A8e1E;      // deposit address for Indorse Seed Contributors
    address public indPresaleDeposit     = 0x007AB99FBf023Cb41b50AE7D24621729295EdBFA;      // deposit address for Indorse Presale Contributors
    address public indVestingDeposit     = 0x0011349f715cf59F75F0A00185e7B1c36f55C3ab;      // deposit address for Indorse Vesting for team and advisors
    address public indCommunityDeposit   = 0x0097ec8840E682d058b24E6e19E68358d97A6E5C;      // deposit address for Indorse Marketing, etc
    address public indFutureDeposit      = 0x00d1bCbCDE9Ca431f6dd92077dFaE98f94e446e4;      // deposit address for Indorse Future token sale
    address public indInflationDeposit   = 0x00D31206E625F1f30039d1Fa472303E71317870A;      // deposit address for Indorse Inflation pool

    uint256 public constant indSale      = 31603785 * 10**decimals;
    uint256 public constant indSeed      = 3566341  * 10**decimals;
    uint256 public constant indPreSale   = 22995270 * 10**decimals;
    uint256 public constant indVesting   = 28079514 * 10**decimals;
    uint256 public constant indCommunity = 10919811 * 10**decimals;
    uint256 public constant indFuture    = 58832579 * 10**decimals;
    uint256 public constant indInflation = 14624747 * 10**decimals;

    // constructor
    function IndorseToken()
    {
      balances[indSaleDeposit]           = indSale;                                         // Deposit IND share
      balances[indSeedDeposit]           = indSeed;                                         // Deposit IND share
      balances[indPresaleDeposit]        = indPreSale;                                      // Deposit IND future share
      balances[indVestingDeposit]        = indVesting;                                      // Deposit IND future share
      balances[indCommunityDeposit]      = indCommunity;                                    // Deposit IND future share
      balances[indFutureDeposit]         = indFuture;                                       // Deposit IND future share
      balances[indInflationDeposit]      = indInflation;                                    // Deposit for inflation

      totalSupply = indSale + indSeed + indPreSale + indVesting + indCommunity + indFuture + indInflation;

      Transfer(0x0,indSaleDeposit,indSale);
      Transfer(0x0,indSeedDeposit,indSeed);
      Transfer(0x0,indPresaleDeposit,indPreSale);
      Transfer(0x0,indVestingDeposit,indVesting);
      Transfer(0x0,indCommunityDeposit,indCommunity);
      Transfer(0x0,indFutureDeposit,indFuture);
      Transfer(0x0,indInflationDeposit,indInflation);
   }

  function transfer(address _to, uint _value) whenNotPaused returns (bool success)  {
    return super.transfer(_to,_value);
  }

  function approve(address _spender, uint _value) whenNotPaused returns (bool success)  {
    return super.approve(_spender,_value);
  }
}
