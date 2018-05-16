;;; package --- Summary
;;; just a summary

;;; Commentary:
;;;
;; Some cool tricks:
;; what-cursor-position          C-x =
;;    Print info on cursor position (on screen and within buffer).

;;; Searches are case insensitive unless you toggle the behavior with M-c during the search
;;; cf.  https://www.gnu.org/software/emacs/manual/html_node/efaq/Controlling-case-sensitivity.html
(setq case-fold-search t) ; make searches case insensitive

;;; Code:
(set-face-attribute 'default nil :height 180)

(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq js-indent-level 2)
(setq js2-basic-offset 2)
(setq tab-width 4)

(set-cursor-color "#ffffff")

(global-set-key (kbd "C-x .") 'other-window)
(global-set-key (kbd "C-x ,") 'previous-multiframe-window)


;; cf. https://github.com/brettlangdon/jsfmt.el and save jsfmt.el inside of ~./emacs.d
(load "~/.emacs.d/jsfmt")
(add-hook 'before-save-hook 'jsfmt-before-save)

;; cf. http://web-mode.org/ and save https://github.com/fxbois/web-mode/blob/master/web-mode.el to  ~./emacs.d/web-mode.el

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(package-selected-packages
   (quote
    (go-guru go-mode go-rename go-direx gometalinter json-mode markdown-mode+ pug-mode flycheck beacon))))

;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
;;         ;;(setq flycheck-gometalinter-vendor t)
;; only show errors
;; (setq flycheck-gometalinter-errors-only t)
;; only run fast linters
;; (setq flycheck-gometalinter-fast t)
;; use in tests files
;;          ;;(setq flycheck-gometalinter-test t)
;; disable linters
(setq flycheck-gometalinter-disable-linters '("golint"))
;; Only enable selected linters
;;          ;;(setq flycheck-gometalinter-disable-all t)
;;(setq flycheck-gometalinter-enable-linters '("golint"))
;; Set different deadline (default: 5s)
;;(setq flycheck-gometalinter-deadline "10s")

(add-hook 'before-save-hook 'gofmt-before-save)

(setq-default tab-width 2)

;; (setq js2-mode-hook
;;      '(lambda () (progn
;;                    (set-variable 'indent-tabs-mode nil)))
;; This tab override shouldn't be necessary given ido's default
;; configuration, but minibuffer-complete otherwise dominates the
;; tab binding because of my custom tab-completion-everywhere
;; configuration.

(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)
(package-initialize)
(package-refresh-contents)
(package-install 'pug-mode)
(package-install 'flycheck)
(package-install 'beacon)
(global-flycheck-mode)


;; (require 'auto-complete-config)
;; (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
          ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; define auto complete for go:
;;(defun auto-complete-for-go ()
;;  (auto-complete-mode 1))
;;(add-hook 'go-mode-hook 'auto-complete-for-go)

;;(with-eval-after-load 'go-mode
;;  (require 'go-autocomplete))

(load "~/.emacs.d/web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[aj]s[cp]?x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  )
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)


(beacon-mode 1)
(setq beacon-push-mark 35)
(setq beacon-color "#666600")

(setq tab-width 4)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; .emacs ends here
(put 'upcase-region 'disabled nil)
