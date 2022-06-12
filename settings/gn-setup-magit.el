(use-package magit
  :config
  ;; Close transient with ESC
  (general-def transient-map
    "<escape>" 'transient-quit-one)
  (general-nmap magit-mode-map
    "<escape>" 'evil-normal-state)
  (gn-leader-nvmap
    "om" 'magit-list-repositories)
  )

; Put this in custom file
;(setq magit-repository-directories
;      '(("~/.emacs.d" . 0)
;        ("~/myknowledge" . 0)))

(provide 'gn-setup-magit)

