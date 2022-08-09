// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


library TransferHelper {
    function safeTransfer(address token, address to, uint value) internal {
        // bytes4(keccak256(bytes('transfer(address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0xa9059cbb, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TransferHelper: TRANSFER_FAILED');
    }

    function safeTransferETH(address to, uint value) internal {
        (bool success,) = to.call{value : value}(new bytes(0));
        require(success, 'TransferHelper: ETH_TRANSFER_FAILED');
    }

    function safeTransferFrom721(address tokenAddress, address from, address to, uint256 tokenId) internal {
        // bytes4(keccak256(bytes('safeTransferFrom(address,address,uint256)')));
        (bool success,) = tokenAddress.call(abi.encodeWithSelector(0x42842e0e, from, to, tokenId));
        require(success, 'TransferHelper: TRANSFER_FROM_721_FAILED');
    }
}
