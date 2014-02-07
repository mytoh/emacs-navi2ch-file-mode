;;; navi2ch-file-etc-mode.el -*- lexical-binding: t -*-

(defvar navi2ch-file-etc-name-regexp
  "\\(.+\\)\n\\(^http://.+\\)\n")

(defvar navi2ch-file-etc-name-face
  'font-lock-variable-name-face)

(defvar navi2ch-file-etc-uri-regexp
  "\\(^http://.+\\)\n")

(defvar navi2ch-file-etc-uri-face
  'font-lock-constant-face)

(defvar navi2ch-file-etc-id-regexp
  "\\(^http://.+\\)\n\\(.+\\)\n")

(defvar navi2ch-file-etc-id-face
  'font-lock-function-name-face)

(defvar navi2ch-file-etc-font-lock-keywords
  `((,navi2ch-file-etc-name-regexp 1 ,navi2ch-file-etc-name-face)
    (,navi2ch-file-etc-uri-regexp 1 ,navi2ch-file-etc-uri-face)
    (,navi2ch-file-etc-id-regexp 2 ,navi2ch-file-etc-id-face)))

(define-generic-mode  'navi2ch-file-etc-mode   ;; name of the mode to create
  '() ;; comments start with
  '() ;; some keywords
  navi2ch-file-etc-font-lock-keywords
  '("\\.navi2ch\\/etc\\.txt$");; files for which to activate this mode
  nil                              ;; other functions to call
  "A mode for navi2ch etc.txt "            ;; doc string for this mode
  )

(provide 'navi2ch-file-etc-mode)

;; Local Variables:
;; coding: utf-8
;; indent-tabs-mode: nil
;; End:
