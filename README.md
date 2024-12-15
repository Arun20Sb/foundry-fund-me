# Fund Me

# Getting Started

## Requirements

- [git]
  - Verify installation: git --version (e.g., git version x.x.x)
- [foundry]
  - Verify installation: forge --version (e.g., forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z))


## Quickstart

```
git clone 
cd foundry-fund-me
```

# Usage

## Deploy

```
forge script script/DeployFundMe.s.sol
```

## Testing

1. Unit
2. Integration
3. Forked
4. Staging

### To execute tests:

```
forge test
```
or 

### To run specific test functions matching a regex pattern:

```
forge test --match-test testFunctionName
```

or

### To test with forked state:

```
forge test --fork-url $SEPOLIA_RPC_URL
```

### Test Coverage

```
forge coverage
```

## Scripts

After deploying to a network (local or testnet), use scripts for interactions. 

Using cast deployed locally example: 

```
cast send <FUNDME_CONTRACT_ADDRESS> "fund()" --value 0.1ether --private-key <PRIVATE_KEY>
```

or
```
forge script script/Interactions.s.sol:FundFundMe --rpc-url sepolia  --private-key $PRIVATE_KEY  --broadcast
forge script script/Interactions.s.sol:WithdrawFundMe --rpc-url sepolia  --private-key $PRIVATE_KEY  --broadcast
```

### Withdraw

```
cast send <FUNDME_CONTRACT_ADDRESS> "withdraw()"  --private-key <PRIVATE_KEY>
```

## Estimate gas

You can estimate how much gas things cost by running:

```
forge snapshot
```

And you'll see an output file called `.gas-snapshot`


# Formatting


To run code formatting:
```
forge fmt
```