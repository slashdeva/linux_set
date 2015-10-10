;;ecb - set

(ecb-layout-name "right1")
(ecb-options-version "2.40")
(ecb-source-path (quote (("/" "/"))))
(ecb-windows-width 0.15)


(setq ecb-auto-activate 'true)
(setq stack-trace-on-error t)

(add-hook 'ecb-activate-hook (lambda () (ecb-redraw-layout)))
(add-hook 'ecb-activate-hook
		  (lambda () (modify-all-frames-parameters '((width . 120)))))
