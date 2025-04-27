;;; packages.el --- My Personal Layer packages File for Spacemacs

(defconst chrisnt-packages
  '(
    ;; paredit
    eval-in-repl
    gorepl-mode
    gomacro-mode
    real-auto-save
    repl-driven-development

    ;; For OCaml development
    ;; tuareg ;; already available in Spacemacs
    eglot
    ocaml-eglot
    iedit
    ;; merlin-iedit ;; already in Spacemacs
    merlin-ac
    opam-switch-mode
    ;;opam-user-setup
    ))


(defun chrisnt/init-eval-in-repl ()
  (use-package eval-in-repl
    :ensure t))

(defun chrisnt/init-gorepl-mode ()
  (use-package gorepl-mode
    :ensure t))

(defun chrisnt/init-gomacro-mode ()
  (use-package gomacro-mode
    :ensure t))

(defun chrisnt/init-real-auto-save ()
  (use-package real-auto-save
    :ensure t))

(defun chrisnt/init-repl-driven-development ()
  (use-package repl-driven-development
    :ensure t))

;;(defun chrisnt/init-tuareg ()
;;  (use-package tuareg
;;    :ensure t
;;    :mode (("\\.ocamlinit\\'" . tuareg-mode))))

(defun chrisnt/init-eglot ()
  (use-package eglot
    :ensure t))

(defun chrisnt/init-ocaml-eglot ()
  (use-package ocaml-eglot
    :ensure t
    :after tuareg
    :hook
    (tuareg-mode . ocaml-eglot)
    (ocaml-eglot . eglot-ensure)))

(defun chrisnt/init-iedit ()
  (use-package iedit
    :ensure t))

;;(defun chrisnt/init-merlin-iedit ()
;;  (use-package merlin-iedit
;;    :ensure t))

(defun chrisnt/init-merlin-ac ()
  (use-package merlin-ac
    :ensure t))

(defun chrisnt/init-opam-switch-mode ()
  (use-package opam-switch-mode
    :ensure t))

;;(defun chrisnt/init-opam-user-setup ()
;;  ;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
;;  (require 'opam-user-setup "./opam-user-setup.el")
;;  ;; ## end of OPAM user-setup addition for emacs / base ## keep this line
;;  )
