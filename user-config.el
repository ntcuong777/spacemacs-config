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

(defun my-spacemacs/disable-smartparens-strict-mode ()
  "Disable smartparens strict mode."
  (smartparens-strict-mode -1))


(use-package smartparens
  :ensure t
  :hook (prog-mode . smartparens-mode)
  :init
  ;; Optional: Enable strict mode in Lisp buffers
  (add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
  (add-hook 'lisp-mode-hook #'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'python-mode-hook #'my-spacemacs/disable-smartparens-strict-mode)
  (add-hook 'go-mode-hook #'my-spacemacs/disable-smartparens-strict-mode)
  (add-hook 'tuareg-mode-hook#'my-spacemacs/disable-smartparens-strict-mode)
  :config
  (require 'smartparens-config)

  (define-key smartparens-mode-map (kbd "M-(") 'sp-wrap-round)
  (define-key smartparens-mode-map (kbd "M-[") 'sp-wrap-square)
  (define-key smartparens-mode-map (kbd "M-{") 'sp-wrap-curly)
  ;; Apply default smartparens bindings
  (dolist (binding sp-smartparens-bindings)
    (define-key smartparens-mode-map (kbd (car binding)) (cdr binding))))


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
(add-hook 'python-mode-hook #'smartparens-mode)
(add-hook 'go-mode-hook #'smartparens-mode)
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
(define-key minibuffer-local-filename-completion-map (kbd "<escape>") 'keyboard-quit)
(define-key minibuffer-local-shell-command-map (kbd "<escape>") 'keyboard-quit)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "<escape>") 'company-abort))
(with-eval-after-load 'corfu
  (define-key corfu-map (kbd "<escape>") 'corfu-quit))
;; (with-eval-after-load 'helm
;;   (define-key helm-map (kbd "<escape>") 'helm-keyboard-quit))
;; (with-eval-after-load 'helm-descbinds
;;   (define-key helm-descbinds-map (kbd "<escape>") 'helm-keyboard-quit))
;; (define-key helm-M-x-map (kbd "<escape>") 'keyboard-quit)
;; (define-key helm-map (kbd "<escape>") 'keyboard-quit)
;; (define-key helm-descbinds-map (kbd "<escape>") 'keyboard-quit)
;; (define-key helm-find-files-map(kbd "<escape>") 'keyboard-quit)
;; (define-key helm-buffer-map (kbd "<escape>") 'keyboard-quit)
;; (define-key key-translation-map (kbd "<escape>") (kbd "C-g"))
;; (global-set-key (kbd "<escape>") (kbd "C-g"))

;; (defvar chrisnt/escape-binding nil
;;   "The original binding for <escape>.")

;; (defun chrisnt/save-escape-binding ()
;;   "Save the original binding for <escape>."
;;   (setq chrisnt/escape-binding (lookup-key key-translation-map (kbd "<escape>"))))

;; (defun chrisnt/find-escape-binding-in-keymap (keymap)
;;   "Find the binding for <escape> in the given KEYMAP."
;;   (let ((binding (lookup-key keymap (kbd "<escape>"))))
;;     (if binding
;;         (progn
;;           (message "Found binding for <escape>: %s" binding)
;;           binding))))

;; (defun chrisnt/remap-escape-in-various-evil-modes ()
;;   "Remap <escape> to C-g in various evil modes."
;;   (let ((keymap-list (list evil-insert-state-map
;;                            evil-normal-state-map
;;                            evil-visual-state-map
;;                            evil-emacs-state-map)))
;;     (dolist (keymap keymap-list)
;;       (let ((binding (chrisnt/find-escape-binding-in-keymap keymap)))
;;         (if binding
;;             (progn
;;               (chrisnt/save-escape-binding)
;;               (local-set-key (kbd "<escape>") (cdr binding))))))))

;; (defun chrisnt/restore-escape-binding ()
;;   "Restore the original binding for <escape>."
;;   (when chrisnt/escape-binding
;;     (local-unset-key (kbd "<escape>"))
;;     ;; (define-key key-translation-map (kbd "<escape>") chrisnt/escape-binding)
;;     (setq chrisnt/escape-binding nil)))


;; (add-hook 'evil-insert-state-entry-hook 'chrisnt/remap-escape-in-various-evil-modes)
;; (add-hook 'evil-insert-state-exit-hook 'chrisnt/restore-escape-binding)
;; (add-hook 'evil-normal-state-entry-hook 'chrisnt/remap-escape-in-various-evil-modes)
;; (add-hook 'evil-normal-state-exit-hook 'chrisnt/restore-escape-binding)
;; (add-hook 'evil-visual-state-entry-hook 'chrisnt/remap-escape-in-various-evil-modes)
;; (add-hook 'evil-visual-state-exit-hook 'chrisnt/restore-escape-binding)
;; (add-hook 'evil-emacs-state-entry-hook 'chrisnt/remap-escape-in-various-evil-modes)
;; (add-hook 'evil-emacs-state-exit-hook 'chrisnt/restore-escape-binding)

;; Map comment to `Cmd+/' on MacOS
(define-key global-map (kbd "H-/") 'spacemacs/comment-or-uncomment-lines)
