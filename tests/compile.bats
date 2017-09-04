#!/usr/bin/env bats
load test_helpers

@test "[$TEST_FILE] Check texlive version" {
    run launch latex --version
    echo ${lines[0]}
    [[ ${lines[0]} =~ "TeX Live 2017" ]]
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

@test "[$TEST_FILE] tex compile" {
    cp /app/tests/tex_test.tex /tmp/test.tex
    [[ ! -e /tmp/test.dvi ]]
    run launch bash -c "tex /tmp/test.tex && mv test.dvi /tmp"
    [[ -e /tmp/test.dvi ]]
    rm -f /tmp/test.tex /tmp/test.dvi
}

@test "[$TEST_FILE] xetex compile" {
    cp /app/tests/tex_test.tex /tmp/test.tex
    [[ ! -e /tmp/test.pdf ]]
    run launch bash -c "xetex /tmp/test.tex && mv test.pdf /tmp"
    [[ -e /tmp/test.pdf ]]
    rm -f /tmp/test.tex /tmp/test.pdf
}

@test "[$TEST_FILE] ghostscript" {
    cp /app/tests/tex_test.tex /tmp/test.tex
    [[ ! -e /tmp/test.pdf ]]
    run launch bash -c "tex /tmp/test.tex && dvips test.dvi && ps2pdf test.ps && mv test.pdf /tmp"
    [[ -e /tmp/test.pdf ]]
    rm -f /tmp/test.tex /tmp/test.pdf
}
