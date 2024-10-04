import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const SupplyChainModule = buildModule("SupplyChainModule", (m) => {

    const supplychain = m.contract("SupplyChain");

    return { supplychain };
});

export default SupplyChainModule;
//contract address = 0x246d729D096696794edBDf59EB2933fA9167c234