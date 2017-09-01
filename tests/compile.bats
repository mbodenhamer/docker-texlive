#!/usr/bin/env bats
load test_helpers

@test "[$TEST_FILE] Check texlive version" {
    run launch latex --version
    [[ ${lines[0]} =~ "TeX Live ${TEXLIVE_YEAR}" ]]
}

@test "[$TEST_FILE] latex compile" {
    cp /app/tests/test.tex /tmp/test.tex
    [[ ! -e /tmp/test.dvi ]]
    run launch bash -c "latex /tmp/test.tex && mv test.dvi /tmp"
    [[ -e /tmp/test.dvi ]]
    rm -f /tmp/test.tex /tmp/test.dvi
}

@test "[$TEST_FILE] pdflatex compile" {
    cp /app/tests/test.tex /tmp/test.tex
    [[ ! -e /tmp/test.pdf ]]
    run launch bash -c "pdflatex /tmp/test.tex && mv test.pdf /tmp"
    [[ -e /tmp/test.pdf ]]
    rm -f /tmp/test.tex /tmp/test.pdf
}

@test "[$TEST_FILE] xelatex compile" {
    cp /app/tests/test.tex /tmp/test.tex
    [[ ! -e /tmp/test.pdf ]]
    run launch bash -c "xelatex /tmp/test.tex && mv test.pdf /tmp"
    [[ -e /tmp/test.pdf ]]
    rm -f /tmp/test.tex /tmp/test.pdf
}
