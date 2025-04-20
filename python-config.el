;; ---------------------------------------
;; Python configurations

(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp))
  :commands lsp
  :custom ((lsp-ruff-server-command '("ruff" "server" "--preview")))
  :config (dolist (m '(python-mode))
            (add-to-list 'lsp-language-id-configuration `(,m . "python"))))
