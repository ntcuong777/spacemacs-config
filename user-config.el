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


;; Add auto save to several language mode
(setq real-auto-save-interval 2)
(setq lsp-enable-indentation nil
      ;; lsp-enable-on-type-formatting nil
      lsp-format-buffer-on-save nil)

(add-hook 'lisp-mode-hook #'real-auto-save-mode)
(add-hook 'lisp-mode-hook #'smartparens-mode)
;; (add-hook 'lisp-mode-hook #'parinfer-rust-mode)

(add-hook 'emacs-lisp-mode-hook #'real-auto-save-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
;; (add-hook 'emacs-lisp-mode-hook #'parinfer-rust-mode)

(add-hook 'elisp-mode #'real-auto-save-mode)
(add-hook 'elisp-mode #'smartparens-mode)
;; (add-hook 'elisp-mode #'parinfer-rust-mode)

(add-hook 'clojure-mode-hook #'real-auto-save-mode)
(add-hook 'clojure-mode-hook #'smartparens-mode)
;; (add-hook 'clojure-mode-hook #'parinfer-rust-mode)

;; (add-hook 'sly-quicklisp-mode-hook #'real-auto-save-mode)
(add-hook 'web-mode-hook #'real-auto-save-mode)
(add-hook 'python-mode-hook #'real-auto-save-mode)
(add-hook 'go-mode-hook #'real-auto-save-mode)
;; (add-hook '+web-django-mode-hook #'real-auto-save-mode)
(add-hook 'json-mode-hook #'real-auto-save-mode)
(add-hook 'yaml-mode-hook #'real-auto-save-mode)


;; Map ESC to quit several mode
(define-key minibuffer-local-map (kbd "<escape>") 'keyboard-quit)
(define-key minibuffer-local-ns-map (kbd "<escape>") 'keyboard-quit)
(define-key minibuffer-local-completion-map (kbd "<escape>") 'keyboard-quit)
(define-key minibuffer-local-must-match-map (kbd "<escape>") 'keyboard-quit)
(define-key minibuffer-local-isearch-map (kbd "<escape>") 'keyboard-quit)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "<escape>") 'company-abort))
(with-eval-after-load 'corfu
  (define-key corfu-map (kbd "<escape>") 'corfu-quit))
(with-eval-after-load 'helm
  (define-key helm-map (kbd "<escape>") 'helm-keyboard-quit))
