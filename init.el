;; Turn off tool-bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; No splash screen
(setq inhibit-startup-message t)

;; Set custom (built in) theme
(load-theme 'wombat t)

;; Set font
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monospace" :foundry "unknown" :slant normal :weight normal :height 90 :width normal)))))

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Install extensions if they're missing
;; TODO: list all packages I want installed here
(require 'setup-package)
(defun init--install-packages ()
  (packages-install
   (cons 'magit melpa)
   (cons 'paredit melpa)
   (cons 'htmlize melpa)
   (cons 'slime-js marmalade)
   (cons 'clojure-mode melpa)
   (cons 'nrepl melpa)
   (cons 'js2-mode melpa)
   (cons 'js2-refactor melpa)
   (cons 'smex melpa)
   (cons 'ido-ubiquitous melpa)
   (cons 'browse-kill-ring melpa)
   (cons 'fill-column-indicator melpa)
   (cons 'yasnippet melpa)
   (cons 'smooth-scroll melpa)
   (cons 'undo-tree melpa)
   (cons 'auto-complete melpa)
   (cons 'autopair melpa)
   (cons 'web-mode melpa)
   (cons 'nlinum gnu)
   (cons 'evil melpa)
   (cons 'scala-mode2 melpa)
   (cons 'markdown-mode melpa)
   (cons 'haml-mode melpa)
   (cons 'yaml-mode melpa)
   (cons 'elpy marmalade)
   (cons 'lua-mode melpa)
   (cons 'flymake-lua melpa)
   (cons 'coffee-mode melpa)
   (cons 'kivy-mode melpa)
   (cons 'jade-mode melpa)))
(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Setup extensions
(eval-after-load 'ido '(require 'setup-ido))

;; Language specific extensions
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
(eval-after-load 'python-mode '(require 'setup-python-mode))
(eval-after-load 'web-mode '(require 'setup-web-mode))
(require 'typescript)
(eval-after-load 'scala-mode2 '(require 'setup-scala-mode))
(require 'markdown-mode)
(require 'haml-mode)
(require 'yaml-mode)
(eval-after-load 'lua-mode '(require 'setup-lua-mode))
(require 'kivy-mode)
(require 'coffee-mode)
(setq coffee-tab-width 2)
(require 'jade-mode)

;; Map files to modes
(require 'mode-mappings)

;; Smart M-x
(require 'smex)
(smex-initialize)

;; Misc
(require 'my-misc)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
