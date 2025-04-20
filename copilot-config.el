;; ---------------------------------------
;; Copilot configurations


;; accept completion from copilot and fallback to company
(use-package copilot
  ;; :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)
              ("C-n" . 'copilot-next-completion)
              ("C-p" . 'copilot-previous-completion))
  :config
  (add-to-list 'copilot-indentation-alist '(prog-mode 2))
  (add-to-list 'copilot-indentation-alist '(org-mode 2))
  (add-to-list 'copilot-indentation-alist '(text-mode 2))
  (add-to-list 'copilot-indentation-alist '(closure-mode 2))
  (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode 2))
  (add-to-list 'copilot-indentation-alist '(lisp-mode 2))
  (add-to-list 'copilot-indentation-alist '(elisp-mode 2))
  (add-to-list 'copilot-indentation-alist '(python-mode 4))
  (add-to-list 'copilot-indentation-alist '(web-mode 4))
  (add-to-list 'copilot-indentation-alist '(go-mode 4))
  (add-to-list 'copilot-indentation-alist '(json-mode 4))
  (add-to-list 'copilot-indentation-alist '(yaml-mode 2))
  (add-to-list 'copilot-indentation-alist '(+web-django-mode 4)))
