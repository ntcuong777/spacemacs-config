;; -*- mode: emacs-lisp; lexical-binding: t -*-

;; ---------------------------------------
;; General Configuration changes
;; ---------------------------------------

;; ---------------------------------------
;; Line numbers
;; native line numbers taking up lots of space?
(setq-default display-line-numbers-width nil)
;; ---------------------------------------

;; ---------------------------------------
;; Searching
;; replace / search with helm-swoop in Evil normal state
(evil-global-set-key 'normal "/" 'helm-swoop)
;;
;; ---------------------------------------

;; ---------------------------------------
;; Helm Descbinds
;; Recent release of helm-descbinds package breaks which-key menu
;; Remove helm-discbinds-mode from helm mode hook to avoid activating
;; https://github.com/syl20bnr/spacemacs/issues/16276
(remove-hook 'helm-mode-hook 'helm-descbinds-mode)
;; ---------------------------------------


(setq projectile-project-search-path '("~/Desktop/codes.nosync/"
                                       "~/Desktop/Projects/"
                                       "~/Desktop/Projects/Personal/"))


;; Add auto save to several language mode, paredit is enabled for only Lisp-dialect
(setq real-auto-save-interval 0.5)

(add-hook 'lisp-mode-hook #'real-auto-save-mode)
;; (add-hook 'lisp-mode-hook #'paredit-mode)
;; (add-hook 'lisp-mode-hook #'parinfer-rust-mode)

(add-hook 'emacs-lisp-mode-hook #'real-auto-save-mode)
;; (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
;; (add-hook 'emacs-lisp-mode-hook #'parinfer-rust-mode)

(add-hook 'elisp-mode #'real-auto-save-mode)
;; (add-hook 'elisp-mode #'paredit-mode)
;; (add-hook 'elisp-mode #'parinfer-rust-mode)

(add-hook 'clojure-mode-hook #'real-auto-save-mode)
;; (add-hook 'clojure-mode-hook #'paredit-mode)
;; (add-hook 'clojure-mode-hook #'parinfer-rust-mode)

;; (add-hook 'sly-quicklisp-mode-hook #'real-auto-save-mode)
(add-hook 'web-mode-hook #'real-auto-save-mode)
(add-hook 'python-mode-hook #'real-auto-save-mode)
(add-hook 'go-mode-hook #'real-auto-save-mode)
;; (add-hook '+web-django-mode-hook #'real-auto-save-mode)
(add-hook 'json-mode-hook #'real-auto-save-mode)
(add-hook 'yaml-mode-hook #'real-auto-save-mode)
