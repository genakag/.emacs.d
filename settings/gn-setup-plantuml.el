(use-package plantuml-mode
  :config
  (setq plantuml-jar-path (expand-file-name "plantuml.jar" user-emacs-directory))
  (setq plantuml-default-exec-mode 'jar)
  (setq plantuml-output-type "png")
  (setq org-plantuml-jar-path (expand-file-name "plantuml.jar" user-emacs-directory)))


;; Make plantuml available in org mode 
(add-to-list
 'org-src-lang-modes '("plantuml" . plantuml))

;; Need this to evaluate plantuml src block
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

(defun gn-preview-plantuml ()
  "Preview plantuml diagram"
  (interactive)
  (let ((preview-window (get-buffer-window plantuml-preview-buffer)))
    (when preview-window
      (quit-window nil preview-window)))
  (plantuml-preview 1))

(general-nimap plantuml-mode-map
  "<s-return>" 'gn-preview-plantuml)

(provide 'gn-setup-plantuml)
