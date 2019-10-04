;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (material-theme better-defaults pylint pug-mode markdown-preview-mode magit json-mode flycheck ensime beacon))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have


;; prereqs: `pip3 install flake8 jedi`
(defvar myPackages
  '(better-defaults
    elpy ;; add the elpy package
    material-theme))

(setq elpy-rpc-python-command "python3")

(elpy-version)
(elpy-enable)

;; to format on the fly need to
;; 1. M-x elpy-set-project-root  ;; set it to the top of the current project
;; 2. C-c C-r f ;; (elpy-format-code)

;; to type-check for python3 with type hints
;; 1. pip3 install mypy
;; the following:

(set-variable 'flycheck-python-mypy-executable "/Users/miguel/anaconda2/envs/py35/mypy/mypy")
(set-variable 'flycheck-python-mypy-args '("--py2"  "--ignore-missing-imports" "--check-untyped-defs"))

(flycheck-add-next-checker 'python-flake8 'python-mypy)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
;; Might need to: M-x jedi:install-server
