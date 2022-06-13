;; Display available keybindings
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; Autocomplete
(use-package ivy
  :bind (:map ivy-minibuffer-map
              ("RET" . ivy-alt-done)
              ("TAB" . ivy-insert-current)
              ("C-j" . ivy-next-line)
              ("C-k" . ivy-previous-line)
              ("<s-return>" . ivy-immediate-done))
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-height 20)
  (ivy-mode t))

(use-package counsel
  :after ivy
  :config
  (define-key (current-global-map) [remap execute-extended-command] 'counsel-M-x)
  (define-key (current-global-map) [remap find-file] 'counsel-find-file)
  (define-key (current-global-map) [remap describe-function] 'counsel-describe-function)
  (define-key (current-global-map) [remap describe-variable] 'counsel-describe-variable))

(provide 'gn-setup-minibuffer)
