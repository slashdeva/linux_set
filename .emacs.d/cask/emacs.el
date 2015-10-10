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
 '(fci-rule-color "#eee8d5")
 '(gdb-many-windows t)
 '(package-archives
   (quote
	(("gnu" . "http://elpa.gnu.org/packages/")
	 ("melpa" . "http://stable.melpa.org/packages/"))))
 '(red "#ffffff")
 '(tool-bar-mode nil)
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


;(**************OS dependency**************)
(cond
 ((string-equal system-type "windows-nt")
  (progn
   (setenv "PATH"
	(concat
;	 Change this with your path to MSYS bin directory
	 "C:\\MinGW\\msys\\1.0\\bin;"
	 (getenv "PATH")))
;  windows default-directory
   (setq default-directory "C:/Users/Deva/")

;  windows set Ctrl-space to Mark
   (global-set-key [C-kanji] 'set-mark-command)))
 ((string-equal system-type "gnu/linux")
  (progn
	(setq default-directory "~/workspace")
	)))

;;eww - default search engine set
(setq eww-search-prefix                 "https://www.google.com/search?q=")
(setq eww-download-directory            "~/Downloads")

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
    (fci-mode 0)))
