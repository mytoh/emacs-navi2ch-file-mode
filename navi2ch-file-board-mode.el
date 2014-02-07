;;; navi2ch-file-board-mode.el -*- lexical-binding: t -*-

(defvar navi2ch-file-board-category-regexp
  "\\(.+\\)\n\n\n")

(defvar navi2ch-file-board-category-face
  'font-lock-builtin-face)

(defvar navi2ch-file-board-name-regexp
  "\\(.+\\)\n\\(^http://.+\\)\n")

(defvar navi2ch-file-board-name-face
  'font-lock-variable-name-face)

(defvar navi2ch-file-board-uri-regexp
  "\\(^http://.+\\)\n")

(defvar navi2ch-file-board-uri-face
  'font-lock-constant-face)

(defvar navi2ch-file-board-id-regexp
  "\\(^http://.+\\)\n\\(.+\\)\n")

(defvar navi2ch-file-board-id-face
  'font-lock-function-name-face)

(defvar navi2ch-file-board-font-lock-keywords
  `((,navi2ch-file-board-category-regexp 1 ,navi2ch-file-board-category-face)
    (,navi2ch-file-board-name-regexp 1 ,navi2ch-file-board-name-face)
    (,navi2ch-file-board-uri-regexp 1 ,navi2ch-file-board-uri-face)
    (,navi2ch-file-board-id-regexp 2 ,navi2ch-file-board-id-face)))

(define-generic-mode  'navi2ch-file-board-mode   ;; name of the mode to create
  '() ;; comments start with
  '() ;; some keywords
  navi2ch-file-board-font-lock-keywords
  '("\\.navi2ch\\/board\\.txt$");; files for which to activate this mode
  nil                              ;; other functions to call
  "A mode for navi2ch board.txt "            ;; doc string for this mode
  )

(provide 'navi2ch-file-board-mode)

;; Local Variables:
;; coding: utf-8
;; indent-tabs-mode: nil
;; End:
