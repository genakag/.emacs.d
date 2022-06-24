;(use-package solarized-theme
;  :config
;  (setq solarized-distinct-fringe-background t)
;  (setq solarized-scale-org-headlines nil)
;  (setq solarized-use-variable-pitch nil)
;  (load-theme 'solarized-light t)
;  )

;(use-package zenburn-theme
;  :config
;  (load-theme 'zenburn t))

(use-package doom-themes
  :config
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;(doom-themes-neotree-config)
  ;; or for treemacs users
  ;(setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  ;(doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package solaire-mode
  :config
  (solaire-global-mode +1))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package all-the-icons)

(setq inhibit-startup-message t) ; Prevent launch scree
(menu-bar-mode -1) ; Disable the menu bar
(tool-bar-mode -1) ; Disable the tool bar

(setq dired-listing-switches "-hlao")

(provide 'gn-setup-appearance)
