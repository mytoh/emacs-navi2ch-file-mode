;;; navi2ch-file-dat-mode.el -*- lexical-binding: t -*-

;;;; name
(defvar navi2ch-file-dat-name-regexp
  "\\(.+?\\)")
(defvar navi2ch-file-dat-name-face
  'font-lock-function-name-face)

;;;; mail
(defvar navi2ch-file-dat-mail-regexp
  "\\(.*?\\)")
(defvar navi2ch-file-dat-mail-face
  'font-lock-variable-name-face)

;;;; date
(defvar navi2ch-file-dat-date-regexp
  "\\([0-9]\\{4\\}/[0-9]\\{2\\}/[0-9]\\{2\\}(.)\\)")
(defvar navi2ch-file-dat-date-face
  'font-lock-constant-face)

;;;; time
(defvar navi2ch-file-dat-time-regexp
  "\\([0-9]\\{2\\}:[0-9]\\{2\\}:[0-9]\\{2\\}.[0-9]\\{2\\}\\)")
(defvar navi2ch-file-dat-time-face
  'font-lock-keyword-face)

;;;; id-header
(defvar navi2ch-file-dat-id-header-regexp
  "\\(ID:\\)")
(defvar navi2ch-file-dat-id-header-face
  'font-lock-string-face)

;;;; id
(defvar navi2ch-file-dat-id-regexp
  "\\([[:alnum:]+/]+\\)")
(defvar navi2ch-file-dat-id-face
  'font-lock-type-face)

;;;; text
(defvar navi2ch-file-dat-text-regexp
  "\\(\\(?:.+\\|<a href=.+\\)\\)")
(defvar navi2ch-file-dat-text-face
  'font-lock-doc-face)

;;;; sep
(defvar navi2ch-file-dat-sep-regexp
  (let ((sep "\\(<>\\)"))
    (concat "^"
            navi2ch-file-dat-name-regexp
            sep
            navi2ch-file-dat-mail-regexp
            sep
            navi2ch-file-dat-date-regexp
            "\\ +"
            navi2ch-file-dat-time-regexp
            "\\ +"
            navi2ch-file-dat-id-header-regexp
            navi2ch-file-dat-id-regexp
            sep
            "\\ +"
            navi2ch-file-dat-text-regexp
            sep)))
(defvar navi2ch-file-dat-sep-face
  'font-lock-comment-face)

(defvar navi2ch-file-dat-regexp
  (let ((sep "<>"))
    (concat "^"
            navi2ch-file-dat-name-regexp
            sep
            navi2ch-file-dat-mail-regexp
            sep
            navi2ch-file-dat-date-regexp
            "\\ +"
            navi2ch-file-dat-time-regexp
            "\\ +"
            navi2ch-file-dat-id-header-regexp
            navi2ch-file-dat-id-regexp
            sep
            "\\ +"
            navi2ch-file-dat-text-regexp
            sep
            )))

(defvar navi2ch-file-dat-font-lock-keywords
  `((,navi2ch-file-dat-regexp (1 ,navi2ch-file-dat-name-face)
                              (2 ,navi2ch-file-dat-mail-face)
                              (3 ,navi2ch-file-dat-date-face)
                              (4 ,navi2ch-file-dat-time-face)
                              (5 ,navi2ch-file-dat-id-header-face)
                              (6 ,navi2ch-file-dat-id-face)
                              (7 ,navi2ch-file-dat-text-face))
    (,navi2ch-file-dat-sep-regexp
     (2 ,navi2ch-file-dat-sep-face append)
     (4 ,navi2ch-file-dat-sep-face append)
     (9 ,navi2ch-file-dat-sep-face append)
     (11 ,navi2ch-file-dat-sep-face append))))

(define-generic-mode  'navi2ch-file-dat-mode   ;; name of the mode to create
  '() ;; comments start with
  '() ;; some keywords
  navi2ch-file-dat-font-lock-keywords
  '("\\.navi2ch\\/.+\\.dat$") ;; files for which to activate this mode
  nil                              ;; other functions to call
  "A mode for navi2ch dat files"            ;; doc string for this mode
  )

(provide 'navi2ch-file-dat-mode)

;; Local Variables:
;; coding: utf-8
;; indent-tabs-mode: nil
;; End:
