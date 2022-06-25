(general-nimap emacs-lisp-mode-map
  "<s-return>" 'eval-defun)

(general-def '(visual)  emacs-lisp-mode-map
  "<s-return>" 'eval-last-sexp)

(defun gn/read-file (file)
  "File to string function"
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))

(defun gn/print-all ()
  (interactive)
  (setq eval-expression-print-length 1000)
  (setq eval-expression-print-level 1000))

(provide 'gn-setup-elisp)
