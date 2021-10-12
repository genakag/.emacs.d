;;; Buffer setup 

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Write all autosave files in the tmp dir
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Don't write lock-files, I'm the only one here
(setq create-lockfiles nil)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Use UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(setq-default indent-tabs-mode nil)

(column-number-mode)
(global-display-line-numbers-mode t)

;;; turn the alarm sound off
(setq ring-bell-function 'ignore)

;;; scroll line by line
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(provide 'gn-setup-buffer)

