
;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Set up load path
(add-to-list 'load-path (expand-file-name "settings" user-emacs-directory))

(use-package names)
(require 'names)
(require 'names-dev)

(require 'gn-setup-package)
(require 'gn-setup-buffer)
(require 'gn-setup-keybinding)
(require 'gn-setup-appearance)

;; Languages
(require 'gn-setup-elisp)
(require 'gn-setup-org)
(require 'gn-setup-magit)

;; Display available keybindings
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy
  :bind (:map ivy-minibuffer-map
              ("RET" . ivy-alt-done)
              ("TAB" . ivy-insert-current)
              ("C-j" . ivy-next-line)
              ("C-k" . ivy-previous-line))
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




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit valign names-dev names evil-collection evil general use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
