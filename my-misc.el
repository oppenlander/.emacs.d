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

;; Auto indent lines
(global-set-key "\C-m" 'newline-and-indent)

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
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

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

;; Autopair
(require 'autopair)
(autopair-global-mode)

;; Hide DOS line endings
(defun remove-dos-eol ()
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; Projectile
(require 'projectile)
(projectile-global-mode)

;; Set global tab width
(setq tab-width 4)

(provide 'my-misc)
