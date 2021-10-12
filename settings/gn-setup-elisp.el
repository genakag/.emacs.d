(general-nimap emacs-lisp-mode-map
  "<s-return>" 'eval-defun)

(general-def '(visual)  emacs-lisp-mode-map
  "<s-return>" 'eval-last-sexp)

(provide 'gn-setup-elisp)
