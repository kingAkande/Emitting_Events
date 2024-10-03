// require necessary modules
const { vars } = require("hardhat/config");
require("@nomicfoundation/hardhat-toolbox");
// require("dotenv").config();  // Uncomment if using dotenv

const ACCOUNT_PRIVATE_KEY = vars.get("ACCOUNT_PRIVATE_KEY");
const LISK_RPC_URL = vars.get("LISK_RPC_URL");

const config = {
  solidity: "0.8.24",
  networks: {
    // for testnet
    "lisk-sepolia": {
      url: `${LISK_RPC_URL}`,
      accounts: [`${ACCOUNT_PRIVATE_KEY}`],
      gasPrice: 1000000000,
    },
  },
  etherscan: {
    apiKey: {
      "lisk-sepolia": "123", // Blockscout placeholder
    },
    customChains: [
      {
        network: "lisk-sepolia",
        chainId: 4202,
        urls: {
          apiURL: "https://sepolia-blockscout.lisk.com/api",
          browserURL: "https://sepolia-blockscout.lisk.com/",
        },
      },
    ],
  },
  sourcify: {
    enabled: false,
  },
};

module.exports = config;
