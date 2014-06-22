;; Clean up buffer after bullshit
(defun cleanup-buffer-boring ()
	(interactive)
	(delete-trailing-whitespace)
	(set-buffer-file-coding-system 'utf-8))
(defun cleanup-buffer-safe ()
	"Perform a safe buffer cleanup"
	(interactive)
	(untabify (point-min) (point-max))
	(cleanup-buffer-boring))
(defun cleanup-buffer ()
	"Unsafe buffer cleanup"
	(interactive)
	(cleanup-buffer-safe)
	(indent-region (point-min) (point-max)))
(add-hook 'before-save-hook 'cleanup-buffer-boring)

;; Don't add new line at the end of every file
(setq mode-require-final-newline nil)
(setq require-final-newline nil)

;; Global line numbers
(global-linum-mode 1)

;; Allow pasting selection outside Emacs
(setq x-select-enable-clipboard t)

;; Move deleted fiels to trash
(setq delete-by-moving-to-trash t)

;; No shift marking/selecting
(setq shift-select-mode nil)

;; Transparently open compressed files
(auto-compression-mode t)

;; Answer yes/no with y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Remove test in active region if inserting text
(require 'delsel)
(delete-selection-mode 1)

;; Line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Undo/redo window configurations
(winner-mode 1)

;; Represent undo-history as an actual tree (visualize with C-x u)
(setq undo-tree-mode-lighter "")
(require 'undo-tree)
(global-undo-tree-mode)

;; Browse kill ring
;; errors and won't quit
																				;(require 'browse-kill-ring)
																				;(browse-kill-ring-default-keybindings)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Auto-complete
(require 'auto-complete)
(define-globalized-minor-mode real-global-auto-complete-mode
	auto-complete-mode (lambda ()
											 (if (not (minibufferp (current-buffer)))
													 (auto-complete-mode 1))
											 ))
(real-global-auto-complete-mode t)

;; Hide DOS line endings
(defun remove-dos-eol ()
	(interactive)
	(setq buffer-display-table (make-display-table))
	(aset buffer-display-table ?\^M []))

;; Projectile
(require 'projectile)
(projectile-global-mode)

;; Set global tab width
																				;(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq-default octave-block-offset 2)

;; Recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Goto last change
(global-set-key "\C-x\C-\\" 'goto-last-change)

;; Show matchin parentheses
(show-paren-mode 1)

;; Cursor Settings
(blink-cursor-mode 1)
(setq default-frame-alist '((cursor-color . "white")))

;; Flymake Keybindings
(global-set-key [f5] 'flymake-goto-next-error)
(global-set-key [S-f5] 'flymake-goto-prev-error)
(global-set-key [f6] 'flymake-display-err-menu-for-current-line)

;; Autocomplete
(define-key ac-mode-map (kbd "C-TAB") 'auto-complete)

;; Same-frame Speedbar
(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(setq speedbar-show-unknown-files t)
(setq speedbar-smart-directory-expand-flag t)
(setq speedbar-use-images nil)

;; Rainbows
																				;(require 'rainbow-delimiters)
																				;(global-rainbow-delimiters-mode)

;; Ack
(require 'ack-and-a-half)
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;; Move backwards through windows
(global-set-key "\C-xp" (lambda ()
													(interactive)
													(other-window -1)))

;; Popwin
(require 'popwin)
(popwin-mode 1)

;; Direx
(require 'direx)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
			popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

;; Powerline (advanced mode-line)
(require 'powerline)
(powerline-default-theme)

;; Multi-term
(require 'multi-term)
(setq multi-term-program "/usr/bin/fish")

;; Make tramp work nicely with sudo
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

;; Smartparens
(require 'smartparens-config)
(smartparens-global-mode 1)
(show-smartparens-global-mode 1)
(global-set-key (kbd "C-M-k") 'sp-kill-sexp)

;; Diminish modeline
(require 'diminish)
(diminish 'smartparens-mode)

;; Cleaning modeline
(defmacro rename-modeline (package-name mode new-name)
	`(eval-after-load ,package-name
		 '(defadvice ,mode (after rename-modeline activate)
				(setq mode-name ,new-name))))

;; eww it up
(require 'eww)
(require 'w3m)
(setq browse-url-browser-function 'w3m-browse-url)

;; my magit
(require 'magit)
(global-set-key (kbd "C-c g") 'magit-status)

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide 'my-misc)
