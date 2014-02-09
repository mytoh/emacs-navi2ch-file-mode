;;; navi2ch-file-subject-mode.el -*- lexical-binding: t -*-

;;;; dat
(defvar navi2ch-file-subject-dat-regexp
  "\\([[:digit:]]+\\.dat\\)")
(defvar navi2ch-file-subject-dat-face
  'font-lock-function-name-face)

;;;; text
(defvar navi2ch-file-subject-text-regexp
  "\\(.+\\)([[:digit:]]+)$")
(defvar navi2ch-file-subject-text-face
  'font-lock-doc-face)

;;;; count
(defvar navi2ch-file-subject-count-regexp
  "\\((\\)\\([[:digit:]]+\\)\\()\\)$")
(defvar navi2ch-file-subject-count-face
  'font-lock-constant-face)
(defvar navi2ch-file-subject-count-sep-face
  'font-lock-comment-face)

;;;; sep
(defvar navi2ch-file-subject-sep-regexp
  (let ((sep "\\(<>\\)"))
    (concat "^"
            navi2ch-file-subject-dat-regexp
            sep
            navi2ch-file-subject-text-regexp
            )))
(defvar navi2ch-file-subject-sep-face
  'font-lock-comment-face)

(defvar navi2ch-file-subject-regexp
  (let ((sep "<>"))
    (concat "^"
            navi2ch-file-subject-dat-regexp
            sep
            navi2ch-file-subject-text-regexp)))

(defvar navi2ch-file-subject-font-lock-keywords
  `((,navi2ch-file-subject-regexp
     (1 ,navi2ch-file-subject-dat-face)
     (2 ,navi2ch-file-subject-text-face))
    (,navi2ch-file-subject-count-regexp
     (1 ,navi2ch-file-subject-count-sep-face)
     (2 ,navi2ch-file-subject-count-face)
     (3 ,navi2ch-file-subject-count-sep-face))
    (,navi2ch-file-subject-sep-regexp
     (2 ,navi2ch-file-subject-sep-face))))

(define-generic-mode  'navi2ch-file-subject-mode   ;; name of the mode to create
  '() ;; comments start with
  '() ;; some keywords
  navi2ch-file-subject-font-lock-keywords
  '("\\.navi2ch\\/.+/subject\\.txt$"
    "\\.navi2ch\\/.+/old-subject\\.txt$") ;; files for which to activate this mode
  nil                              ;; other functions to call
  "A mode for navi2ch subject.txt"            ;; doc string for this mode
  )

(provide 'navi2ch-file-subject-mode)

;; Local Variables:
;; coding: utf-8
;; indent-tabs-mode: nil
;; End:
