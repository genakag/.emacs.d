(use-package ejc-sql
  :config
  (setq clomacs-httpd-default-port 8082)

  (use-package auto-complete
    :config
    (add-hook 'ejc-sql-minor-mode-hook
              (lambda ()
                (auto-complete-mode t)
                (ejc-ac-setup)))
    (setq ejc-completion-system 'ivy)
    (push 'ejc-company-backend company-backends)
    (add-hook 'ejc-sql-minor-mode-hook
              (lambda ()
                (company-mode t)))
    (setq ejc-complete-on-dot t))
  )

(general-nimap ejc-sql-mode-keymap
  "<s-return>" 'ejc-eval-user-sql-at-point)


(provide 'gn-setup-sql)
