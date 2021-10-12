(use-package magit
  :config
  ;; Close transient with ESC
  (general-def transient-map
    "<escape>" 'transient-quit-one)
  (general-nmap magit-mode-map
    "<escape>" 'evil-normal-state)
  (gn-leader-nvmap
    "v" 'magit-status)
  )

(provide 'gn-setup-magit)
