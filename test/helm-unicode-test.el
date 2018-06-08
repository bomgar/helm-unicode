
(ert-deftest helm-unicode-build-candidates-test ()
        (should (equal '("BELL 🔔" "DOWN ARROW ↓") (with-mock
                     (mock (ucs-names) => '(("DOWN ARROW" . 8595) ("BELL" . 128276))  :times 2)
                     (helm-unicode-build-candidates)))))

