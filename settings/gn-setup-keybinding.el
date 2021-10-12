(use-package general
    :config
    (general-evil-setup))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  )

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(general-def '(normal visual insert)
  "<escape>" 'keyboard-escape-quit)

;; leader keys
(general-create-definer gn-leader-nvmap
  :states '(normal visual)
  :prefix "SPC")

(general-create-definer gn-leader-nmap
  :states 'normal
  :prefix "SPC")

(general-create-definer gn-leader-vmap
  :states 'visual
  :prefix "SPC")

(gn-leader-nmap
  ":" 'execute-extended-command

  ; Org commands
  "a" 'org-agenda
  "c" 'org-capture

  ; File commands
  "f" '(:ignore b :which-key "buffer")
  "fs" 'save-buffer
  "fq" 'kill-current-buffer
  "fe" 'switch-to-buffer
  "fE" 'switch-to-buffer-other-window
  "fo" 'find-file
  "fO" 'find-file-other-window

  ; Window commands
  "wq" 'evil-window-delete
  "ww" 'delete-other-windows
  "h" 'evil-window-left
  "H" 'evil-window-move-far-left
  "l" 'evil-window-right
  "L" 'evil-window-move-far-right
  "k" 'evil-window-up
  "K" 'evil-window-move-very-top
  "j" 'evil-window-down
  "J" 'evil-window-move-very-bottom

  ; Modes
  "m" '(:ignore m :which-key "modes")
  "mw" 'whitespace-mode

  "w" '(:ignore w :which-key "workflow")
  ;"wc" current-todo
  "wt" 'gn-workflow-open-todo
  "wi" 'gn-workflow-open-inbox
  "wr" 'gn-workflow-open-reference
  )

(general-def '(normal insert) emacs-lisp-mode-map
  "<s-return>" 'eval-defun)

(general-def '(visual)  emacs-lisp-mode-map
  "<s-return>" 'eval-last-sexp)

;; Vim keybindings
(general-imap 'global
  "C-g" 'evil-normal-state)

(defun gn-evil-scroll-down ()
  "Scroll down half screen and center screen"
  (interactive)
  (evil-scroll-down nil)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defun gn-evil-scroll-up ()
  "Scroll up half screen and center screen."
  (interactive)
  (evil-scroll-up nil)
  (evil-scroll-line-to-center (line-number-at-pos)))

(general-nvmap
  "SPC" nil
  "TAB" nil
  "RET" nil

  ;; Always use visual motion
  "j" 'evil-next-visual-line
  "k" 'evil-previous-visual-line
  )

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(provide 'gn-setup-keybinding)
