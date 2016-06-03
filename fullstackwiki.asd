(in-package :cl-user)
(defpackage fullstackwiki-asd
  (:use :cl :asdf))
(in-package :fullstackwiki-asd)

(defsystem fullstackwiki
  :version "0.1"
  :author "Pavel"
  :license "MIT"
  :depends-on (:clack
               :lack
               :caveman2
               :envy
               :cl-ppcre
               :uiop

               ;; for @route annotation
               :cl-syntax-annot

               ;; HTML Template
               :djula

               ;; for DB
               :datafly
               :sxql
               ;; Password hashing
               :cl-pass
               ;; Markdown
               :3bmd
               :3bmd-ext-wiki-links
               )
  :components ((:module "src"
                :components
                ((:file "main" :depends-on ("config" "view" "db" "model"))
                 (:file "web" :depends-on ("view" "model"))
                 (:file "view" :depends-on ("config"))
                 (:file "db" :depends-on ("config"))
                 (:file "model" :depends-on ("db")) ;; app model
                 (:file "config"))))
  :description ""
  :in-order-to ((test-op (load-op fullstackwiki-test))))
