;; Require python-mode for better python support
;; (require 'python-mode)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (setq-default py-indent-offset 4)

;; ;; ipython
;; (require 'ipython)

;; ;; Check code style
;; (require 'python-pep8)

;; ;; Check for errors
;; (require 'python-pylint)

;; ;; Virtualenv
;; (require 'virtualenv)

;; ;; Pymacs
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (setq py-load-pymacs-p t)

;; ;; Ropemacs
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")

(elpy-enable)

(add-hook 'python-mode-hook 'elpy-mode)

(provide 'setup-python-mode)
