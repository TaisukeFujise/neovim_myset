# readme
- `init.lua`:
	リーダーキーを設定し、`config.lazy` `config.options` `config.keymaps` `config.plugins` を読み込むエントリポイント。
- `lua/config/lazy.lua`:
	lazy.nvim をブートストラップして runtimepath に追加し、リーダーキー再設定、デフォルト配色（habamax）や更新チェッカーを指定したうえでプラグイン spec を `config/plugins` から読み込む。
- `lua/config/options.lua`: 基本オプション
	相対行番号、カーソル行、truecolor/暗背景、タブ幅4でタブ文字、インデント自動化、検索ハイライトとインクリメンタルサーチ、分割方向（下・右）、undofile/自動読込、システムクリップボード使用.
- `lua/config/keymaps.lua`: keymap設定
	ノーマルで `<CR><CR>` にウィンドウ切替、インサートで `jj` で Esc、`timeoutlen` を 300ms に短縮。
- `lua/config/plugins.lua`: lazy.nvim 用プラグイン定義
	autopairs、gitsigns、Treesitter（ハイライト/インデント）、42-header（`Stdheader`/`<F1>`）、moonfly テーマ、barbar（アイコン無効で番号/テキスト表示）、toggleterm（`<C-\\>` 横分割＋浮動 lazygit を `<leader>lg`）、Telescope（`<leader>ff`/`<leader>fg` など UI 設定付き）、lspconfig（lua_ls の `vim` 許可、clangd、有料診断表示設定）。
