# GDG School 2025 Blockchain Development Workshop

## Code The Chain: From Blockchain Fundamentals to Smart Contract Deployment

This repository consolidates the codebase, reference materials, and
operational resources leveraged throughout the Blockchain Development
Workshop. The objective of this program is to provide participants with
an end-to-end, production-grade understanding of blockchain
architecture, Ethereum's execution environment, and smart contract
engineering workflows.

The workshop is structured around a progressive learning path designed
to streamline developer onboarding, accelerate subject-matter
comprehension, and ensure alignment with industry-standard delivery
practices.

------------------------------------------------------------------------

## Repository Structure

    /src/               # Smart contracts developed during the workshop  
    /script/            # Deployment and interaction scripts  
    /resources/         # Additional documentation, links, and slides  
    /test/              # Unit and Fuzzing tests 
    README.md           # Workshop reference document  

------------------------------------------------------------------------

## Supporting Resources

Relevant documentation, whitepapers, and external links referenced
during the workshop are available in the `/resources` directory to
streamline continued learning and post-workshop enablement.

------------------------------------------------------------------------

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```


------------------------------------------------------------------------

## Additional Notes

This repository is intended as an operational baseline for continued
experimentation. Participants are encouraged to extend the codebase,
implement advanced patterns, and leverage the provided assets for
further professional development in blockchain engineering.
