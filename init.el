;; My variables
(defvar gn-settings-path (expand-file-name "settings" user-emacs-directory)
  "Path to the folder that contains the emacs settings.")

;; Specify file for emacs custom settings
(let ((custom-file-path (expand-file-name "custom.el" gn-settings-path)))
  (when (not (file-exists-p custom-file-path))
    (with-temp-buffer (write-file custom-file-path)))
  (setq custom-file custom-file-path)
  (load custom-file))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Set up load path
(add-to-list 'load-path (expand-file-name "settings" user-emacs-directory))

;; Set up load path for genenakagaki.com
;(add-to-list 'load-path "~/blog.genenakagaki.com")
;(add-to-list 'load-path "~/genenakagaki.com/export")

(require 'gn-setup-package)
(use-package names)
(require 'names)
(require 'names-dev)

(require 'gn-setup-buffer)
(require 'gn-setup-minibuffer)
(require 'gn-setup-keybinding)
(require 'gn-setup-appearance)

;; Languages
(require 'gn-setup-elisp)
(require 'gn-setup-coding-stuff)

(require 'gn-setup-magit)
(require 'gn-setup-org)
(require 'gn-setup-plantuml)

(require 'gn-setup-clojure)
(require 'gn-setup-sql)

(require 'gn-setup-blog-genenakagaki)
