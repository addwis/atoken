// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// ERC20（基本規格）、ERC20Burnable（焼却機能）、Ownable（管理者権限機能）の3つを統合
contract MyManagedToken is ERC20, ERC20Burnable, Ownable {
    
    // ① トークンの名前とシンボル（ティッカー）を設定
    constructor() ERC20("Addwis Token", "AT") Ownable(msg.sender) {
        
        // ② 初期発行量：デプロイと同時に100万枚を発行し、作成者に付与
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }

    // ③ 追加発行（Mint）機能：管理者（Owner）だけが後からトークンを無から生み出せる
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
