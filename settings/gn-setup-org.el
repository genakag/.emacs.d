(use-package org)
(require 'ox)
(setq org-export-async-debug nil)

(setq org-return-follows-link t)

(use-package valign)

(add-hook 'org-mode-hook (lambda ()
                           ;; make the lines in the buffer wrap around the edges of the screen.
                           (valign-mode)
                           (org-indent-mode)))

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
  )

(general-def
 :states '(normal visual insert)
 :keymaps 'org-mode-map
 "C-h" 'org-metaleft
 "C-l" 'org-metaright
 "C-k" 'outline-move-subtree-up
 "C-j" 'outline-move-subtree-down
 )

(general-nvmap
  :keymaps 'org-mode-map
  "J" 'org-next-visible-heading
  "K" 'org-previous-visible-heading)

(provide 'gn-setup-org)
