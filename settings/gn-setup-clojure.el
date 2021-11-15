(use-package cider
  :config
  (add-hook 'clojure-mode-hook #'cider-mode))
(use-package clj-refactor
  :config
  (add-hook 'clojure-mode-hook
            (lambda ()
              (progn
                (clj-refactor-mode 1)
                (yas-minor-mode 1) ; for adding require/use/import statements
                ;; This choice of keybinding leaves cider-macroexpand-1 unbound
                (cljr-add-keybindings-with-prefix "C-c C-m")))))

(use-package flycheck-clj-kondo)
(use-package clojure-mode
  :config (require 'flycheck-clj-kondo))

(general-nimap clojure-mode-map
  "<s-return>" 'cider-eval-defun-at-point)

(general-def '(visual) clojure-mode-map
  "<s-return>" 'cider-eval-last-sexp)

(provide 'gn-setup-clojure)
