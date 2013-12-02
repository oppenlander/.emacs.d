(require 'setup-lisp-mode)
(require 'clojure-mode)
(require 'clojure-test-mode)
(require 'cider)

(defadvice clojure-test-run-tests (before save-first activate)
  (save-buffer))

(provide 'setup-clojure-mode)
