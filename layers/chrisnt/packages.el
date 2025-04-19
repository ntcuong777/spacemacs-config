;;; packages.el --- My Personal Layer packages File for Spacemacs

(defconst chrisnt-packages
  '(
    ;; paredit
    eval-in-repl
    gorepl-mode
    gomacro-mode
    real-auto-save
    repl-driven-development))


(defun chrisnt/init-eval-in-repl ()
  (use-package eval-in-repl))

(defun chrisnt/init-gorepl-mode ()
  (use-package gorepl-mode))

(defun chrisnt/init-gomacro-mode ()
  (use-package gomacro-mode))

(defun chrisnt/init-real-auto-save ()
  (use-package real-auto-save))

(defun chrisnt/init-repl-driven-development ()
  (use-package repl-driven-development))
