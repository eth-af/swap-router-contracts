// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity =0.7.6;
pragma abicoder v2;

import '@ethaf/ethaf-periphery/contracts/base/SelfPermit.sol';
import '@ethaf/ethaf-periphery/contracts/base/PeripheryImmutableState.sol';

import './interfaces/ISwapRouter02.sol';
import './V2SwapRouter.sol';
import './V3SwapRouter.sol';
import './base/ApproveAndCall.sol';
import './base/MulticallExtended.sol';

import './base/Blastable.sol';

/// @title Uniswap V2 and V3 Swap Router
contract SwapRouter02 is ISwapRouter02, V2SwapRouter, V3SwapRouter, ApproveAndCall, MulticallExtended, SelfPermit, Blastable {
    constructor(
        address _factoryV2,
        address factoryV3,
        address _positionManager,
        address _WETH9,
        address blast,
        address blastPoints,
        address gasCollector,
        address pointsOperator
    ) ImmutableState(_factoryV2, _positionManager) PeripheryImmutableState(factoryV3, _WETH9) {
        _initBlast(blast, blastPoints, gasCollector, pointsOperator);
    }
}
