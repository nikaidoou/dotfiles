;;======================================
;; General Setting
;;======================================
;; don't make backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
;; share with clipboard
;; http://blog.lathi.net/articles/2007/11/07/sharing-the-mac-clipboard-with-emacs
;;======================================
;; PATH
;;======================================
;; PATH to the elisp
(add-to-list 'load-path "~/.emacs.d/elisp")
;; color theme settinf
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/color-theme-20080305.834/")
;; color theme for solarized
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/color-theme-solarized-20130307.1350")
;;======================================
;; Color theme
;;======================================
;; color-theme
;;(require 'color-theme)
;;(color-theme-initialize)

;;(load-file "~/.emacs.d/elpa/color-theme-20080305.834/color-theme-almost-monokai.el")
;;(color-theme-almost-monokai)

;; (load-theme 'wombat t)
;; (load-theme 'molokai t)
;; (load-theme 'tangotango t)
;; (load-theme 'zenburn t)
;; (load-theme 'hober t)
;; (load-theme 'solarized-dark t)
;;  (load-theme 'twilight t)
;;(load-theme 'jellybeans t)
(load-theme 'ujelly t)
;; (load-theme 'blackboard t)
;; (load-theme 'pastels-on-dark t)
;;======================================
;; Window Setting
;;======================================
;; don't open with a welcome page
(setq inhibit-startup-message t)
;; full screen
;;(setq ns-use-native-fullscreen nil)
;; 起動時のサイズ,表示位置,フォントを指定
;;(set-frame-size (selected-frame) 201 65)
;;(setq initial-frame-alist
;;      (append (list
;;	       '(width . 200)
;;	       '(height . 65)
;;	       '(top . 0)
;;	       '(left . 0)
;;	       )
;;	      initial-frame-alist))
;;(setq default-frame-alist initial-frame-alist)
;; フレーム透過設定
;;(add-to-list 'default-frame-alist '(alpha . (0.95 0.95)))

;; TAB key
(setq indent-line-function 'indent-relative-maybe)
(setq-default tab-width 2 indent-tabs-mode nil)

;; 何文字目にいるか表示
(line-number-mode 1)
;;行番号を表示
(require 'linum)
(setq linum-format
      '(lambda (line)
		 (let ((fmt
				(let ((min-w 4)
					  (w (length (number-to-string
								  (count-lines (point-min) (point-max))))))
				  (concat "%"
						  (number-to-string (if (< min-w w) w min-w))
						  "d  "))))
		   (propertize (format fmt line) 'face 'linum))))
(global-linum-mode)
;; 対応する括弧をハイライトする
(show-paren-mode 1)
;; 対応する括弧の色の設定
(setq show-paren-style 'mixed)
(set-face-background 'show-paren-match-face "grey")
(set-face-foreground 'show-paren-match-face "black")
;; 予約語を色分けする
(global-font-lock-mode t)
;; メニューバーを消す
(menu-bar-mode nil)
;; M-x menu-bar-mode で、メニューバーを表示/非表示
;;; ツールバーを非表示
;; M-x tool-bar-mode で表示非表示を切り替えられる
;;(tool-bar-mode -1)
;; タイトルバーにファイル名表示
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;;======================================
;; tabbar Setting
;;======================================
(require 'tabbar)
(tabbar-mode 1)
 
(tabbar-mwheel-mode -1)
 
(setq tabbar-buffer-groups-function nil)

(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))
 
(setq tabbar-auto-scroll-flag nil)
 
(setq tabbar-separator '(1.5))

(set-face-attribute
 'tabbar-default nil
 :family "Comic Sans MS"
 :background "black"
 :foreground "black"
 :height 0.8)
(set-face-attribute
 'tabbar-unselected nil
 :background "black"
 :foreground "#003643"
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background "#002B36"
 :foreground "grey72"
 :box nil)
(set-face-attribute
 'tabbar-button nil
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 1.0)


;; (defvar my-tabbar-displayed-buffers
;;  '("scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
;;   "*Regexps matches buffer names always included tabs.")
;; (defun my-tabbar-buffer-list ()
;;   "Return the list of buffers to show in tabs.
;; Exclude buffers whose name starts with a space or an asterisk.
;; The current buffer and buffers matches `my-tabbar-displayed-buffers'
;; are always included."
;;   (let* ((hides (list ?\  ?\*))
;;          (re (regexp-opt my-tabbar-displayed-buffers))
;;          (cur-buf (current-buffer))
;;          (tabs (delq nil
;;                      (mapcar (lambda (buf)
;;                                (let ((name (buffer-name buf)))
;;                                  (when (or (string-match re name)
;;                                            (not (memq (aref name 0) hides)))
;;                                    buf)))
;;                              (buffer-list)))))
;;     ;; Always include the current buffer.
;;     (if (memq cur-buf tabs)
;;         tabs
;;       (cons cur-buf tabs))))
;; (setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
 
;;======================================
;; Font Setting
;;======================================
(set-face-attribute 'default nil
            :family "Menlo" ;; font
            :height 110)    ;; font size

(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Hiragino Mincho Pro")) ;; font

(setq face-font-rescale-alist
      '((".*Hiragino_Mincho_pro.*" . 1.2)))

;;======================================
;; Encoding Setting
;;======================================
(setq default-buffer-file-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment "Japanese")
(setq locale-coding-system 'utf-8)
;;diredæå­ã³ã¼ãã®è¨­å®
(setq dired-default-file-coding-system 'utf-8-unix)
;;======================================
;; Installed Packages
;;======================================

(require 'package)
 (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
 (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(package-initialize)

;;auto-install
;;(require 'auto-install)
;;Emacs Lispをインストールするディレクトリの指定
;; (setq auto-install-directory "~/.emacs.d/elisp/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup) ;install-elisp.elとコマンド名を同期

;; anything
;;(require 'anything)
;;(require 'anything-config)
;;(add-to-list 'anything-sources 'anything-c-source-emacs-commands)

;; yasnippetを置いているフォルダにパス
(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/elpa/yasnippet-0.8.0"))
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/elpa/yasnippet-0.8.0/snippets"
        ))
(yas-global-mode 1)

;; redo
;; (require 'redo+)
;; (setq undo-no-redo t)
;; undoする情報を保持する量
;; (setq undo-limit 60000)
;; (setq undo-strong-limit 90000)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)


;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")
(tramp-set-completion-function "ssh"
							   '((tramp-parse-sconfig "~/.ssh/config")))
(add-to-list 'tramp-default-proxies-alist
             '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
             '("localhost" nil nil))
(add-to-list 'tramp-default-proxies-alist
             '((regexp-quote (system-name)) nil nil))
(add-to-list 'backup-directory-alist
             (cons tramp-file-name-regexp nil))
(setq tramp-auto-save-directory "/tmp")

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/elisp/auto-complete/")
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;;======================================
;; PHP
;;======================================
;; phpmode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist
             '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))

(add-to-list 'auto-mode-alist '("\\.module\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\'" . php-mode))

;;==========================================================
;; web
;;==========================================================
(setq auto-mode-alist
      (append '(
                ("\\.\\(html\\|xhtml\\|shtml\\|tpl\\|php\\|ctp\\)\\'" . web-mode)
                ("\\.php\\'" . php-mode)
                )
              auto-mode-alist))

(require 'web-mode)
(defun web-mode-hook ()
  "Hooks for Web mode."
  ;; 変更日時の自動修正
  (setq time-stamp-line-limit -200)
  (if (not (memq 'time-stamp write-file-hooks))
      (setq write-file-hooks
            (cons 'time-stamp write-file-hooks)))
  (setq time-stamp-format " %3a %3b %02d %02H:%02M:%02S %:y %Z")
;;  (setq time-stamp-start "Last modified: 木曜日 10月 17 02:59:43 2013 JST 火曜日 10月 22 05:06:03 2013 JST 日曜日 10月 27 03:07:54 2013 JST 日曜日 10月 27 03:10:34 2013 JST
  (setq time-stamp-end "$")
  ;; web-modeの設定
  (setq web-mode-markup-indent-offset 4) ;; html indent
  (setq web-mode-css-indent-offset 4)    ;; css indent
  (setq web-mode-code-indent-offset 4)   ;; script indent(js,php,etc..)
  ;; htmlの内容をインデント
  ;; TEXTAREA等の中身をインデントすると副作用が起こったりするので
  ;; デフォルトではインデントしない
  ;;(setq web-mode-indent-style 2)
  ;; コメントのスタイル
  ;;   1:htmlのコメントスタイル(default)
  ;;   2:テンプレートエンジンのコメントスタイル
  ;;      (Ex. {# django comment #},{* smarty comment *},{{-- blade comment --}})
  (setq web-mode-comment-style 2)
  ;; 終了タグの自動補完をしない
  (setq web-mode-disable-auto-pairing t)
  ;; color:#ff0000;等とした場合に指定した色をbgに表示しない
  (setq web-mode-disable-css-colorization t)
  ;; css,js,php,etc..の範囲をbg色で表示
  (setq web-mode-enable-block-faces t)
  (custom-set-faces
   '(web-mode-server-face
     ((t (:background "grey"))))                  ; template Blockの背景色
   '(web-mode-css-face
     ((t (:background "grey18"))))                ; CSS Blockの背景色
   '(web-mode-javascript-face
     ((t (:background "grey36"))))                ; javascript Blockの背景色
   )
  (setq web-mode-enable-heredoc-fontification t)
  )
(add-hook 'web-mode-hook  'web-mode-hook)
;; 色の設定
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-comment-face ((t (:foreground "#708090"))))
 '(web-mode-css-at-rule-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-face ((t (:background "grey18"))) t)
 '(web-mode-css-pseudo-class-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-rule-face ((t (:foreground "#A0D8EF"))) t)
 '(web-mode-doctype-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#BDB76B"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#BDB76B"))))
 '(web-mode-html-tag-face ((t (:foreground "#BDB76B"))))
 '(web-mode-javascript-face ((t (:background "grey36"))) t)
 '(web-mode-server-comment-face ((t (:foreground "#708090"))) t)
 '(web-mode-server-face ((t (:background "grey"))) t))
;;======================================
;; python
;;======================================
(add-hook 'python-mode-hook
		  '(lambda ()
			 (setq python-indent 2)
			 (setq indent-tabs-mod nil)
			 (define-key (current-local-map) "\C-h" 'python-backspace)
			 ))

;;======================================
;; scala
;;======================================
(add-to-list 'load-path "~/.emacs.d/elpa/scala-mode2-master/")
(require 'scala-mode2)

;;======================================
;; sml-sharp
;;======================================
(setq sml-indent-level 4)

;;======================================
;; slim-mode
;;======================================
(require 'slim-mode)

;;======================================
;; Keybind
;;======================================
;;C-c / でコメントアウト
(define-key global-map (kbd "C-c /") 'comment-or-uncomment-region)
;;Shitf+矢印で画面移動
(define-key global-map (kbd "C-x b") 'anything) ;
(windmove-default-keybindings)
;;Meta+矢印で画面分割
;; (global-set-key [M-right] 'split-window-horizontally)
;; (global-set-key [M-left] 'split-window-horizontally)
;; (global-set-key [M-up] 'split-window-vertically)
;; (global-set-key [M-down] 'delete-other-windows)

;; 単語展開キーバインド (ver8.0から明記しないと機能しない)
;; (setqだとtermなどで干渉問題ありでした)
;; もちろんTAB以外でもOK 例えば "C-;"とか


;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
;; quickrunのキーバインド変更
;;(global-set-key (kbd "<f5>") 'quickrun)
;; C-h を Backspace として使い、
;; C-c h を HELP に割当てる
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
(global-set-key "\C-ch" 'help-command)
;; redo+の設定
;; (when (require 'redo+ nil t)
;;   (global-set-key (kbd "C-/") 'undo) ;; Ctr / => undo
;;   (global-set-key (kbd "C-?") 'redo) ;; Ctr - => redo
;;   )


;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;;toggle tabber
;; (global-set-key (kbd "M-4") 'tabbar-mode) 
(global-set-key "\M-]" 'tabbar-forward)
(global-set-key "\M-[" 'tabbar-backward)
;;======================================
;; Other Setting
;;======================================
;;マウスの動きを有効化
;; (unless window-system
;;   (xterm-mouse-mode 1)
;;   (global-set-key [mouse-4] '(lambda ()
;;                                (interactive)
;;                                (scroll-down 1)))
;;   (global-set-key [mouse-5] '(lambda ()
;;                                (interactive)
;;                                (scroll-up 1))))
;;(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;; '(custom-safe-themes
;;   (quote
;;    ("167cbb16e26a66da3d77f308e78f428e41b1a5a404e3a82fa44666fcf201cb8a" "f641bdb1b534a06baa5e05ffdb5039fb265fde2764fbfd9a90b0d23b75f3936b" "5baa53c0748d6a530268a36dda54a5c06330295d5218f9b4b7089bbe9f5e6d29" "79830194b2d578f14c136bb273d89a241b4b687a7727700671d90d1527d6a889" "83368609a982059fa9c9baaabc74d061f134d7c8f5202f9a91774741e0b2ba84" "a27717dd89c68ab99e3d482114c1f2cdd71da5d6c433f3a0fe8fb0ae1a57ca58" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "42c7f1aa7a3db4ab8efabf1d10c158c2f1414ac57cb207cde815eadad72170d2" "dbf8cb30319aa88d14c569ef4509bd2c9ad6c8c58e7e7a7ae61a872cb32e9de2" "c5a7b857336ac863586f04a3e65b74a5f30bb844b1812ceb7371477b3937445d" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default)))
;; '(window-min-height 5)
;; '(window-min-width 10))

