(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("/" "/"))))
 '(ecb-windows-width 0.15)
 '(fci-rule-color "#eee8d5")
 '(gdb-many-windows t)
 '(package-archives
   (quote
	(("gnu" . "http://elpa.gnu.org/packages/")
	 ("melpa" . "http://stable.melpa.org/packages/"))))
 '(red "#ffffff")
 '(send-mail-function nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
	((20 . "#dc322f")
	 (40 . "#cb4b16")
	 (60 . "#b58900")
	 (80 . "#859900")
	 (100 . "#2aa198")
	 (120 . "#268bd2")
	 (140 . "#d33682")
	 (160 . "#6c71c4")
	 (180 . "#dc322f")
	 (200 . "#cb4b16")
	 (220 . "#b58900")
	 (240 . "#859900")
	 (260 . "#2aa198")
	 (280 . "#268bd2")
	 (300 . "#d33682")
	 (320 . "#6c71c4")
	 (340 . "#dc322f")
	 (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; *add package item which i want
(add-to-list 'load-path "~/.emacs.d/plugins/fill-column-indicator")
(require 'fill-column-indicator)
(add-to-list 'load-path "~/.emacs.d/plugins/cedet")
(require 'cedet)
(require 'semantic/analyze)
(provide 'semantic-analyze)
(provide 'semantic-ctxt)
(provide 'semanticdb)
(provide 'semanticdb-find)
(provide 'semanticdb-mode)
(provide 'semantic-load)
(add-to-list 'load-path "~/.emacs.d/plugins/ecb")
(require 'ecb)
(add-to-list 'load-path "~/.emacs.d/plugins/fill-column-indicator")
(require 'fill-column-indicator)
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/popup")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path "~/.emacs.d/plugins/ac-etags")
(require 'auto-complete-etags)
(require 'cc-mode)

;; **fnkey set
(global-set-key [f1] 'man)
(global-set-key [f2] 'rgrep)
(global-set-key [f3] 'eww)
(global-set-key [f4] 'query-replace)
(global-set-key [f5] 'compile)
(global-set-key [f6] 'create-tags)
(global-set-key [f7] 'previous-error)
(global-set-key [f8] 'next-error)
(global-set-key [f9] 'gnus)
(global-set-key [f10] 'eshell)

;;emacs base set
(global-linum-mode 1)
(global-hl-line-mode 1)

;;eww - default search engine set
(setq eww-search-prefix                 "https://www.google.com/search?q=")
(setq eww-download-directory            "~/Downloads")

;;ecb - set
(setq ecb-auto-activate 'true)
(setq stack-trace-on-error t)

;;etags -set
(defun create-tags (dir-name ext-regex)
  "Create tags file."
  (interactive "DDirectory: \nsSource extension regex (ex: [chCH]): ")
  (shell-command
   (format "find %s -type f -iname \"*.%s\" | xargs etags -" dir-name ext-regex)))

;; set fill Column Indicator
(setq fci-rule-color "red")

(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
(setq fci-rule-width 1)
(setq-default fci-rule-column 80)
(setq fci-handle-truncate-lines nil)
(add-hook 'after-change-major-mode-hook 'auto-fci-mode)
(add-hook 'window-size-change-functions 'auto-fci-mode)


(defun auto-fci-mode(&optional unused)
  (if (> (frame-width) 80)
      (fci-mode 1)
    (fci-mode 0)
  )
)

;;cc mode indent set

(when (load "c-mode" t)
  (defun flymake-cc-mode()))
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)


;;python-mode - flymake and pep8

(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "pep8" (list "--repeat" local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.py\\'" flymake-pylint-init)))

(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)
