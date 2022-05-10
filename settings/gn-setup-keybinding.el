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
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(general-create-definer general-nimap :states '(normal insert))

(general-nvmap
  ;; Remove unnecessary keybindings
  ;;"SPC" nil
  ;;"TAB" nil
  ;;"RET" nil

  ;; Always use visual motion
  "j" 'evil-next-visual-line
  "k" 'evil-previous-visual-line
  )

(general-imap 'global
  "C-g" 'evil-normal-state)

(general-def 'global
  "<escape>" 'keyboard-escape-quit
  "C-<tab>" 'completion-at-point)

(general-create-definer gn-leader-nvmap
  :states '(normal visual)
  :prefix "SPC"
  :keymaps 'override)
(general-create-definer gn-leader-nmap
  :states 'normal
  :prefix "SPC"
  :keymaps 'override)
(general-create-definer gn-leader-vmap
  :states 'visual
  :prefix "SPC"
  :keymaps 'override)
(gn-leader-nmap
  ":" 'execute-extended-command
  
  ;; Org commands
  ;"a" 'org-agenda
  ;"c" 'org-capture

  ;; File commands
  "f" '(:ignore b :which-key "file")
  "fs" 'save-buffer
  "fq" 'kill-current-buffer
  "fe" 'switch-to-buffer
  "fE" 'switch-to-buffer-other-window
  "fo" 'find-file
  "fO" 'find-file-other-window

  ;; Window commands
  "wq" 'evil-window-delete
  "wQ" 'delete-other-windows
  "wh" 'evil-window-left
  "wH" 'evil-window-move-far-left
  "wl" 'evil-window-right
  "wL" 'evil-window-move-far-right
  "wk" 'evil-window-up
  "wK" 'evil-window-move-very-top
  "wj" 'evil-window-down
  "wJ" 'evil-window-move-very-bottom

  ;; Modes
  "m" '(:ignore m :which-key "modes")
  "mw" 'whitespace-mode

  ;;"w" '(:ignore w :which-key "workflow")
  ;;"wc" current-todo
  ;;"wt" 'gn-workflow-open-todo
  ;;"wi" 'gn-workflow-open-inbox
  ;;"wr" 'gn-workflow-open-reference
  )


(provide 'gn-setup-keybinding)
