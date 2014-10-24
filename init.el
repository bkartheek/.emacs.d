
;;emacs configuration
(push "/usr/local/bin" exec-path)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)
(custom-set-variables '(linum-format (quote "%d  ")))
(global-linum-mode 1) ; display line numbers in margin. New in Emacs 23


(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))
 
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; Company auto completion package configuration
(add-hook 'after-init-hook 'global-company-mode)

;; Moving through the window frames with in emacs
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;;  Closing and opening parenthesis
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/smartparens"))
(require 'smartparens-config)
(smartparens-global-mode t)

;; Enhanced ruby configuration
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/enhanced-ruby-mode"))


(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'yard-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)
;; Neotree a tree interface for emacs
(require 'neotree)
(global-set-key [f8] 'neotree-toggle) ;; F8 to show treeA

;;Enable Window Numbering 
(require 'window-number)
(window-number-mode) ;; Enables short cut keys C+x, C+j [0,1,2,3]
(window-number-meta-mode) ;; M + 0 ,1,2,3 to shift to windows
(provide 'init)
