(use-package solarized-theme
  :config
  (load-theme 'solarized-light t)
  (setq solarized-distinct-fringe-background t)
  (setq solarized-scale-org-headlines nil)
  (setq solarized-use-variable-pitch nil))


(setq inhibit-startup-message t) ; Prevent launch scree
(menu-bar-mode -1) ; Disable the menu bar
(tool-bar-mode -1) ; Disable the tool bar

(provide 'gn-setup-appearance)
