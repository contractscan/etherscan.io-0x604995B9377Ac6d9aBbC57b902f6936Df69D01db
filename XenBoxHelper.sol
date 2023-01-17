//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.17;

import "./IERC721.sol";

contract XenBoxHelper {
    /* ================ VIEW FUNCTIONS ================ */

    function getOwnedTokenIdList(
        address target,
        address owner,
        uint256 start,
        uint256 end
    ) external view returns (uint256[] memory tokenIdList) {
        require(start < end, "XenBox: end must over start");
        IERC721 erc721 = IERC721(target);
        uint256[] memory list = new uint256[](end - start);
        uint256 index;
        for (uint256 tokenId = start; tokenId < end; tokenId++) {
            if (erc721.ownerOf(tokenId) == owner) {
                list[index] = tokenId;
                index++;
            }
        }
        tokenIdList = new uint256[](index);
        for (uint256 i; i < index; i++) {
            tokenIdList[i] = list[i];
        }
    }

    /* ================ TRAN FUNCTIONS ================ */

    /* ================ ADMIN FUNCTIONS ================ */
}