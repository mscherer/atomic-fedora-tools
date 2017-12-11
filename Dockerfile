FROM registry.fedoraproject.org/f26/tools:latest

LABEL maintainer "Michael Scherer \"mscherer@\""

RUN echo """autocmd VimEnter * call AddFilenamePrefix('/host') \
function! AddFilenamePrefix(pfx)                               \
    let args = []                                              \
    for f in argv()                                            \
        if filereadable(a:pfx . f)                             \
            call add(args, a:pfx . f)                          \
        else                                                   \
            call add(args, f)                                  \
        endif                                                  \
    endfor                                                     \
    exe 'args' join(map(args, 'fnameescape(v:val)'))           \
endfunction""" >> /etc/vimrc

