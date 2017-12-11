FROM registry.fedoraproject.org/f26/tools:latest

LABEL maintainer "Michael Scherer \"mscherer@\""

RUN echo """autocmd VimEnter * call AddFilenamePrefix('/host') \n\\
function! AddFilenamePrefix(pfx)                               \n\\
    let args = []                                              \n\\
    for f in argv()                                            \n\\
        if filereadable(a:pfx . f)                             \n\\
            call add(args, a:pfx . f)                          \n\\
        else                                                   \n\\
            call add(args, f)                                  \n\\
        endif                                                  \n\\
    endfor                                                     \n\\
    exe 'args' join(map(args, 'fnameescape(v:val)'))           \n\\
endfunction""" >> /etc/vimrc

