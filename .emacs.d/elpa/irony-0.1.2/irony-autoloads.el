;;; irony-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "irony" "irony.el" (21855 25414 148087 654000))
;;; Generated autoloads from irony.el

(defvar irony-additional-clang-options nil "\
Additionnal command line options to pass down to libclang.

Please, do NOT use this variable to add header search paths, only
additional warnings or compiler options.

These compiler options will be prepended to the command line, in
order to not override the value coming from a compilation
database.")

(custom-autoload 'irony-additional-clang-options "irony" t)

(defvar irony-clang-options-updated-hook nil "\
Normal hook run when the command line options have been updated.

This hook is run when the variables
`irony-header-search-directories',
`irony-clang-working-directory', etc, have been updated.")

(custom-autoload 'irony-clang-options-updated-hook "irony" t)

(autoload 'irony-mode "irony" "\
Minor mode for C, C++ and Objective-C, powered by libclang.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "irony-cdb" "irony-cdb.el" (21855 25414 64282
;;;;;;  918000))
;;; Generated autoloads from irony-cdb.el

(autoload 'irony-cdb-load-compile-options "irony-cdb" "\


\(fn)" nil nil)

(autoload 'irony-cdb-menu "irony-cdb" "\
Open the compilation database menu.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "irony-completion" "irony-completion.el" (21855
;;;;;;  25414 67206 339000))
;;; Generated autoloads from irony-completion.el

(defvar irony-completion-hook nil "\
Function called when new completion data are available.")

(custom-autoload 'irony-completion-hook "irony-completion" t)

(autoload 'irony-completion-at-point "irony-completion" "\


\(fn)" nil nil)

(autoload 'irony-completion-at-point-async "irony-completion" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("irony-pkg.el" "irony-pp.el" "irony-snippet.el")
;;;;;;  (21855 25414 158661 422000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; irony-autoloads.el ends here
