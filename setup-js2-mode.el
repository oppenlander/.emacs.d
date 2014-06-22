(setq-default js2-enter-indents-newline t)
(setq-default js2-bounce-indent-p t)
(setq-default js2-global-externs '("module" "require" "jQuery" "$" "_" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON" "process" "setImmediate" "exports" "enum"))

(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

(setq-default js2-basic-offset 2)
(setq-default js-indent-level 2)
(setq-default js2-strict-inconsistent-return-warning nil)
(setq-default js2-include-node-externs t)
(setq-default js2-indent-ignore-first-tab t)

;; Jade/Stylus
(require 'sws-mode)
(require 'jade-mode)

;; Handlebars
(require 'handlebars-mode)

;; Less
(require 'less-css-mode)
(require 'flymake-less)
(add-hook 'less-css-mode-hook 'flymake-less-load)

;; Tern.JS
(require 'tern)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
	'(progn
		 (require 'tern-auto-complete)
		 (tern-ac-setup)))
(setq-default tern-ac-on-dot t)

;; Autocomplete js2
; (require 'auto-complete)
; (add-hook 'js2-mode-hook 'ac-js2-mode)
; (setq ac-js2-evaluate-calls t)
; (add-to-list 'ac-js2-external-libraries "path/to/lib/library.js")

;; Grunt
(require 'grunt)
(global-set-key (kbd "C-M-g") 'grunt-exec)

;; js2-refactor
(require 'js2-refactor)
(require 'discover-js2-refactor)

;; Clean modeline
(rename-modeline "js2-mode" js2-mode "JS2")

(provide 'setup-js2-mode)
