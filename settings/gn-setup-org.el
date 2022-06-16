(use-package org
  :config
  (require 'ox)
  (setq org-tag-alist '(("noexport" . n))))

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
  (require 'org-roam-export)
  (setq org-roam-directory (file-truename "~/myknowledge/roam"))
  (org-roam-db-autosync-mode)
  (setq org-roam-completion-everywhere t)
  (setq org-roam-capture-templates
        '(("d" "default"
           plain "%?"
           :target (file+head "./node/${slug}.org" "#+title: ${title}")
           :immediate-finish
           :jump-to-captured)
          ("e" "English blog post"
           plain "%?"
           :target (file+head "./en/blog/${slug}.org" "
#+language: en 
#+title: ${title}
#+description: ${title}
")
           :immediate-finish
           :jump-to-captured)
          ("j" "Japanese blog post"
           plain "%?"
           :target (file+head "./ja/blog/${slug}.org" "
#+language: ja 
#+title: ${title}
#+description: ${title}
")
           :immediate-finish
           :jump-to-captured)))
  (setq org-roam-dailies-directory "daily")
  (setq org-roam-dailies-capture-templates
        '(("d" "default"
           entry "* %?"
           :target (file+head "%<%Y-%m-%d>.org"
                              "
#+title: %<%Y-%m-%d>
"))))
  (cl-defmethod org-roam-node-slug ((node org-roam-node))
    "Return the slug of NODE."
    (let ((title (org-roam-node-title node))
          (slug-trim-chars '(;; Combining Diacritical Marks https://www.unicode.org/charts/PDF/U0300.pdf
                             768 ; U+0300 COMBINING GRAVE ACCENT
                             769 ; U+0301 COMBINING ACUTE ACCENT
                             770 ; U+0302 COMBINING CIRCUMFLEX ACCENT
                             771 ; U+0303 COMBINING TILDE
                             772 ; U+0304 COMBINING MACRON
                             774 ; U+0306 COMBINING BREVE
                             775 ; U+0307 COMBINING DOT ABOVE
                             776 ; U+0308 COMBINING DIAERESIS
                             777 ; U+0309 COMBINING HOOK ABOVE
                             778 ; U+030A COMBINING RING ABOVE
                             779 ; U+030B COMBINING DOUBLE ACUTE ACCENT
                             780 ; U+030C COMBINING CARON
                             795 ; U+031B COMBINING HORN
                             803 ; U+0323 COMBINING DOT BELOW
                             804 ; U+0324 COMBINING DIAERESIS BELOW
                             805 ; U+0325 COMBINING RING BELOW
                             807 ; U+0327 COMBINING CEDILLA
                             813 ; U+032D COMBINING CIRCUMFLEX ACCENT BELOW
                             814 ; U+032E COMBINING BREVE BELOW
                             816 ; U+0330 COMBINING TILDE BELOW
                             817 ; U+0331 COMBINING MACRON BELOW
                             )))
      (cl-flet* ((nonspacing-mark-p (char) (memq char slug-trim-chars))
                 (strip-nonspacing-marks (s) (string-glyph-compose
                                              (apply #'string
                                                     (seq-remove #'nonspacing-mark-p
                                                                 (string-glyph-decompose s)))))
                 (cl-replace (title pair) (replace-regexp-in-string (car pair) (cdr pair) title)))
        (let* ((pairs `(("[^[:alnum:][:digit:]]" . "-") ;; convert anything not alphanumeric
                        ("__*" . "-")                   ;; remove sequential underscores
                        ("^_" . "")                     ;; remove starting underscore
                        ("_$" . "")))                   ;; remove ending underscore
               (slug (-reduce-from #'cl-replace (strip-nonspacing-marks title) pairs)))
          (downcase slug)))))
  )




(use-package org-roam-ui
  :config
  (require 'org-roam)
  )

(use-package org-download
  :after org
  :config
  (setq org-download-heading-lvl nil)
  (setq-default org-download-image-dir (concat org-roam-directory "/images"))
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

;; I encountered the following message when attempting
;; to export data:
;;
;; "org-export-data: Unable to resolve link: FILE-ID"
(defun gn/force-org-rebuild-cache ()
  "Rebuild the `org-mode' and `org-roam' cache."
  (interactive)
  (org-id-update-id-locations)
  (org-roam-db-clear-all)
  (org-roam-db-sync)
  (org-roam-update-org-id-locations))

(provide 'gn-setup-org)
