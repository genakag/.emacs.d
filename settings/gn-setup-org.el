(use-package org)
(require 'ox)
(setq org-export-async-debug nil)

(setq org-return-follows-link t)

(use-package valign)

(add-hook 'org-mode-hook (lambda ()
                           ;; make the lines in the buffer wrap around the edges of the screen.
                           (valign-mode)
                           (org-indent-mode)
                           (flyspell-mode 1)))

(use-package org-roam
  :config
  (require 'org)
  (setq org-roam-directory (file-truename "~/myknowledge/org"))
  (org-roam-db-autosync-mode)
  (setq org-roam-completion-everywhere t)
  (setq org-roam-dailies-directory "daily/")
  (setq org-roam-dailies-capture-templates
        '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n"))))
  )
(use-package org-roam-ui
  :config
  (require 'org-roam)
  )

(use-package org-download
  :after org
  :bind
  (:map org-mode-map
        (("s-Y" . org-download-screenshot)
         ("s-y" . org-download-clipboard))))

(general-nimap org-mode-map
  "<s-return>" 'org-ctrl-c-ctrl-c)

(gn-leader-nvmap org-mode-map
  "e" 'org-ctrl-c-ctrl-c
  "bb" 'gnorg/open-scope
  )

(gn-leader-nmap org-mode-map
  "i" '(:ignore i :which-key "insert")
  "id" '(:ignore id :which-key "date")
  "id SPC" 'org-time-stamp
  "idi" 'org-time-stamp-inactive
  "idd" 'org-deadline
  "ids" 'org-schedule
  "il" 'org-insert-link
  "ii" 'org-id-get-create
  "ib" '(org-insert-structure-template :which-key "insert code block")
  "it" 'counsel-org-tag
  "iT" 'gnorg/insert-template
  "D" 'org-cut-subtree
  "y" '(:ignore y :which-key "yank")
  "yi" 'org-id-copy
  "yl" 'org-store-link
  "t" '(:ignore t :which-key "todo")
  "t SPC" 'org-todo
  "tn" 'gntodo/next-todo
  "tp" 'org-priority
  "T" '(:ignore T :which-key "toggle") 
  "Ti" 'org-toggle-inline-images
  "Tl" 'org-toggle-link-display
  "s" '(:ignore s :which-key "src")
  "st" 'org-babel-tangle
  "n" '(:ignore n :which-key "narrowing")
  "nn" 'org-narrow-to-subtree
  "nw" 'widen
  "/" 'org-sparse-tree

  ; Navigation
  "j" 'org-next-visible-heading
  "k" 'org-previous-visible-heading

  ; Heading promotion, demotion
  "H" 'org-metaleft
  "L" 'org-metaright
  "K" 'outline-move-subtree-up
  "J" 'outline-move-subtree-down

 )

(general-create-definer gn-roam-nvmap
  :states '(normal visual)
  :prefix "SPC SPC"
  :keymaps 'override)
(general-create-definer gn-roam-nmap
  :states 'normal
  :prefix "SPC SPC"
  :keymaps 'override)
(general-create-definer gn-roam-vmap
  :states 'visual
  :prefix "SPC SPC"
  :keymaps 'override)

(gn-roam-nvmap
  ; Org Roa m
  "f" 'org-roam-node-find
  "i" 'org-roam-node-insert
  "t" 'org-roam-buffer-toggle
  "g" 'org-roam-ui-mode
  "r" '(:ignore rr :which-key "org roam reference") 
  "ra" 'org-roam-ref-add
  "rr" 'org-roam-ref-remove
  "d" 'org-roam-dailies-goto-today
 )

(provide 'gn-setup-org)
