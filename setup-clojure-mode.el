(require 'clojure-mode)

(defadvice clojure-test-run-tests (before save-first activate)
  (save-buffer))

(eval-after-load "nrepl"
  '(progn
     (define-key nrepl-mode-map (kbd "C-,") 'complete-symbol)
     (define-key nrepl-interaction-mode-map (kbd "C-,") 'complete-symbol)))

(provide 'setup-clojure-mode)
