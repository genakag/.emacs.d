(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;(use-package smartparens
;  :config
;  (require 'smartparens-config)
;  (add-hook 'prog-mode-hook #'smartparens-mode))

(use-package paredit
  :config
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  )

(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)


(gn-leader-nmap paredit-mode-map
  "w" '(:ignore w :which-key "insert-around")
  "w(" 'paredit-wrap-round
  "w[" 'paredit-wrap-square
  "w{" 'paredit-wrap-curly
  "w<" 'paredit-wrap-angle
  "w\"" 'paredit-meta-doublequote
  "dw" 'paredit-splice-sexp
  "s" 'paredit-forward-slurp-sexp
  "S" 'paredit-backward-slurp-sexp
  "b" 'paredit-forward-barf-sexp
  "B" 'paredit-backward-barf-sexp
  "gl" 'paredit-forward
  "gh" 'paredit-backward
  "gj" 'paredit-forward-down
  "gk" 'paredit-backward-up)

(use-package projectile
  :config (projectile-mode +1)
  ;; Recommended keymap prefix on macOS
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  )

(use-package company
  :config (global-company-mode))

(provide 'gn-setup-coding-stuff)
