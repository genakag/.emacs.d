;; My variables
(defvar gn-settings-path (expand-file-name "settings" user-emacs-directory)
  "Path to the folder that contains the emacs settings.")

;; Specify file for emacs custom settings
(setq custom-file (expand-file-name "custom.el" gn-settings-path))
(load custom-file)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Set up load path
(add-to-list 'load-path (expand-file-name "settings" user-emacs-directory))

(use-package names)
(require 'names)
(require 'names-dev)

(require 'gn-setup-package)
(require 'gn-setup-buffer)
(require 'gn-setup-minibuffer)
(require 'gn-setup-keybinding)
(require 'gn-setup-appearance)

;; Languages
(require 'gn-setup-elisp)
(require 'gn-setup-magit)
(require 'gn-setup-org)
(require 'gn-setup-plantuml)


