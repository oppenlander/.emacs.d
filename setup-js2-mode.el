(setq-default js2-enter-indents-newline t)
(setq-default js2-bounce-indent-p t)
(setq-default js2-global-externs '("module" "require" "jQuery" "$" "_" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))

(require 'js2-refactor)
(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

(setq-default js2-basic-offset 2)
(setq-default js-indent-level 2)

;; Jade/Stylus
(require 'sws-mode)
(require 'jade-mode)

;; Tern.JS
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;; Autocomplete js2
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)
;(add-to-list 'ac-js2-external-libraries "path/to/lib/library.js")


(provide 'setup-js2-mode)
