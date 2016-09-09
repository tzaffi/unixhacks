(set-face-attribute 'default nil :height 180)

(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have                                                                                                                                                                                                                                                                                                                                                                        
(setq js-indent-level 2)
(setq js2-basic-offset 2)

(set-cursor-color "#ffffff")

(global-set-key (kbd "C-x .") 'other-window)
(global-set-key (kbd "C-x ,") 'previous-multiframe-window)

(custom-set-variables
 ;; custom-set-variables was added by Custom.                                                                                                                                                                                                                                                                                                                                                                                            
 ;; If you edit it by hand, you could mess it up, so be careful.                                                                                                                                                                                                                                                                                                                                                                         
 ;; Your init file should contain only one such instance.                                                                                                                                                                                                                                                                                                                                                                                
 ;; If there is more than one, they won't work right.                                                                                                                                                                                                                                                                                                                                                                                    
 '(indent-tabs-mode nil))

;; (setq js2-mode-hook                                                                                                                                                                                                                                                                                                                                                                                                                   
;;      '(lambda () (progn                                                                                                                                                                                                                                                                                                                                                                                                               
;;                    (set-variable 'indent-tabs-mode nil))))                                                                                                                                                                                                                                                                                                                                                                            

;; This tab override shouldn't be necessary given ido's default                                                                                                                                                                                                                                                                                                                                                                          
;; configuration, but minibuffer-complete otherwise dominates the                                                                                                                                                                                                                                                                                                                                                                        
;; tab binding because of my custom tab-completion-everywhere                                                                                                                                                                                                                                                                                                                                                                            
;; configuration.                                                                                                                                                                                                                                                                                                                                                                                                                        
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))

(when (>= emacs-major-version 24)
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
    (exec-path-from-shell-initialize))

  )

(beacon-mode 1)
(setq beacon-push-mark 35)
(setq beacon-color "#666600")
;;; .emacs ends here            
