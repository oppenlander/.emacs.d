;; Check code style
(require 'python-pep8)

;; Check for errors
(require 'python-pylint)

;; Virtualenv
(require 'virtualenv)

;; Completion
(setq jedi:setup-keys t)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)

;; IPython
(require 'ipython)
(require 'ein)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)

(provide 'setup-python-mode)
