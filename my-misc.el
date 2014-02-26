;; Clean up buffer after bullshit
(defun cleanup-buffer-safe ()
  "Perform a safe buffer cleanup"
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))
(defun cleanup-buffer ()
  "Unsafe buffer cleanup"
  (interactive)
  (cleanup-buffer-safe)
  (indent-region (point-min) (point-max)))
(add-hook 'before-save-hook 'cleanup-buffer-safe)

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
;; (winner-mode 1)

;; Represent undo-history as an actual tree (visualize with C-x u)
;; (setq undo-tree-mode-lighter "")
;; (require 'undo-tree)
;; (global-undo-tree-mode)

;; Browse kill ring
;; (require 'browse-kill-ring)
;; (browse-kill-ring-default-keybindings)

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
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default octave-block-offset 4)

;; Recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Goto last change
(global-set-key "\C-x\C-\\" 'goto-last-change)

;; Show matchin parentheses
(show-paren-mode 1)

;; Electric Pair
(electric-pair-mode 1)

;; Cursor Settings
(blink-cursor-mode 1)
(setq default-frame-alist '((cursor-color . "white")))

;; Flymake Keybindings
(global-set-key [f5] 'flymake-goto-next-error)
(global-set-key [S-f5] 'flymake-goto-prev-error)
(global-set-key [f6] 'flymake-display-err-menu-for-current-line)

;; Autocomplete
(define-key ac-mode-map (kbd "M-TAB") 'Auto-complete)

;; Same-frame Speedbar
(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(setq speedbar-show-unknown-files t)
(setq speedbar-smart-directory-expand-flag t)
(setq speedbar-use-images nil)

;; Rainbows
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; Ack
(require 'ack-and-a-half)
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;; Minimap
(require 'minimap)
(global-set-key (kbd "s-w") 'minimap-toggle)

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

(provide 'my-misc)
