
(ert-deftest helm-unicode-build-candidates-test ()
  (should (equal '("BELL 🔔" "DOWN ARROW ↓") (with-mock
                                              (mock (ucs-names) => '(("DOWN ARROW" . 8595) ("BELL" . 128276)))
                                              (helm-unicode-build-candidates)))))

(ert-deftest helm-unicode-build-candidates-test-emacs26 ()
  (let ((myHash (make-hash-table :test 'equal)))
    (puthash "DOWN ARROW" 8595 myHash)
    (puthash "BELL" 128276 myHash)
    (should (equal '("BELL 🔔" "DOWN ARROW ↓") (with-mock
                                                (mock (ucs-names) => myHash)
                                                (with-mock
                                                 (mock (hash-table-keys myHash) => '("DOWN ARROW" "BELL"))
                                                 (helm-unicode-build-candidates)))))))

