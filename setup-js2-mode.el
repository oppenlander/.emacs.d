(setq-default js2-enter-indents-newline t)
(setq-default js2-bounce-indent-p t)
(setq-default js2-global-externs '("module" "require" "jQuery" "$" "_" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))

(require 'js2-refactor)
(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

(add-hook 'js2-mode-hook 'js2-disable-indent-tabs-mode)
(setq-default intent-tabs-mode nil)
(setq-default js2-basic-offset 2)
(setq-default js-indent-level 2)

;; Jade/Stylus
(require 'sws-mode)
(require 'jade-mode)

;; Tern.JS
;; (add-to-list 'load-path (expand-file-name "tern/emacs" site-lisp-dir))
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;; (eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))

(provide 'setup-js2-mode)
