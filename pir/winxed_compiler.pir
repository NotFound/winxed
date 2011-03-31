# Begin generated code

.namespace [ ]

.sub 'isspace'
        .param string __ARG_1
# Body
# {
.annotate 'file', 'winxedst1.winxed'
.annotate 'line', 13
    iseq $I1, __ARG_1, ' '
    if $I1 goto __label_1
    iseq $I1, __ARG_1, "\n"
 __label_1:
    if $I1 goto __label_0
    iseq $I1, __ARG_1, "\t"
 __label_0:
    .return($I1)
# }
.annotate 'line', 14

.end # isspace


.sub 'isdigit'
        .param string __ARG_1
# Body
# {
.annotate 'line', 18
# predefined indexof
    index $I2, '0123456789', __ARG_1
    isgt $I1, $I2, -1
    .return($I1)
# }
.annotate 'line', 19

.end # isdigit


.sub 'hexdigit'
        .param string __ARG_1
# Body
# {
.annotate 'line', 23
# i: $I1
# predefined indexof
    index $I1, '0123456789abcdef0123456789ABCDEF', __ARG_1
.annotate 'line', 24
    lt $I1, 0, __label_0
    mod $I1, $I1, 16
 __label_0: # endif
.annotate 'line', 25
    .return($I1)
# }
.annotate 'line', 26

.end # hexdigit


.sub 'isidentstart'
        .param string __ARG_1
# Body
# {
.annotate 'line', 33
# predefined indexof
.annotate 'line', 30
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', __ARG_1
.annotate 'line', 33
    isgt $I1, $I2, -1
.annotate 'line', 30
    .return($I1)
# }
.annotate 'line', 34

.end # isidentstart


.sub 'isident'
        .param string __ARG_1
# Body
# {
.annotate 'line', 42
# predefined indexof
.annotate 'line', 38
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_$0123456789', __ARG_1
.annotate 'line', 42
    isgt $I1, $I2, -1
.annotate 'line', 38
    .return($I1)
# }
.annotate 'line', 43

.end # isident

# Constant ERRORinternal evaluated at compile time
# Constant ERRORtokenizer evaluated at compile time
# Constant ERRORparser evaluated at compile time

.sub 'Warn'
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 57
# var stderr: $P1
# predefined getstderr
    getstderr $P1
.annotate 'line', 58
    $P1.'print'('WARNING: ')
.annotate 'line', 59
    $P1.'print'(__ARG_1)
.annotate 'line', 60
    unless __ARG_3 goto __label_0
# {
.annotate 'line', 61
    $P1.'print'(' near ')
.annotate 'line', 62
    $P2 = __ARG_2.'show'()
    $P1.'print'($P2)
# }
 __label_0: # endif
.annotate 'line', 64
    $P1.'print'("\n")
# }
.annotate 'line', 65

.end # Warn


.sub 'InternalError'
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 69
    unless __ARG_3 goto __label_0
# {
.annotate 'line', 70
# desc: $S1
    $P1 = __ARG_2.'show'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 71
    concat $S0, __ARG_1, ' near '
    concat $S0, $S0, $S1
    set __ARG_1, $S0
# }
 __label_0: # endif
.annotate 'line', 73
# predefined Error
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = __ARG_1
    $P1['severity'] = 2
    $P1['type'] = 555
    throw $P1
# }
.annotate 'line', 74

.end # InternalError


.sub 'TokenError'
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 78
# predefined string
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
# predefined string
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
# predefined Error
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 556
    throw $P1
# }
.annotate 'line', 80

.end # TokenError


.sub 'SyntaxError'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 84
# sline: $S1
    getattribute $P1, __ARG_2, 'line'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 85
# file: $S2
    getattribute $P1, __ARG_2, 'file'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 86
# desc: $S3
    $P1 = __ARG_2.'viewable'()
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 87
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' near '
    concat $S4, $S4, $S3
# predefined Error
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 557
    throw $P1
# }
.annotate 'line', 89

.end # SyntaxError


.sub 'Expected'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 93
    concat $S1, "Expected ", __ARG_1
    'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 94

.end # Expected


.sub 'ExpectedIdentifier'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 98
    'SyntaxError'("Expected identifier", __ARG_1)
# }
.annotate 'line', 99

.end # ExpectedIdentifier


.sub 'ExpectedOp'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 103
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 104

.end # ExpectedOp


.sub 'RequireOp'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 108
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_0
.annotate 'line', 109
    'ExpectedOp'(__ARG_1, __ARG_2)
 __label_0: # endif
# }
.annotate 'line', 110

.end # RequireOp


.sub 'RequireKeyword'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 114
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_0
.annotate 'line', 115
    'ExpectedOp'(__ARG_1, __ARG_2)
 __label_0: # endif
# }
.annotate 'line', 116

.end # RequireKeyword


.sub 'RequireIdentifier'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 120
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_0
.annotate 'line', 121
    'ExpectedIdentifier'(__ARG_1)
 __label_0: # endif
# }
.annotate 'line', 122

.end # RequireIdentifier


.sub 'ExpectOp'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 126
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 127
    'RequireOp'(__ARG_1, $P1)
# }
.annotate 'line', 128

.end # ExpectOp


.sub 'ExpectKeyword'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 132
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 133
    'RequireKeyword'(__ARG_1, $P1)
# }
.annotate 'line', 134

.end # ExpectKeyword

.namespace [ 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 146
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 147
    box $P1, __ARG_2
    setattribute self, 'line', $P1
# }
.annotate 'line', 148

.end # Token


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 151
    .return(1)
# }
.annotate 'line', 152

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 155
    .return(1)
# }
.annotate 'line', 156

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 158
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 159
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 160
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method
# Body
# {
.annotate 'line', 161
    .return(0)
# }

.end # isint


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 162
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method
# Body
# {
.annotate 'line', 163
    .return(0)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 167
    'InternalError'('Not a literal string', self)
# }
.annotate 'line', 168

.end # rawstring


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 171
    'ExpectedIdentifier'(self)
# }
.annotate 'line', 172

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 173
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 174
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 175
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 176
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 177
    .return('(unknown)')
# }

.end # viewable


.sub 'show' :method
# Body
# {
.annotate 'line', 180
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 181
# predefined string
    getattribute $P1, self, 'file'
    set $S2, $P1
# predefined string
    getattribute $P2, self, 'line'
    set $S3, $P2
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
# }
.annotate 'line', 182

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Token' ]
.annotate 'line', 142
    addattribute $P0, 'file'
.annotate 'line', 143
    addattribute $P0, 'line'
.end
.namespace [ 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 189
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 190

.end # TokenEof


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 193
    .return(0)
# }
.annotate 'line', 194

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 197
    .return(0)
# }
.annotate 'line', 198

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 199
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 200
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenEof' ]
.annotate 'line', 185
    get_class $P1, [ 'Token' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenWithVal' ]

.sub 'TokenWithVal' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 208
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 209
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 210

.end # TokenWithVal


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 211
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
# Body
# {
.annotate 'line', 214
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 215

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenWithVal' ]
.annotate 'line', 203
    get_class $P1, [ 'Token' ]
    addparent $P0, $P1
.annotate 'line', 205
    addattribute $P0, 'str'
.end
.namespace [ 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 222
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 223

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 224
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenComment' ]
.annotate 'line', 218
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenOp' ]

.sub 'TokenOp' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 231
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 232

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 235
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 236

.end # isop


.sub 'checkop' :method
# Body
# {
# predefined string
.annotate 'line', 239
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
# }
.annotate 'line', 240

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenOp' ]
.annotate 'line', 227
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 247
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 248

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 249
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 252
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 253

.end # getidentifier


.sub 'checkkeyword' :method
# Body
# {
# predefined string
.annotate 'line', 256
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
# }
.annotate 'line', 257

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 260
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 261

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenIdentifier' ]
.annotate 'line', 243
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenString' ]

.sub 'isstring' :method
# Body
# {
.annotate 'line', 266
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 269
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 270

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenString' ]
.annotate 'line', 264
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenQuoted' ]

.sub 'TokenQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 277
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 278

.end # TokenQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 281
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 282

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 285
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 286

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 289
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 290

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenQuoted' ]
.annotate 'line', 273
    get_class $P1, [ 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 297
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 298

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 301
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 302

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 305
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 306

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 309
# s: $S1
    set $S1, ''
.annotate 'line', 310
    getattribute $P1, self, 'str'
    iter $P2, $P1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $S2, $P2
# {
.annotate 'line', 311
    set $S3, $S2
    set $S4, '"'
    if $S3 == $S4 goto __label_4
    set $S4, '\'
    if $S3 == $S4 goto __label_5
    set $S4, "'"
    if $S3 == $S4 goto __label_6
    goto __label_3
# switch
 __label_4: # case
 __label_5: # case
 __label_6: # case
.annotate 'line', 315
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_2 # break
 __label_3: # default
 __label_2: # switch end
.annotate 'line', 318
    concat $S1, $S1, $S2
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 320
    .return($S1)
# }
.annotate 'line', 321

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenSingleQuoted' ]
.annotate 'line', 293
    get_class $P1, [ 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenInteger' ]

.sub 'TokenInteger' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 328
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 329

.end # TokenInteger


.sub 'isint' :method
# Body
# {
.annotate 'line', 330
    .return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenInteger' ]
.annotate 'line', 324
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenFloat' ]

.sub 'TokenFloat' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 337
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 338

.end # TokenFloat


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 339
    .return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenFloat' ]
.annotate 'line', 333
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'getquoted'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 349
# s: $S1
    set $S1, ''
.annotate 'line', 350
# c: $S2
    null $S2
# for loop
.annotate 'line', 351
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
 __label_2: # for condition
    eq $S2, '"', __label_1
# {
.annotate 'line', 352
    set $S4, $S2
    set $S5, ""
    if $S4 == $S5 goto __label_5
    set $S5, "\n"
    if $S4 == $S5 goto __label_6
    set $S5, '\'
    if $S4 == $S5 goto __label_7
    goto __label_4
# switch
 __label_5: # case
 __label_6: # case
.annotate 'line', 355
    'TokenError'('Unterminated string', __ARG_1, __ARG_3)
 __label_7: # case
.annotate 'line', 358
# c2: $S3
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
 __label_8:
.annotate 'line', 359
    iseq $I1, $S3, ''
    if $I1 goto __label_10
    iseq $I1, $S3, "\n"
 __label_10:
    unless $I1 goto __label_9
.annotate 'line', 360
    'TokenError'('Unterminated string', __ARG_1, __ARG_3)
 __label_9: # endif
.annotate 'line', 361
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 364
    concat $S1, $S1, $S2
 __label_3: # switch end
# }
 __label_0: # for iteration
.annotate 'line', 351
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_2
 __label_1: # for end
.annotate 'line', 367
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 368

.end # getquoted


.sub 'getsinglequoted'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 372
# s: $S1
    set $S1, ''
.annotate 'line', 373
# c: $S2
    null $S2
# for loop
.annotate 'line', 374
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
 __label_2: # for condition
    eq $S2, "'", __label_1
# {
.annotate 'line', 375
    iseq $I1, $S2, ""
    if $I1 goto __label_4
    iseq $I1, $S2, "\n"
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 376
    'TokenError'('Unterminated string', __ARG_1, __ARG_3)
 __label_3: # endif
.annotate 'line', 377
    concat $S1, $S1, $S2
# }
 __label_0: # for iteration
.annotate 'line', 374
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_2
 __label_1: # for end
.annotate 'line', 379
    new $P2, [ 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 380

.end # getsinglequoted


.sub 'getheredoc'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 384
# mark: $S1
    set $S1, ''
.annotate 'line', 385
# c: $S2
    null $S2
# for loop
.annotate 'line', 386
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
 __label_2: # for condition
    eq $S2, "\n", __label_1
# {
.annotate 'line', 387
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_5
    set $S6, '"'
    if $S5 == $S6 goto __label_6
    set $S6, '\'
    if $S5 == $S6 goto __label_7
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 389
    'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
 __label_6: # case
 __label_7: # case
.annotate 'line', 394
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_3 # break
 __label_4: # default
 __label_3: # switch end
.annotate 'line', 397
    concat $S0, $S1, $S2
    set $S1, $S0
# }
 __label_0: # for iteration
.annotate 'line', 386
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_2
 __label_1: # for end
.annotate 'line', 399
    concat $S0, $S1, ':>>'
    set $S1, $S0
.annotate 'line', 401
# content: $S3
    set $S3, ''
.annotate 'line', 402
# line: $S4
    null $S4
 __label_8: # do
.annotate 'line', 403
# {
.annotate 'line', 404
    set $S4, ''
# for loop
.annotate 'line', 405
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
 __label_13: # for condition
    eq $S2, "\n", __label_12
# {
.annotate 'line', 406
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_16
    set $S6, '"'
    if $S5 == $S6 goto __label_17
    set $S6, '\'
    if $S5 == $S6 goto __label_18
    goto __label_15
# switch
 __label_16: # case
.annotate 'line', 408
    'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
 __label_17: # case
 __label_18: # case
.annotate 'line', 411
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_14 # break
 __label_15: # default
 __label_14: # switch end
.annotate 'line', 414
    concat $S4, $S4, $S2
# }
 __label_11: # for iteration
.annotate 'line', 405
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_13
 __label_12: # for end
.annotate 'line', 416
    eq $S4, $S1, __label_19
.annotate 'line', 417
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
 __label_19: # endif
# }
 __label_10: # continue
.annotate 'line', 418
    ne $S4, $S1, __label_8
 __label_9: # enddo
.annotate 'line', 419
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 420

.end # getheredoc


.sub 'getident'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 424
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 425
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
 __label_0:
 __label_2: # while
.annotate 'line', 426
    $P1 = 'isident'($S2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 427
    concat $S1, $S1, $S2
.annotate 'line', 428
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_2
 __label_1: # endwhile
.annotate 'line', 430
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 431
    new $P2, [ 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 432

.end # getident


.sub 'getnumber'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 436
# s: $S1
    null $S1
.annotate 'line', 437
# c: $S2
    set $S2, __ARG_2
 __label_0: # do
.annotate 'line', 438
# {
.annotate 'line', 439
    concat $S1, $S1, $S2
.annotate 'line', 440
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
 __label_2: # continue
.annotate 'line', 441
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_1
    if $P1 goto __label_0
 __label_1: # enddo
.annotate 'line', 442
    iseq $I3, $S1, '0'
    unless $I3 goto __label_4
    iseq $I3, $S2, 'x'
    if $I3 goto __label_5
    iseq $I3, $S2, 'X'
 __label_5:
 __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 443
# hexval: $I1
    null $I1
# h: $I2
    null $I2
.annotate 'line', 444
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
 __label_7: # while
.annotate 'line', 445
    $P1 = 'hexdigit'($S2)
    set $I2, $P1
    lt $I2, 0, __label_6
# {
.annotate 'line', 446
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 447
    concat $S1, $S1, $S2
.annotate 'line', 448
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_7
 __label_6: # endwhile
.annotate 'line', 450
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 451
    set $S1, $I1
.annotate 'line', 452
    new $P2, [ 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
 __label_3: # endif
.annotate 'line', 454
    ne $S2, '.', __label_8
# {
 __label_10: # do
.annotate 'line', 455
# {
.annotate 'line', 456
    concat $S1, $S1, $S2
.annotate 'line', 457
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
 __label_12: # continue
.annotate 'line', 458
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_11
    if $P1 goto __label_10
 __label_11: # enddo
.annotate 'line', 459
    iseq $I3, $S2, 'e'
    if $I3 goto __label_14
    iseq $I3, $S2, 'E'
 __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 460
    concat $S1, $S1, 'E'
.annotate 'line', 461
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_16
    iseq $I3, $S2, '-'
 __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 462
    concat $S1, $S1, $S2
.annotate 'line', 463
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
 __label_15: # endif
 __label_18: # while
.annotate 'line', 465
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_17
    unless $P1 goto __label_17
# {
.annotate 'line', 466
    concat $S1, $S1, $S2
.annotate 'line', 467
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_18
 __label_17: # endwhile
# }
 __label_13: # endif
.annotate 'line', 470
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 471
    new $P2, [ 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_9
 __label_8: # else
# {
.annotate 'line', 474
    iseq $I3, $S2, 'e'
    if $I3 goto __label_21
    iseq $I3, $S2, 'E'
 __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 475
    concat $S1, $S1, 'E'
.annotate 'line', 476
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_23
    iseq $I3, $S2, '-'
 __label_23:
    unless $I3 goto __label_22
# {
.annotate 'line', 477
    concat $S1, $S1, $S2
.annotate 'line', 478
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
 __label_22: # endif
 __label_25: # while
.annotate 'line', 480
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_24
    unless $P1 goto __label_24
# {
.annotate 'line', 481
    concat $S1, $S1, $S2
.annotate 'line', 482
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_25
 __label_24: # endwhile
.annotate 'line', 484
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 485
    new $P2, [ 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_20
 __label_19: # else
# {
.annotate 'line', 488
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 489
    new $P2, [ 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
 __label_20: # endif
# }
 __label_9: # endif
# }
.annotate 'line', 492

.end # getnumber


.sub 'getlinecomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 496
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 497
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
 __label_0:
 __label_2: # while
.annotate 'line', 498
    isne $I1, $S2, ''
    unless $I1 goto __label_3
    isne $I1, $S2, "\n"
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 499
    concat $S1, $S1, $S2
.annotate 'line', 500
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_2
 __label_1: # endwhile
.annotate 'line', 502
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 503

.end # getlinecomment


.sub 'getcomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 507
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 508
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
 __label_0:
 __label_1: # do
.annotate 'line', 509
# {
 __label_5: # while
.annotate 'line', 510
    isne $I1, $S2, ''
    unless $I1 goto __label_6
    isne $I1, $S2, '*'
 __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 511
    concat $S1, $S1, $S2
.annotate 'line', 512
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_5
 __label_4: # endwhile
.annotate 'line', 514
    ne $S2, '', __label_7
.annotate 'line', 515
    'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
 __label_7: # endif
.annotate 'line', 516
    concat $S1, $S1, $S2
.annotate 'line', 517
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 518
    ne $S2, '', __label_8
.annotate 'line', 519
    'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
 __label_8: # endif
# }
 __label_3: # continue
.annotate 'line', 520
    ne $S2, '/', __label_1
 __label_2: # enddo
.annotate 'line', 521
    concat $S1, $S1, '/'
.annotate 'line', 522
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 523

.end # getcomment


.sub 'getop'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 527
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 528
    new $P2, [ 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 529

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 545
.const 'Sub' $P2 = 'getop'
.annotate 'line', 547
    setattribute self, 'h', __ARG_1
.annotate 'line', 548
    box $P3, ''
    setattribute self, 'pending', $P3
.annotate 'line', 549
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P4
.annotate 'line', 550
    box $P3, __ARG_2
    setattribute self, 'filename', $P3
.annotate 'line', 551
    box $P3, 1
    setattribute self, 'line', $P3
.annotate 'line', 552
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 553
    root_new $P3, ['parrot';'Hash']
    get_hll_global $P4, 'getident'
    $P3[''] = $P4
    $P3['{'] = $P2
    $P1['$'] = $P3
    get_hll_global $P5, 'getquoted'
    $P1['"'] = $P5
    get_hll_global $P6, 'getsinglequoted'
    $P1["'"] = $P6
.annotate 'line', 556
    root_new $P7, ['parrot';'Hash']
.annotate 'line', 557
    root_new $P8, ['parrot';'Hash']
    $P8[''] = $P2
    $P8['='] = $P2
    $P7['='] = $P8
    $P7[':'] = $P2
    $P1['='] = $P7
.annotate 'line', 560
    root_new $P9, ['parrot';'Hash']
    $P9['+'] = $P2
    $P9['='] = $P2
    $P1['+'] = $P9
.annotate 'line', 561
    root_new $P10, ['parrot';'Hash']
    $P10['-'] = $P2
    $P10['='] = $P2
    $P1['-'] = $P10
.annotate 'line', 562
    root_new $P11, ['parrot';'Hash']
    $P11['='] = $P2
    $P1['*'] = $P11
.annotate 'line', 563
    root_new $P12, ['parrot';'Hash']
    $P12['|'] = $P2
    $P1['|'] = $P12
.annotate 'line', 564
    root_new $P13, ['parrot';'Hash']
    $P13['&'] = $P2
    $P1['&'] = $P13
.annotate 'line', 565
    root_new $P14, ['parrot';'Hash']
.annotate 'line', 566
    root_new $P15, ['parrot';'Hash']
    $P15[''] = $P2
    get_hll_global $P16, 'getheredoc'
    $P15[':'] = $P16
    $P14['<'] = $P15
    $P14['='] = $P2
    $P1['<'] = $P14
.annotate 'line', 569
    root_new $P17, ['parrot';'Hash']
    $P17['>'] = $P2
    $P17['='] = $P2
    $P1['>'] = $P17
.annotate 'line', 570
    root_new $P18, ['parrot';'Hash']
.annotate 'line', 571
    root_new $P19, ['parrot';'Hash']
    $P19[''] = $P2
    $P19['='] = $P2
    $P18['='] = $P19
    $P1['!'] = $P18
.annotate 'line', 573
    root_new $P20, ['parrot';'Hash']
    $P20['%'] = $P2
    $P20['='] = $P2
    $P1['%'] = $P20
.annotate 'line', 574
    root_new $P21, ['parrot';'Hash']
    $P21['='] = $P2
    get_hll_global $P22, 'getlinecomment'
    $P21['/'] = $P22
    get_hll_global $P23, 'getcomment'
    $P21['*'] = $P23
    $P1['/'] = $P21
    get_hll_global $P24, 'getlinecomment'
    $P1['#'] = $P24
.annotate 'line', 577
    setattribute self, 'select', $P1
# }
.annotate 'line', 578

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 581
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 582
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 583
    eq $S1, '', __label_1
.annotate 'line', 584
    assign $P1, ''
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 586
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 587
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 588
    ne $S1, "\n", __label_3
# {
.annotate 'line', 589
# l: $I1
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 590
    inc $I1
.annotate 'line', 591
    box $P3, $I1
    setattribute self, 'line', $P3
# }
 __label_3: # endif
# }
 __label_2: # endif
.annotate 'line', 594
    .return($S1)
# }
.annotate 'line', 595

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 598
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 599

.end # ungetchar


.sub 'get_token' :method
# Body
# {
.annotate 'line', 602
.const 'Sub' $P4 = 'isspace'
.annotate 'line', 603
.const 'Sub' $P5 = 'isidentstart'
.annotate 'line', 604
.const 'Sub' $P6 = 'isdigit'
.annotate 'line', 605
.const 'Sub' $P7 = 'getop'
.annotate 'line', 606
.const 'Sub' $P8 = 'getident'
.annotate 'line', 607
.const 'Sub' $P9 = 'getnumber'
.annotate 'line', 609
    getattribute $P10, self, 'stacked'
    if_null $P10, __label_0
    unless $P10 goto __label_0
# {
.annotate 'line', 610
# var t: $P1
    getattribute $P11, self, 'stacked'
    $P1 = $P11.'pop'()
.annotate 'line', 611
    .return($P1)
# }
 __label_0: # endif
.annotate 'line', 613
# c: $S1
    $P10 = self.'getchar'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
 __label_1:
 __label_3: # while
.annotate 'line', 614
    $P10 = $P4($S1)
    if_null $P10, __label_2
    unless $P10 goto __label_2
.annotate 'line', 615
    $P11 = self.'getchar'()
    set $S1, $P11
    goto __label_3
 __label_2: # endwhile
.annotate 'line', 616
# line: $I1
    getattribute $P10, self, 'line'
    set $I1, $P10
.annotate 'line', 617
    ne $S1, '', __label_4
.annotate 'line', 618
    new $P11, [ 'TokenEof' ]
    getattribute $P12, self, 'filename'
    $P11.'TokenEof'($P12)
    set $P10, $P11
    .return($P10)
 __label_4: # endif
.annotate 'line', 619
    $P10 = $P5($S1)
    if_null $P10, __label_5
    unless $P10 goto __label_5
.annotate 'line', 620
    .tailcall $P8(self, $S1, $I1)
 __label_5: # endif
.annotate 'line', 621
    $P10 = $P6($S1)
    if_null $P10, __label_6
    unless $P10 goto __label_6
.annotate 'line', 622
    .tailcall $P9(self, $S1, $I1)
 __label_6: # endif
.annotate 'line', 624
# op: $S2
    set $S2, $S1
.annotate 'line', 625
# var select: $P2
    getattribute $P2, self, 'select'
.annotate 'line', 626
# var current: $P3
    $P3 = $P2[$S1]
 __label_8: # while
.annotate 'line', 628
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_9
    isa $I2, $P3, 'Hash'
 __label_9:
    unless $I2 goto __label_7
# {
.annotate 'line', 629
    $P10 = self.'getchar'()
    set $S1, $P10
.annotate 'line', 630
    set $P2, $P3
.annotate 'line', 631
    $P3 = $P2[$S1]
.annotate 'line', 632
    unless_null $P3, __label_10
# {
.annotate 'line', 633
    self.'ungetchar'($S1)
.annotate 'line', 634
    $P3 = $P2['']
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 637
    concat $S2, $S2, $S1
 __label_11: # endif
# }
    goto __label_8
 __label_7: # endwhile
.annotate 'line', 639
    if_null $P3, __label_12
    unless $P3 goto __label_12
.annotate 'line', 640
    .tailcall $P3(self, $S2, $I1)
 __label_12: # endif
.annotate 'line', 641
    .tailcall $P7(self, $S2, $I1)
# }
.annotate 'line', 642

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 645
# var t: $P1
    $P1 = self.'get_token'()
 __label_1: # while
.annotate 'line', 646
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_3
    not $I1, __ARG_1
 __label_3:
    unless $I1 goto __label_2
    $I1 = $P1.'iscomment'()
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 647
    $P1 = self.'get_token'()
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 648
    .return($P1)
# }
.annotate 'line', 649

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 652
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 653

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 537
    addattribute $P0, 'h'
.annotate 'line', 538
    addattribute $P0, 'pending'
.annotate 'line', 539
    addattribute $P0, 'select'
.annotate 'line', 540
    addattribute $P0, 'stacked'
.annotate 'line', 541
    addattribute $P0, 'filename'
.annotate 'line', 542
    addattribute $P0, 'line'
.end
.namespace [ ]
# Constant REGint evaluated at compile time
# Constant REGfloat evaluated at compile time
# Constant REGstring evaluated at compile time
# Constant REGvar evaluated at compile time
# Constant REGarglist evaluated at compile time
# Constant REGany evaluated at compile time
# Constant REGraw1 evaluated at compile time
# Constant REGnone evaluated at compile time

.sub 'typetoregcheck'
        .param string __ARG_1
# Body
# {
.annotate 'line', 674
    set $S1, __ARG_1
    set $S2, 'int'
    if $S1 == $S2 goto __label_2
    set $S2, 'float'
    if $S1 == $S2 goto __label_3
    set $S2, 'string'
    if $S1 == $S2 goto __label_4
    set $S2, 'var'
    if $S1 == $S2 goto __label_5
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 675
    .return('I')
 __label_3: # case
.annotate 'line', 676
    .return('N')
 __label_4: # case
.annotate 'line', 677
    .return('S')
 __label_5: # case
.annotate 'line', 678
    .return('P')
 __label_1: # default
.annotate 'line', 679
    .return('')
 __label_0: # switch end
# }
.annotate 'line', 681

.end # typetoregcheck


.sub 'typetopirname'
        .param string __ARG_1
# Body
# {
.annotate 'line', 685
    set $S1, __ARG_1
    set $S2, 'I'
    if $S1 == $S2 goto __label_2
    set $S2, 'N'
    if $S1 == $S2 goto __label_3
    set $S2, 'S'
    if $S1 == $S2 goto __label_4
    set $S2, 'P'
    if $S1 == $S2 goto __label_5
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 686
    .return('int')
 __label_3: # case
.annotate 'line', 687
    .return('num')
 __label_4: # case
.annotate 'line', 688
    .return('string')
 __label_5: # case
.annotate 'line', 689
    .return('pmc')
 __label_1: # default
.annotate 'line', 690
    'InternalError'('Invalid reg type')
 __label_0: # switch end
# }
.annotate 'line', 692

.end # typetopirname

# Constant INDENT evaluated at compile time
.namespace [ 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 711
    setattribute self, 'handle', __ARG_1
.annotate 'line', 712
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 713
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 714
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 715
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 716

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 719
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 720

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 723
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 724

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 727
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 728
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 730
    getattribute $P5, self, 'file'
.annotate 'line', 728
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 733
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
 __label_0: # endif
.annotate 'line', 735
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 736
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 738
    getattribute $P5, self, 'line'
.annotate 'line', 736
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 741
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
 __label_1: # endif
# }
.annotate 'line', 743

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 746
    iter $P2, __ARG_1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 747
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 748

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 751
    self.'updateannot'()
.annotate 'line', 752
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 753

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 756
    self.'updateannot'()
.annotate 'line', 757
    self.'vprint'(__ARG_1)
.annotate 'line', 758
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 759

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 762
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_0
# {
.annotate 'line', 764
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 765
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 766
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
 __label_1:
.annotate 'line', 767
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 768
    set $S2, $P1
    eq $S2, $S1, __label_2
# {
.annotate 'line', 769
    assign $P1, $S1
.annotate 'line', 770
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 771
    assign $P2, 0
# }
 __label_2: # endif
.annotate 'line', 773
    set $I2, $P2
    eq $I2, $I1, __label_3
# {
.annotate 'line', 774
    assign $P2, $I1
.annotate 'line', 775
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
 __label_3: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 778

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 781
    self.'updateannot'()
.annotate 'line', 782
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 783

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 786
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 787
    $P1.'print'(' ')
.annotate 'line', 788
    $P1.'print'(__ARG_1)
.annotate 'line', 789
    $P1.'print'(':')
.annotate 'line', 790
    if_null __ARG_2, __label_0
# {
.annotate 'line', 791
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
# }
 __label_0: # endif
.annotate 'line', 793
    $P1.'print'("\n")
# }
.annotate 'line', 794

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 797
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 798
    $P1.'print'('    goto ')
.annotate 'line', 799
    $P1.'print'(__ARG_1)
.annotate 'line', 800
    if_null __ARG_2, __label_0
# {
.annotate 'line', 801
    $P1.'print'(' # ')
.annotate 'line', 802
    $P1.'print'(__ARG_2)
# }
 __label_0: # endif
.annotate 'line', 804
    $P1.'print'("\n")
# }
.annotate 'line', 805

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 809
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 810

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 813
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 814

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 817
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 818

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 821
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 822

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 825
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 826

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 829
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 830

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 833
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 834

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 838
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 839

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 842
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 843

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 846
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 847

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 850
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 851

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 854
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 855

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 858
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 859

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 862
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 863

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 866
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 867

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 870
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 871

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 874
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 875

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 878
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 879

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 882
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 883

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 886
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 887

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 890
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 891

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 894
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 895

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 898
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 899

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 902
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 903

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 906
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 907

.end # emitsay


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 910
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 911

.end # emitfind_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Emit' ]
.annotate 'line', 702
    addattribute $P0, 'handle'
.annotate 'line', 703
    addattribute $P0, 'file'
.annotate 'line', 704
    addattribute $P0, 'line'
.annotate 'line', 705
    addattribute $P0, 'pendingf'
.annotate 'line', 706
    addattribute $P0, 'pendingl'
.annotate 'line', 707
    addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 920
    new $P2, [ 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 921

.end # integerValue


.sub 'floatValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 925
# var t: $P1
    new $P1, [ 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 926
    new $P3, [ 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 927

.end # floatValue


.sub 'floatresult'
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 935
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_1
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_2
    iseq $I1, __ARG_2, 'I'
 __label_2:
 __label_1:
    if $I1 goto __label_0
.annotate 'line', 936
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_3
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_4
    iseq $I1, __ARG_1, 'I'
 __label_4:
 __label_3:
 __label_0:
.annotate 'line', 937
    .return($I1)
# }
.annotate 'line', 938

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant VAR_is_extern evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Predef_frombody' ]

.sub 'Predef_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 963
# pos: $I1
# predefined indexof
    index $I1, __ARG_2, '%0'
.annotate 'line', 964
    iseq $I3, __ARG_1, 'v'
    unless $I3 goto __label_1
    isne $I3, $I1, -1
 __label_1:
    unless $I3 goto __label_0
.annotate 'line', 965
    'InternalError'('void predef with %0')
 __label_0: # endif
.annotate 'line', 966
    isne $I3, __ARG_1, 'v'
    unless $I3 goto __label_3
    iseq $I3, $I1, -1
 __label_3:
    unless $I3 goto __label_2
.annotate 'line', 967
    'InternalError'('non void predef without %0')
 __label_2: # endif
.annotate 'line', 970
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 971
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_4
.annotate 'line', 972
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
 __label_4: # endif
.annotate 'line', 973
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 974
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 975
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 976

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 979
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 981
    ne $S1, 'v', __label_1
# {
.annotate 'line', 982
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_3, ''
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 983
    'SyntaxError'('using return value from void predef')
 __label_3: # endif
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 986
    isnull $I1, __ARG_3
    if $I1 goto __label_6
    iseq $I1, __ARG_3, ''
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 987
    'InternalError'('Bad result in non void predef')
 __label_5: # endif
# }
 __label_2: # endif
.annotate 'line', 990
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 991
    getattribute $P2, self, 'body'
.annotate 'line', 992
    $P3 = __ARG_4[0]
    $P4 = __ARG_4[1]
    $P5 = __ARG_4[2]
    $P6 = __ARG_4[3]
.annotate 'line', 991
    $P1.'append_format'($P2, __ARG_3, $P3, $P4, $P5, $P6)
.annotate 'line', 993
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 994
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 995

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 958
    addattribute $P0, 'body'
.annotate 'line', 959
    addattribute $P0, 'typeresult'
.end
.namespace [ 'PredefBase' ]

.sub 'PredefBase' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
        .param string __ARG_5
        .param string __ARG_6
        .param string __ARG_7
# Body
# {
.annotate 'line', 1016
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1017
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_0
.annotate 'line', 1018
    new $P3, [ 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_1
 __label_0: # else
.annotate 'line', 1020
    setattribute self, 'body', __ARG_2
 __label_1: # endif
.annotate 'line', 1021
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1022
# n: $I1
    null $I1
.annotate 'line', 1023
    if_null __ARG_4, __label_2
# {
.annotate 'line', 1024
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
.annotate 'line', 1025
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_5
    set $S2, '!'
    if $S1 == $S2 goto __label_6
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 1027
    set $I1, -1
    goto __label_3 # break
 __label_6: # case
.annotate 'line', 1030
    set $I1, -2
.annotate 'line', 1031
    if_null __ARG_5, __label_7
.annotate 'line', 1032
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    'InternalError'($S3)
 __label_7: # endif
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 1035
    set $I1, 1
.annotate 'line', 1036
    if_null __ARG_5, __label_8
# {
.annotate 'line', 1037
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1038
    inc $I1
# }
 __label_8: # endif
.annotate 'line', 1040
    if_null __ARG_6, __label_9
# {
.annotate 'line', 1041
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1042
    inc $I1
# }
 __label_9: # endif
.annotate 'line', 1044
    if_null __ARG_7, __label_10
# {
.annotate 'line', 1045
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1046
    inc $I1
# }
 __label_10: # endif
 __label_3: # switch end
# }
 __label_2: # endif
.annotate 'line', 1050
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1051

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1054
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 1055
    .return($S1)
# }
.annotate 'line', 1056

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1059
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1060

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1061
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1064
# type: $S1
    null $S1
.annotate 'line', 1065
    set $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_2
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    set $I2, 3
    if $I1 == $I2 goto __label_5
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 1066
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 1067
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 1068
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 1069
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 1071
    'InternalError'('Invalid predef arg')
 __label_0: # switch end
.annotate 'line', 1073
    .return($S1)
# }
.annotate 'line', 1074

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1077
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1078
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1079
    isne $I1, $S1, 'v'
    unless $I1 goto __label_2
    iseq $I1, __ARG_4, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 1080
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
 __label_1: # endif
.annotate 'line', 1081
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1082
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1083

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefBase' ]
.annotate 'line', 1000
    addattribute $P0, 'name'
.annotate 'line', 1001
    addattribute $P0, 'body'
.annotate 'line', 1002
    addattribute $P0, 'typeresult'
.annotate 'line', 1003
    addattribute $P0, 'type0'
.annotate 'line', 1004
    addattribute $P0, 'type1'
.annotate 'line', 1005
    addattribute $P0, 'type2'
.annotate 'line', 1006
    addattribute $P0, 'type3'
.annotate 'line', 1007
    addattribute $P0, 'nparams'
.end
.namespace [ 'PredefFunction' ]

.sub 'PredefFunction' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
        .param string __ARG_5 :optional
        .param string __ARG_6 :optional
        .param string __ARG_7 :optional
# Body
# {
.annotate 'line', 1095
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1096

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1086
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.end
.namespace [ 'PredefFunctionEval' ]

.sub 'PredefFunctionEval' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5 :optional
        .param string __ARG_6 :optional
        .param string __ARG_7 :optional
        .param string __ARG_8 :optional
# Body
# {
.annotate 'line', 1109
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1110
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1111

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1099
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1101
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1119
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1120

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1123
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1124
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_1
.annotate 'line', 1125
    'InternalError'("Invalid Predef_typecast.invoke call")
 __label_1: # endif
.annotate 'line', 1126
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1127
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 1128
    iseq $I1, $S2, $S1
    if $I1 goto __label_5
    isa $I1, $P1, [ 'IndexExpr' ]
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 1129
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 1131
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 1132
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1134
    ne $S3, 'null', __label_7
.annotate 'line', 1135
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_8
 __label_7: # else
.annotate 'line', 1137
    __ARG_1.'emitset'(__ARG_3, $S3)
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 1139

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1116
    addattribute $P0, 'type'
.end
.namespace [ ]

.sub 'Predef_say'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1144
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1145
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1146
    lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1147
# i: $I2
    null $I2
 __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1148
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
 __label_2: # for iteration
.annotate 'line', 1147
    inc $I2
    goto __label_4
 __label_3: # for end
.annotate 'line', 1149
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 1152
    __ARG_1.'emitsay'("''")
 __label_1: # endif
# }
.annotate 'line', 1153

.end # Predef_say


.sub 'Predef_cry'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1157
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1158
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1159
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1160
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1161
    $P1 = __ARG_4[$I2]
    __ARG_1.'say'('    ', "print $P0, ", $P1)
 __label_0: # for iteration
.annotate 'line', 1160
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 1162
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1163

.end # Predef_cry


.sub 'Predef_print'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1167
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1168
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1169
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1170
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
 __label_0: # for iteration
.annotate 'line', 1169
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 1171

.end # Predef_print


.sub 'Predef_invoke'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1177
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1178
    isa $I2, $P1, [ 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 1179
    'SyntaxError'("invoke argument must be callable", __ARG_2)
 __label_0: # endif
.annotate 'line', 1180
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1181

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_1')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1185
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1186
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1187
# predefined length
    length $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1188

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1192
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1193
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1194
# predefined bytelength
    bytelength $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1195

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1199
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1200
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1201
# predefined ord
    ord $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1202

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1206
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1207
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 1208
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1209
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1210
# predefined ord
    ord $I2, $S1, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1211

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1215
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1217
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1218
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1220
# var t: $P2
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1221
    new $P4, [ 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1222

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1226
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1227
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1228
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 1229
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1231
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1232
    new $P5, [ 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1233

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1237
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1238
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1239
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1240
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 1241
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1242
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1244
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1245
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1246

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1250
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1251
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1252
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 1253
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 1254
# predefined indexof
    index $I1, $S1, $S2
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1255

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1259
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1260
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1261
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1262
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 1263
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 1264
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1265
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1266

.end # predefeval_indexof_pos


.sub 'getpredefs'
# Body
# {
.const 'Sub' $P2 = "WSubId_1"
.const 'Sub' $P3 = "WSubId_2"
.const 'Sub' $P4 = "WSubId_3"
.const 'Sub' $P5 = "WSubId_4"
.const 'Sub' $P6 = "WSubId_5"
.const 'Sub' $P7 = "WSubId_6"
.const 'Sub' $P8 = "WSubId_7"
.const 'Sub' $P9 = "WSubId_8"
.const 'Sub' $P10 = "WSubId_9"
.annotate 'line', 1279
.const 'Sub' $P11 = 'Predef_print'
.annotate 'line', 1280
.const 'Sub' $P12 = 'Predef_say'
.annotate 'line', 1281
.const 'Sub' $P13 = 'Predef_cry'
.annotate 'line', 1282
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1284
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1285
    new $P17, [ 'PredefFunction' ]
.annotate 'line', 1286
    new $P19, [ 'Predef_typecast' ]
    $P19.'Predef_typecast'('I')
    set $P18, $P19
    $P17.'PredefFunction'('int', $P18, 'I', '!')
    set $P16, $P17
.annotate 'line', 1284
    push $P1, $P16
.annotate 'line', 1289
    new $P21, [ 'PredefFunction' ]
.annotate 'line', 1290
    new $P23, [ 'Predef_typecast' ]
    $P23.'Predef_typecast'('N')
    set $P22, $P23
    $P21.'PredefFunction'('float', $P22, 'N', '!')
    set $P20, $P21
.annotate 'line', 1284
    push $P1, $P20
.annotate 'line', 1293
    new $P25, [ 'PredefFunction' ]
.annotate 'line', 1294
    new $P27, [ 'Predef_typecast' ]
    $P27.'Predef_typecast'('S')
    set $P26, $P27
    $P25.'PredefFunction'('string', $P26, 'S', '!')
    set $P24, $P25
.annotate 'line', 1284
    push $P1, $P24
.annotate 'line', 1297
    new $P29, [ 'PredefFunction' ]
    $P29.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P28, $P29
.annotate 'line', 1284
    push $P1, $P28
.annotate 'line', 1301
    new $P31, [ 'PredefFunction' ]
    $P31.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P30, $P31
.annotate 'line', 1284
    push $P1, $P30
.annotate 'line', 1305
    new $P33, [ 'PredefFunction' ]
    $P33.'PredefFunction'('time', 'time %0', 'I')
    set $P32, $P33
.annotate 'line', 1284
    push $P1, $P32
.annotate 'line', 1309
    new $P35, [ 'PredefFunction' ]
    $P35.'PredefFunction'('floattime', 'time %0', 'N')
    set $P34, $P35
.annotate 'line', 1284
    push $P1, $P34
.annotate 'line', 1313
    new $P37, [ 'PredefFunction' ]
    $P37.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P36, $P37
.annotate 'line', 1284
    push $P1, $P36
.annotate 'line', 1317
    new $P39, [ 'PredefFunction' ]
    $P39.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P38, $P39
.annotate 'line', 1284
    push $P1, $P38
.annotate 'line', 1321
    new $P41, [ 'PredefFunction' ]
    $P41.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P40, $P41
.annotate 'line', 1284
    push $P1, $P40
.annotate 'line', 1325
    new $P43, [ 'PredefFunction' ]
    $P43.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P42, $P43
.annotate 'line', 1284
    push $P1, $P42
.annotate 'line', 1329
    new $P45, [ 'PredefFunction' ]
    $P45.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P44, $P45
.annotate 'line', 1284
    push $P1, $P44
.annotate 'line', 1336
    new $P47, [ 'PredefFunction' ]
    $P47.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P46, $P47
.annotate 'line', 1284
    push $P1, $P46
.annotate 'line', 1343
    new $P49, [ 'PredefFunction' ]
    $P49.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P48, $P49
.annotate 'line', 1284
    push $P1, $P48
.annotate 'line', 1350
    new $P51, [ 'PredefFunction' ]
    $P51.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P50, $P51
.annotate 'line', 1284
    push $P1, $P50
.annotate 'line', 1358
    new $P53, [ 'PredefFunction' ]
    $P53.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P52, $P53
.annotate 'line', 1284
    push $P1, $P52
.annotate 'line', 1367
    new $P55, [ 'PredefFunction' ]
    $P55.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P54, $P55
.annotate 'line', 1284
    push $P1, $P54
.annotate 'line', 1371
    new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1372
    $P57.'PredefFunctionEval'('length', $P2, 'length %0, %1', 'I', 'S')
    set $P56, $P57
.annotate 'line', 1284
    push $P1, $P56
.annotate 'line', 1376
    new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1377
    $P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength %0, %1', 'I', 'S')
    set $P58, $P59
.annotate 'line', 1284
    push $P1, $P58
.annotate 'line', 1381
    new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1382
    $P61.'PredefFunctionEval'('chr', $P4, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P60, $P61
.annotate 'line', 1284
    push $P1, $P60
.annotate 'line', 1390
    new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1391
    $P63.'PredefFunctionEval'('ord', $P5, 'ord %0, %1', 'I', 'S')
    set $P62, $P63
.annotate 'line', 1284
    push $P1, $P62
.annotate 'line', 1395
    new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1396
    $P65.'PredefFunctionEval'('ord', $P6, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P64, $P65
.annotate 'line', 1284
    push $P1, $P64
.annotate 'line', 1400
    new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1401
    $P67.'PredefFunctionEval'('substr', $P7, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P66, $P67
.annotate 'line', 1284
    push $P1, $P66
.annotate 'line', 1405
    new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1406
    $P69.'PredefFunctionEval'('substr', $P8, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P68, $P69
.annotate 'line', 1284
    push $P1, $P68
.annotate 'line', 1410
    new $P71, [ 'PredefFunction' ]
    $P71.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P70, $P71
.annotate 'line', 1284
    push $P1, $P70
.annotate 'line', 1414
    new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1415
    $P73.'PredefFunctionEval'('indexof', $P9, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P72, $P73
.annotate 'line', 1284
    push $P1, $P72
.annotate 'line', 1419
    new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1420
    $P75.'PredefFunctionEval'('indexof', $P10, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P74, $P75
.annotate 'line', 1284
    push $P1, $P74
.annotate 'line', 1424
    new $P77, [ 'PredefFunction' ]
    $P77.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P76, $P77
.annotate 'line', 1284
    push $P1, $P76
.annotate 'line', 1428
    new $P79, [ 'PredefFunction' ]
    $P79.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P78, $P79
.annotate 'line', 1284
    push $P1, $P78
.annotate 'line', 1432
    new $P81, [ 'PredefFunction' ]
    $P81.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P80, $P81
.annotate 'line', 1284
    push $P1, $P80
.annotate 'line', 1436
    new $P83, [ 'PredefFunction' ]
    $P83.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P82, $P83
.annotate 'line', 1284
    push $P1, $P82
.annotate 'line', 1440
    new $P85, [ 'PredefFunction' ]
    $P85.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P84, $P85
.annotate 'line', 1284
    push $P1, $P84
.annotate 'line', 1444
    new $P87, [ 'PredefFunction' ]
    $P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P86, $P87
.annotate 'line', 1284
    push $P1, $P86
.annotate 'line', 1451
    new $P89, [ 'PredefFunction' ]
    $P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P88, $P89
.annotate 'line', 1284
    push $P1, $P88
.annotate 'line', 1458
    new $P91, [ 'PredefFunction' ]
    $P91.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P90, $P91
.annotate 'line', 1284
    push $P1, $P90
.annotate 'line', 1462
    new $P93, [ 'PredefFunction' ]
    $P93.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P92, $P93
.annotate 'line', 1284
    push $P1, $P92
.annotate 'line', 1466
    new $P95, [ 'PredefFunction' ]
    $P95.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P94, $P95
.annotate 'line', 1284
    push $P1, $P94
.annotate 'line', 1470
    new $P97, [ 'PredefFunction' ]
    $P97.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P96, $P97
.annotate 'line', 1284
    push $P1, $P96
.annotate 'line', 1474
    new $P99, [ 'PredefFunction' ]
    $P99.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P98, $P99
.annotate 'line', 1284
    push $P1, $P98
.annotate 'line', 1478
    new $P101, [ 'PredefFunction' ]
    $P101.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P100, $P101
.annotate 'line', 1284
    push $P1, $P100
.annotate 'line', 1482
    new $P103, [ 'PredefFunction' ]
    $P103.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P102, $P103
.annotate 'line', 1284
    push $P1, $P102
.annotate 'line', 1486
    new $P105, [ 'PredefFunction' ]
    $P105.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P104, $P105
.annotate 'line', 1284
    push $P1, $P104
.annotate 'line', 1490
    new $P107, [ 'PredefFunction' ]
    $P107.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P106, $P107
.annotate 'line', 1284
    push $P1, $P106
.annotate 'line', 1494
    new $P109, [ 'PredefFunction' ]
    $P109.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P108, $P109
.annotate 'line', 1284
    push $P1, $P108
.annotate 'line', 1498
    new $P111, [ 'PredefFunction' ]
    $P111.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P110, $P111
.annotate 'line', 1284
    push $P1, $P110
.annotate 'line', 1502
    new $P113, [ 'PredefFunction' ]
    $P113.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P112, $P113
.annotate 'line', 1284
    push $P1, $P112
.annotate 'line', 1506
    new $P115, [ 'PredefFunction' ]
    $P115.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P114, $P115
.annotate 'line', 1284
    push $P1, $P114
.annotate 'line', 1510
    new $P117, [ 'PredefFunction' ]
    $P117.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P116, $P117
.annotate 'line', 1284
    push $P1, $P116
.annotate 'line', 1514
    new $P119, [ 'PredefFunction' ]
    $P119.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P118, $P119
.annotate 'line', 1284
    push $P1, $P118
.annotate 'line', 1518
    new $P121, [ 'PredefFunction' ]
    $P121.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P120, $P121
.annotate 'line', 1284
    push $P1, $P120
.annotate 'line', 1522
    new $P123, [ 'PredefFunction' ]
    $P123.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P122, $P123
.annotate 'line', 1284
    push $P1, $P122
.annotate 'line', 1526
    new $P125, [ 'PredefFunction' ]
    $P125.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P124, $P125
.annotate 'line', 1284
    push $P1, $P124
.annotate 'line', 1530
    new $P127, [ 'PredefFunction' ]
    $P127.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P126, $P127
.annotate 'line', 1284
    push $P1, $P126
.annotate 'line', 1534
    new $P129, [ 'PredefFunction' ]
    $P129.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P128, $P129
.annotate 'line', 1284
    push $P1, $P128
.annotate 'line', 1538
    new $P131, [ 'PredefFunction' ]
    $P131.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P130, $P131
.annotate 'line', 1284
    push $P1, $P130
.annotate 'line', 1542
    new $P133, [ 'PredefFunction' ]
    $P133.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P132, $P133
.annotate 'line', 1284
    push $P1, $P132
.annotate 'line', 1549
    new $P135, [ 'PredefFunction' ]
    $P135.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P134, $P135
.annotate 'line', 1284
    push $P1, $P134
.annotate 'line', 1556
    new $P137, [ 'PredefFunction' ]
    $P137.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P136, $P137
.annotate 'line', 1284
    push $P1, $P136
.annotate 'line', 1560
    new $P139, [ 'PredefFunction' ]
    $P139.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P138, $P139
.annotate 'line', 1284
    push $P1, $P138
.annotate 'line', 1564
    new $P141, [ 'PredefFunction' ]
    $P141.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P140, $P141
.annotate 'line', 1284
    push $P1, $P140
.annotate 'line', 1568
    new $P143, [ 'PredefFunction' ]
    $P143.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P142, $P143
.annotate 'line', 1284
    push $P1, $P142
.annotate 'line', 1572
    new $P145, [ 'PredefFunction' ]
    $P145.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P144, $P145
.annotate 'line', 1284
    push $P1, $P144
.annotate 'line', 1576
    new $P147, [ 'PredefFunction' ]
.annotate 'line', 1577
    $P147.'PredefFunction'('print', $P11, 'v', '*')
    set $P146, $P147
.annotate 'line', 1284
    push $P1, $P146
.annotate 'line', 1580
    new $P149, [ 'PredefFunction' ]
.annotate 'line', 1581
    $P149.'PredefFunction'('say', $P12, 'v', '*')
    set $P148, $P149
.annotate 'line', 1284
    push $P1, $P148
.annotate 'line', 1584
    new $P151, [ 'PredefFunction' ]
.annotate 'line', 1585
    $P151.'PredefFunction'('cry', $P13, 'v', '*')
    set $P150, $P151
.annotate 'line', 1284
    push $P1, $P150
.annotate 'line', 1588
    new $P153, [ 'PredefFunction' ]
.annotate 'line', 1589
    $P153.'PredefFunction'('invoke', $P14, 'P', '!')
    set $P152, $P153
.annotate 'line', 1284
    push $P1, $P152
 __label_1: # Infinite loop
.annotate 'line', 1594
    .yield($P1)
    goto __label_1
 __label_0: # Infinite loop end
# }
.annotate 'line', 1595

.end # getpredefs


.sub 'findpredef'
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 1599
    $P2 = 'getpredefs'()
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1600
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1601
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1602
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_5
.annotate 'line', 1603
    iseq $I2, $I1, -1
 __label_5:
    if $I2 goto __label_4
.annotate 'line', 1604
    iseq $I2, $I1, -2
    unless $I2 goto __label_6
    iseq $I2, __ARG_2, 1
 __label_6:
 __label_4:
    unless $I2 goto __label_3
.annotate 'line', 1605
    .return($P1)
 __label_3: # endif
# }
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P2
.annotate 'line', 1607
    .return($P2)
# }
.annotate 'line', 1608

.end # findpredef


.sub 'optimize_array'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1616
    if_null __ARG_1, __label_0
# {
.annotate 'line', 1617
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1618
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 1619
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
 __label_1: # for iteration
.annotate 'line', 1618
    inc $I2
    goto __label_3
 __label_2: # for end
# }
 __label_0: # endif
# }
.annotate 'line', 1621

.end # optimize_array


.sub 'parseDotted'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1625
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1626
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1627
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 1628
# predefined push
    push $P1, $P2
 __label_2: # while
.annotate 'line', 1629
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1630
    $P2 = __ARG_1.'get'()
.annotate 'line', 1631
# predefined push
    push $P1, $P2
# }
    goto __label_2
 __label_1: # endwhile
# }
 __label_0: # endif
.annotate 'line', 1634
    __ARG_1.'unget'($P2)
.annotate 'line', 1635
    .return($P1)
# }
.annotate 'line', 1636

.end # parseDotted


.sub 'toIdentifierList'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1640
    new $P1, ['ResizableStringArray']
.annotate 'line', 1641
    iter $P3, __ARG_1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 1642
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_0
 __label_1: # endfor
.annotate 'line', 1643
    .return($P1)
# }
.annotate 'line', 1644

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1657
    setattribute self, 'start', __ARG_1
.annotate 'line', 1658
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1659

.end # initbase


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1662
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1663

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1666
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1667

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1670
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1671

.end # generatesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1674
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1675

.end # addlocalfunction


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1678
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1679

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1682
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1683

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1686
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1687

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1652
    addattribute $P0, 'start'
.annotate 'line', 1653
    addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 1702
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'args', $P2
# }
.annotate 'line', 1703

.end # init


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1707
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 1708

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1711
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1712
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1713

.end # getarg


.sub 'parseargs' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1717
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1718
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 1719
# {
.annotate 'line', 1720
# var value: $P3
    $P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1721
# predefined push
    push $P1, $P3
# }
 __label_2: # continue
.annotate 'line', 1722
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 1723
    'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1724

.end # parseargs


.sub 'optimizeargs' :method
# Body
# {
.annotate 'line', 1728
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
# }
.annotate 'line', 1729

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1732
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1733
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1734
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1735
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1736
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 1737
# reg: $S1
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 1738
# predefined push
    push $P2, $S1
# }
 __label_0: # for iteration
.annotate 'line', 1735
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 1740
    .return($P2)
# }
.annotate 'line', 1741

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1744
# var argreg: $P1
    $P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1745
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1746

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1698
    addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1758
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1761
# nargs: $I1
    getattribute $P2, self, 'args'
    $P1 = $P2.'numargs'()
    set $I1, $P1
.annotate 'line', 1762
    .return($I1)
# }
.annotate 'line', 1763

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1766
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1767
    $P2 = $P1.'numargs'()
    set $I1, $P2
    ge __ARG_1, $I1, __label_0
.annotate 'line', 1768
    .tailcall $P1.'getarg'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 1770
    'InternalError'('Wrong modifier arg number')
 __label_1: # endif
# }
.annotate 'line', 1771

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1774
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1775
    if_null __ARG_2, __label_0
.annotate 'line', 1776
    setattribute self, 'args', __ARG_2
 __label_0: # endif
# }
.annotate 'line', 1777

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1780
    getattribute $P1, self, 'args'
    $P1.'optimizeargs'()
# }
.annotate 'line', 1781

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Modifier' ]
.annotate 'line', 1755
    addattribute $P0, 'name'
.annotate 'line', 1756
    addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1790
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1791
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 1792
# {
.annotate 'line', 1793
    $P2 = __ARG_1.'get'()
.annotate 'line', 1794
# name: $S1
    $P4 = $P2.'getidentifier'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 1795
    $P2 = __ARG_1.'get'()
.annotate 'line', 1796
# var args: $P3
    new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1797
    $P4 = $P2.'isop'('(')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1798
    $P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1799
    $P2 = __ARG_1.'get'()
# }
 __label_4: # endif
.annotate 'line', 1801
    new $P5, [ 'Modifier' ]
    $P5.'Modifier'($S1, $P3)
    set $P4, $P5
# predefined push
    push $P1, $P4
# }
 __label_2: # continue
.annotate 'line', 1802
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 1803
    'RequireOp'(']', $P2)
.annotate 'line', 1804
    setattribute self, 'list', $P1
# }
.annotate 'line', 1805

.end # ModifierList


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1808
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1809
    $P1.'optimize'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 1810

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1811
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1814
# var list: $P1
    getattribute $P1, self, 'list'
.annotate 'line', 1815
# n: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1816
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1817
# var mod: $P2
    $P2 = $P1[$I2]
.annotate 'line', 1818
    $P3 = $P2.'getname'()
    set $S1, $P3
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1819
    .return($P2)
# }
 __label_3: # endif
# }
 __label_0: # for iteration
.annotate 'line', 1816
    inc $I2
    goto __label_2
 __label_1: # for end
    null $P3
.annotate 'line', 1822
    .return($P3)
# }
.annotate 'line', 1823

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1786
    addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1832
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1833
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1834

.end # getparrotkey


.sub 'getparrotnamespacekey'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1838
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_0
.annotate 'line', 1839
    .return(".namespace [ ]")
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 1841
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1842
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
 __label_1: # endif
# }
.annotate 'line', 1844

.end # getparrotnamespacekey


.sub 'parseUsing'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1848
# var taux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 1849
    $P2 = $P1.'iskeyword'('extern')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 1850
    new $P4, [ 'ExternStatement' ]
    $P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
    goto __label_1
 __label_0: # else
.annotate 'line', 1851
    $P5 = $P1.'iskeyword'('static')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 1852
    new $P7, [ 'StaticStatement' ]
    $P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 1854
    __ARG_2.'unget'($P1)
.annotate 'line', 1855
    new $P3, [ 'UsingStatement' ]
    $P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
# }
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 1857

.end # parseUsing


.sub 'parseStatement'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1861
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1862
    $P3 = $P1.'isop'(';')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 1863
    new $P4, [ 'EmptyStatement' ]
    .return($P4)
 __label_0: # endif
.annotate 'line', 1864
    $P3 = $P1.'isop'('{')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 1865
    new $P5, [ 'CompoundStatement' ]
    $P5.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_1: # endif
.annotate 'line', 1866
    $P3 = $P1.'isop'('${')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1867
    new $P5, [ 'PiropStatement' ]
    $P5.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_2: # endif
.annotate 'line', 1869
    $P3 = $P1.'checkkeyword'()
    set $S1, $P3
    set $S2, 'using'
    if $S1 == $S2 goto __label_5
    set $S2, 'const'
    if $S1 == $S2 goto __label_6
    set $S2, 'volatile'
    if $S1 == $S2 goto __label_7
    set $S2, 'var'
    if $S1 == $S2 goto __label_8
    set $S2, 'string'
    if $S1 == $S2 goto __label_9
    set $S2, 'int'
    if $S1 == $S2 goto __label_10
    set $S2, 'float'
    if $S1 == $S2 goto __label_11
    set $S2, 'return'
    if $S1 == $S2 goto __label_12
    set $S2, 'yield'
    if $S1 == $S2 goto __label_13
    set $S2, 'goto'
    if $S1 == $S2 goto __label_14
    set $S2, 'if'
    if $S1 == $S2 goto __label_15
    set $S2, 'while'
    if $S1 == $S2 goto __label_16
    set $S2, 'do'
    if $S1 == $S2 goto __label_17
    set $S2, 'continue'
    if $S1 == $S2 goto __label_18
    set $S2, 'break'
    if $S1 == $S2 goto __label_19
    set $S2, 'switch'
    if $S1 == $S2 goto __label_20
    set $S2, 'for'
    if $S1 == $S2 goto __label_21
    set $S2, 'throw'
    if $S1 == $S2 goto __label_22
    set $S2, 'try'
    if $S1 == $S2 goto __label_23
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 1871
    .tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
 __label_6: # case
.annotate 'line', 1873
    .tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
    goto __label_3 # break
 __label_7: # case
.annotate 'line', 1876
    .tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
    goto __label_3 # break
 __label_8: # case
.annotate 'line', 1879
    .tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
 __label_9: # case
.annotate 'line', 1881
    .tailcall 'parseString'($P1, __ARG_1, __ARG_2)
 __label_10: # case
.annotate 'line', 1883
    .tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
 __label_11: # case
.annotate 'line', 1885
    .tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
 __label_12: # case
.annotate 'line', 1887
    new $P5, [ 'ReturnStatement' ]
    $P5.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_13: # case
.annotate 'line', 1889
    new $P7, [ 'YieldStatement' ]
    $P7.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
 __label_14: # case
.annotate 'line', 1891
    new $P9, [ 'GotoStatement' ]
    $P9.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P8, $P9
    .return($P8)
 __label_15: # case
.annotate 'line', 1893
    new $P11, [ 'IfStatement' ]
    $P11.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
 __label_16: # case
.annotate 'line', 1895
    new $P13, [ 'WhileStatement' ]
    $P13.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
 __label_17: # case
.annotate 'line', 1897
    new $P15, [ 'DoStatement' ]
    $P15.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
 __label_18: # case
.annotate 'line', 1899
    new $P17, [ 'ContinueStatement' ]
    $P17.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
 __label_19: # case
.annotate 'line', 1901
    new $P19, [ 'BreakStatement' ]
    $P19.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
 __label_20: # case
.annotate 'line', 1903
    new $P21, [ 'SwitchStatement' ]
    $P21.'SwitchStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
 __label_21: # case
.annotate 'line', 1905
    .tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
 __label_22: # case
.annotate 'line', 1907
    new $P23, [ 'ThrowStatement' ]
    $P23.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
 __label_23: # case
.annotate 'line', 1909
    new $P25, [ 'TryStatement' ]
    $P25.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
 __label_4: # default
.annotate 'line', 1911
    $P26 = $P1.'isidentifier'()
    if_null $P26, __label_24
    unless $P26 goto __label_24
# {
.annotate 'line', 1912
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1913
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_25
    unless $P3 goto __label_25
.annotate 'line', 1914
    new $P5, [ 'LabelStatement' ]
    $P5.'LabelStatement'($P1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_25: # endif
.annotate 'line', 1915
    __ARG_1.'unget'($P2)
# }
 __label_24: # endif
.annotate 'line', 1917
    __ARG_1.'unget'($P1)
.annotate 'line', 1918
    new $P4, [ 'ExprStatement' ]
    $P4.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P3, $P4
    .return($P3)
 __label_3: # switch end
.annotate 'line', 1920
    'InternalError'('parseStatement failure', $P1)
# }
.annotate 'line', 1921

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1931
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1932

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 1933
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1936
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1937

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1940
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1941

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 1944
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 1945

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 1948
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 1949

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1952
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1953

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1956
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1957

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 1961
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1962

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 1965
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1966

.end # createvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1969
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1970

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1973
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1974

.end # checkclass


.sub 'getouter' :method
# Body
# {
.annotate 'line', 1981
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 1982

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1985
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1986

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1989
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1990

.end # getbreaklabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1993
    getattribute $P1, self, 'start'
    'InternalError'('**checking**', $P1)
.annotate 'line', 1995
    .return(self)
# }
.annotate 'line', 1996

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Statement' ]
.annotate 'line', 1927
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2001
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2004
    'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 2005

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2006
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1999
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2019
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2020
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2021
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2022
# i: $I3
    null $I3
 __label_2: # for condition
    ge $I3, $I1, __label_1
# {
.annotate 'line', 2023
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2024
    set $I4, $I2
    unless $I4 goto __label_4
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
 __label_4:
    unless $I4 goto __label_3
.annotate 'line', 2025
    null $I2
 __label_3: # endif
.annotate 'line', 2026
    $P1[$I3] = $P2
# }
 __label_0: # for iteration
.annotate 'line', 2022
    inc $I3
    goto __label_2
 __label_1: # for end
.annotate 'line', 2028
    unless $I2 goto __label_5
.annotate 'line', 2029
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
    goto __label_6
 __label_5: # else
.annotate 'line', 2031
    .return(self)
 __label_6: # endif
# }
.annotate 'line', 2032

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 2015
    addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2039
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2040
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2041

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2042
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2045
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2046
    .return(self)
# }
.annotate 'line', 2047

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2050
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 2051
    $P1.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 2052

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 2035
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2057
    unless_null __ARG_1, __label_0
.annotate 'line', 2058
    .return(__ARG_2)
    goto __label_1
 __label_0: # else
.annotate 'line', 2059
    isa $I1, __ARG_1, [ 'MultiStatement' ]
    unless $I1 goto __label_2
.annotate 'line', 2060
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_3
 __label_2: # else
.annotate 'line', 2062
    new $P2, [ 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 2063

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2076
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2077
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2078
# dotted: $I1
    null $I1
.annotate 'line', 2079
    $P4 = $P1.'isop'('.')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 2080
    set $I1, 1
.annotate 'line', 2081
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 2083
# opname: $S1
    $P4 = $P1.'getidentifier'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
 __label_1:
.annotate 'line', 2084
    unless $I1 goto __label_3
    set $S3, '.'
    goto __label_2
 __label_3:
    set $S3, ''
 __label_2:
    concat $S4, $S3, $S1
    box $P4, $S4
    setattribute self, 'opname', $P4
.annotate 'line', 2085
    $P1 = __ARG_2.'get'()
.annotate 'line', 2086
    $P4 = $P1.'isop'('}')
    isfalse $I2, $P4
    unless $I2 goto __label_4
# {
.annotate 'line', 2087
    __ARG_2.'unget'($P1)
.annotate 'line', 2088
# var args: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_5: # do
.annotate 'line', 2089
# {
.annotate 'line', 2090
# var arg: $P3
    null $P3
.annotate 'line', 2091
    $P1 = __ARG_2.'get'()
.annotate 'line', 2092
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_8
    unless $P4 goto __label_8
# {
.annotate 'line', 2093
    $P1 = __ARG_2.'get'()
.annotate 'line', 2094
# label: $S2
    $P4 = $P1.'getidentifier'()
    null $S2
    if_null $P4, __label_10
    set $S2, $P4
 __label_10:
.annotate 'line', 2095
    new $P4, [ 'Reflabel' ]
    $P4.'Reflabel'(__ARG_3, $S2)
    set $P3, $P4
# }
    goto __label_9
 __label_8: # else
# {
.annotate 'line', 2098
    __ARG_2.'unget'($P1)
.annotate 'line', 2099
    $P3 = 'parseExpr'(__ARG_2, __ARG_3)
# }
 __label_9: # endif
.annotate 'line', 2101
# predefined push
    push $P2, $P3
# }
 __label_7: # continue
.annotate 'line', 2102
    $P1 = __ARG_2.'get'()
    $P4 = $P1.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 2103
    'RequireOp'('}', $P1)
.annotate 'line', 2104
    setattribute self, 'args', $P2
# }
 __label_4: # endif
.annotate 'line', 2106
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2107

.end # PiropStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2110
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 2111
    .return(self)
# }
.annotate 'line', 2112

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2115
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2116
    self.'annotate'(__ARG_1)
.annotate 'line', 2117
    concat $S3, 'pirop ', $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 2118
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2119
    __ARG_1.'print'('    ')
.annotate 'line', 2120
    unless_null $P1, __label_1
.annotate 'line', 2121
    __ARG_1.'say'($S1)
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 2123
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2124
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 2125
# i: $I2
    null $I2
 __label_5: # for condition
    ge $I2, $I1, __label_4
# {
.annotate 'line', 2126
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 2127
# reg: $S2
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
 __label_6:
.annotate 'line', 2128
# predefined push
    push $P2, $S2
# }
 __label_3: # for iteration
.annotate 'line', 2125
    inc $I2
    goto __label_5
 __label_4: # for end
.annotate 'line', 2130
# predefined join
    join $S3, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S3)
# }
 __label_2: # endif
# }
.annotate 'line', 2132

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 2069
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2071
    addattribute $P0, 'opname'
.annotate 'line', 2072
    addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2144
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2145
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2146
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2147
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
 __label_0: # endif
.annotate 'line', 2148
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2149
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2150
    .return(self)
# }
.annotate 'line', 2151

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2152
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2155
    self.'annotate'(__ARG_1)
.annotate 'line', 2156
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2157

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2139
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2141
    addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2169
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2170
# sym: $S1
    $P1 = __ARG_2.'get'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2171
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2172
    box $P1, $S1
    setattribute self, 'symbol', $P1
# }
.annotate 'line', 2173

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2174
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2177
    self.'annotate'(__ARG_1)
.annotate 'line', 2178
# var v: $P1
    getattribute $P2, self, 'symbol'
    $P1 = self.'createvar'($P2, 'P')
.annotate 'line', 2179
    $P2 = $P1.'getreg'()
    getattribute $P3, self, 'symbol'
    __ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 2180

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2164
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2166
    addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2194
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2195
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2196
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2197
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
 __label_0: # endif
.annotate 'line', 2198
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2199
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
# }
.annotate 'line', 2200

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2203
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2204
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2205
# var vdata: $P2
    $P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2207
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
.annotate 'line', 2208
    if_null $P3, __label_0
# {
.annotate 'line', 2209
    isa $I1, $P3, [ 'FunctionStatement' ]
    unless $I1 goto __label_1
# {
.annotate 'line', 2210
# subid: $S2
    $P4 = $P3.'makesubid'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2211
    box $P4, $S2
    setattribute self, 'subid', $P4
# }
 __label_1: # endif
# }
 __label_0: # endif
.annotate 'line', 2214
    .return(self)
# }
.annotate 'line', 2215

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2218
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2219
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2220
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2221
    getattribute $P3, self, 'subid'
    if_null $P3, __label_0
# {
.annotate 'line', 2222
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2223
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2226
    self.'annotate'(__ARG_1)
.annotate 'line', 2227
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2228
    $P1.'pop'()
.annotate 'line', 2229
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 2231
    __ARG_1.'say'("'", $S1, "'")
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 2234
    $P3 = 'getparrotkey'($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
 __label_3: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2237

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2187
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2189
    addattribute $P0, 'path'
.annotate 'line', 2190
    addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2249
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2250
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2251
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2252

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2255
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2256
    .return(self)
# }
.annotate 'line', 2257

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2260
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2261

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2244
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2246
    addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param pmc __ARG_5 :optional
# Body
# {
.annotate 'line', 2280
    setattribute self, 'type', __ARG_1
.annotate 'line', 2281
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2282
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2283
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 2284
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2285

.end # VarData


.sub 'setid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2288
    box $P1, __ARG_1
    setattribute self, 'id', $P1
# }
.annotate 'line', 2289

.end # setid


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2292
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2293

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2294
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2295
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2296
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2297
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2298
    getattribute $P1, self, 'value'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }

.end # isconst


.sub 'getid' :method
# Body
# {
.annotate 'line', 2299
    getattribute $P1, self, 'id'
    .return($P1)
# }

.end # getid


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2300
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2301
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData' ]
.annotate 'line', 2270
    addattribute $P0, 'type'
.annotate 'line', 2271
    addattribute $P0, 'reg'
.annotate 'line', 2272
    addattribute $P0, 'scope'
.annotate 'line', 2273
    addattribute $P0, 'flags'
.annotate 'line', 2274
    addattribute $P0, 'value'
.annotate 'line', 2275
    addattribute $P0, 'id'
.annotate 'line', 2276
    addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2309
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2310

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 2313
    'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2314

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2306
    addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2323
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2324

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2327
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2328
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2329
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2330
    if_null $P2, __label_1
.annotate 'line', 2331
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    'SyntaxError'($S3, __ARG_1)
 __label_1: # endif
.annotate 'line', 2332
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2333
# var data: $P3
    new $P3, [ 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2334
    $P1[$S1] = $P3
.annotate 'line', 2335
    .return($P3)
# }
.annotate 'line', 2336

.end # createvar


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2339
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2340
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2341
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2342
    if_null $P2, __label_1
.annotate 'line', 2343
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
 __label_1: # endif
.annotate 'line', 2344
    new $P4, [ 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2345

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 2349
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2350
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2351
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2352
    if_null $P2, __label_1
.annotate 'line', 2353
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
 __label_1: # endif
.annotate 'line', 2354
# var data: $P3
    new $P3, [ 'VarData' ]
    new $P5, [ 'ConstantInternalFail' ]
    $P5.'ConstantInternalFail'(__ARG_1)
    set $P4, $P5
.annotate 'line', 2355
    $P3.'VarData'(__ARG_2, $P4, self, __ARG_5, __ARG_3)
.annotate 'line', 2356
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_3
    isne $I1, __ARG_4, ''
 __label_3:
    unless $I1 goto __label_2
.annotate 'line', 2357
    $P3.'setid'(__ARG_4)
 __label_2: # endif
.annotate 'line', 2358
    $P1[$S1] = $P3
# }
.annotate 'line', 2359

.end # createconst


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2362
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2363
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2364
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2365
    isnull $I1, $P2
    unless $I1 goto __label_2
    getattribute $P3, self, 'owner'
    isnull $I1, $P3
    not $I1
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 2366
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'(__ARG_1)
 __label_1: # endif
.annotate 'line', 2367
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 2368
    'InternalError'('Incorrect data for Variable', __ARG_1)
 __label_3: # endif
.annotate 'line', 2369
    .return($P2)
# }
.annotate 'line', 2370

.end # getvar


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2373
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2374
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2375
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2376
    .return($P2)
# }
.annotate 'line', 2377

.end # getlocalvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2380
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2381
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2382
    .return($S1)
# }
.annotate 'line', 2383

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2386
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2388
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2389
    .return('__WLEX_self')
# }
.annotate 'line', 2390

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2320
    addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2399
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2411
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2412

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2413
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2414
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2415
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2416
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2417
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2418
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2419
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2420
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2421
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2424
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2425

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2429
    .return(self)
# }
.annotate 'line', 2430

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2431
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2434
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2435
# reg: $S2
    ne $S1, 'v', __label_2
    set $S2, ''
    goto __label_1
 __label_2:
    $S2 = self.'tempreg'($S1)
 __label_1:
.annotate 'line', 2436
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2437
    .return($S2)
# }
.annotate 'line', 2438

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2441
# reg: $S1
    null $S1
.annotate 'line', 2442
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_0
.annotate 'line', 2443
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2445
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2446
    self.'emit'(__ARG_1, $S1)
# }
 __label_1: # endif
.annotate 'line', 2448
    .return($S1)
# }
.annotate 'line', 2449

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2452
    getattribute $P1, self, 'start'
    'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2453

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Expr' ]
.annotate 'line', 2407
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2458
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2456
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2468
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2469
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2470
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 2471
    'SyntaxError'('anonymous function expected', $P1)
 __label_0: # endif
.annotate 'line', 2472
    new $P4, [ 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2473

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2474
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2477
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2478
    .return(self)
# }
.annotate 'line', 2479

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2482
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2483
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2484
    self.'annotate'(__ARG_1)
.annotate 'line', 2485
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2486
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 2487
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 2488

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2463
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2465
    addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2503
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2504
    .return(self)
# }
.annotate 'line', 2505

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2508
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2509

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2512
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2513
    .return(self)
# }
.annotate 'line', 2514

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2517
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2518
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 2519
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_3
    goto __label_2
# switch
 __label_3: # case
.annotate 'line', 2521
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2522
    ne $I1, 0, __label_4
.annotate 'line', 2523
    .return(2)
    goto __label_5
 __label_4: # else
.annotate 'line', 2525
    .return(1)
 __label_5: # endif
 __label_2: # default
 __label_1: # switch end
# }
 __label_0: # endif
.annotate 'line', 2528
    .return(0)
# }
.annotate 'line', 2529

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2532
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2534
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2535
    isa $I1, $P1, [ 'NullCheckerExpr' ]
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2536
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2538
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 2539
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
 __label_4:
.annotate 'line', 2540
    set $S3, $S2
    set $S4, 'S'
    if $S3 == $S4 goto __label_7
    set $S4, 'P'
    if $S3 == $S4 goto __label_8
    set $S4, 'I'
    if $S3 == $S4 goto __label_9
    set $S4, 'N'
    if $S3 == $S4 goto __label_10
    goto __label_6
# switch
 __label_7: # case
 __label_8: # case
.annotate 'line', 2543
    __ARG_1.'emitif_null'($S1, __ARG_3)
 __label_9: # case
 __label_10: # case
.annotate 'line', 2546
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2549
    'InternalError'('Invalid if condition')
 __label_5: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2552

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 2555
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2557
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2558
    isa $I1, $P1, [ 'NullCheckerExpr' ]
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2559
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2561
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 2562
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
 __label_4:
.annotate 'line', 2563
    set $S3, $S2
    set $S4, 'S'
    if $S3 == $S4 goto __label_7
    set $S4, 'P'
    if $S3 == $S4 goto __label_8
    set $S4, 'I'
    if $S3 == $S4 goto __label_9
    set $S4, 'N'
    if $S3 == $S4 goto __label_10
    goto __label_6
# switch
 __label_7: # case
 __label_8: # case
.annotate 'line', 2566
    __ARG_1.'emitif_null'($S1, __ARG_2)
 __label_9: # case
 __label_10: # case
.annotate 'line', 2569
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2572
    'InternalError'('Invalid if condition')
 __label_5: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2575

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Condition' ]
.annotate 'line', 2500
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2582
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2583
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Literal' ]
.annotate 'line', 2580
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2593
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2594
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2595

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2596
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2597
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2600
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2601
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2602
# typesinglequoted: $I1
    isa $I1, $P1, [ 'TokenSingleQuoted' ]
.annotate 'line', 2603
# need_unicode: $I2
    null $I2
.annotate 'line', 2604
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $I3, $P3
# {
.annotate 'line', 2605
    le $I3, 127, __label_3
# {
.annotate 'line', 2606
    set $I2, 1
    goto __label_2 # break
.annotate 'line', 2607
# }
 __label_3: # endif
# }
    goto __label_1
 __label_2: # endfor
.annotate 'line', 2610
    unless $I2 goto __label_4
# {
.annotate 'line', 2611
    unless $I1 goto __label_5
# {
.annotate 'line', 2612
    null $I1
.annotate 'line', 2613
# saux: $S2
    set $S2, $S1
.annotate 'line', 2614
    set $S1, ''
.annotate 'line', 2615
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
 __label_6: # for iteration
    unless $P4 goto __label_7
    shift $S3, $P4
# {
.annotate 'line', 2616
    ne $S3, '\', __label_8
.annotate 'line', 2617
    set $S3, '\\'
 __label_8: # endif
.annotate 'line', 2618
    concat $S1, $S1, $S3
# }
    goto __label_6
 __label_7: # endfor
# }
 __label_5: # endif
.annotate 'line', 2621
# result: $S4
    set $S4, ''
.annotate 'line', 2622
# l: $I4
# predefined length
    length $I4, $S1
# for loop
.annotate 'line', 2623
# i: $I5
    null $I5
 __label_11: # for condition
    ge $I5, $I4, __label_10
# {
.annotate 'line', 2624
# c: $S5
# predefined substr
    substr $S5, $S1, $I5, 1
.annotate 'line', 2625
# n: $I6
# predefined ord
    ord $I6, $S5
.annotate 'line', 2626
    le $I6, 127, __label_12
# {
.annotate 'line', 2627
# h: $S6
    box $P5, $I6
    $P2 = $P5.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
 __label_14:
.annotate 'line', 2628
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 2631
    concat $S4, $S4, $S5
 __label_13: # endif
# }
 __label_9: # for iteration
.annotate 'line', 2623
    inc $I5
    goto __label_11
 __label_10: # for end
.annotate 'line', 2633
    set $S1, $S4
# }
 __label_4: # endif
.annotate 'line', 2635
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
 __label_16:
    set $S7, '"'
 __label_15:
.annotate 'line', 2636
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2637
    unless $I2 goto __label_17
.annotate 'line', 2638
    concat $S0, 'unicode:', $S1
    set $S1, $S0
 __label_17: # endif
.annotate 'line', 2639
    .return($S1)
# }
.annotate 'line', 2640

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2643
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2644
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2645
    isa $I1, $P1, [ 'TokenQuoted' ]
    unless $I1 goto __label_1
# {
.annotate 'line', 2646
# var s: $P2
    box $P2, $S1
.annotate 'line', 2647
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
 __label_1: # endif
.annotate 'line', 2649
    .return($S1)
# }
.annotate 'line', 2650

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2653
    set $S1, __ARG_2
    eq $S1, '', __label_0
.annotate 'line', 2654
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
 __label_0: # endif
# }
.annotate 'line', 2655

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2658
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2659

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2588
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2590
    addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3 :optional
        .param int __ARG_4 :opt_flag
# Body
# {
.annotate 'line', 2671
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2672
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2673
# n: $I1
    null $I1
.annotate 'line', 2674
    unless __ARG_4 goto __label_0
.annotate 'line', 2675
    set $I1, __ARG_3
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2677
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 2678
    set $I1, $S1
# }
 __label_1: # endif
.annotate 'line', 2680
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2681

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2682
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2683
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2686
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2687
# i: $I1
    set $S2, $S1
    set $I1, $S2
.annotate 'line', 2688
    .return($I1)
# }
.annotate 'line', 2689

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2692
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2693
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2694
    ne $I1, 0, __label_1
.annotate 'line', 2695
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
 __label_1: # else
.annotate 'line', 2697
    __ARG_1.'emitset'(__ARG_2, $I1)
 __label_2: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 2699

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2702
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2703

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2664
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2666
    addattribute $P0, 'pos'
.annotate 'line', 2667
    addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2713
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2714
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2715

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2716
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2717
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2720
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2721
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2722
    assign $P1, $S1
.annotate 'line', 2723
    .return($P1)
# }
.annotate 'line', 2724

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2727
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2728
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2729
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
 __label_0: # endif
# }
.annotate 'line', 2731

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2736
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2737
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
.annotate 'line', 2738
    concat $S1, $S1, '.0'
 __label_1: # endif
.annotate 'line', 2739
    .return($S1)
# }
.annotate 'line', 2740

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2708
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2710
    addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2748
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2751
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2752
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2753

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2756
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2757

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2760
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2761
    if_null $P1, __label_0
.annotate 'line', 2762
    .tailcall $P1.'gettype'()
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2764
    getattribute $P2, self, 'name'
    set $S1, $P2
    set $S2, 'self'
    if $S1 == $S2 goto __label_4
    set $S2, 'null'
    if $S1 == $S2 goto __label_5
    goto __label_3
# switch
 __label_4: # case
 __label_5: # case
.annotate 'line', 2767
    .return('P')
 __label_3: # default
.annotate 'line', 2769
    .return('')
 __label_2: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2772

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2775
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2776
    .return($S1)
# }
.annotate 'line', 2777

.end # getName


.sub 'checkIdentifier' :method
# Body
# {
.annotate 'line', 2780
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2781
    unless_null $P1, __label_0
.annotate 'line', 2782
    'InternalError'('Bad thing')
 __label_0: # endif
.annotate 'line', 2783
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2784
# s: $S1
    null $S1
.annotate 'line', 2785
    unless_null $P2, __label_1
# {
.annotate 'line', 2786
# sname: $S2
    set $P3, $P1
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
 __label_3:
.annotate 'line', 2787
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_6
    set $S4, 'null'
    if $S3 == $S4 goto __label_7
    goto __label_5
# switch
 __label_6: # case
.annotate 'line', 2789
    set $S1, 'self'
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 2791
    set $S1, 'null'
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 2793
    set $S1, ''
 __label_4: # switch end
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 2797
    $P3 = $P2.'getid'()
    if_null $P3, __label_8
.annotate 'line', 2798
    .tailcall $P2.'getid'()
    goto __label_9
 __label_8: # else
.annotate 'line', 2800
    $P4 = $P2.'getreg'()
    set $S1, $P4
 __label_9: # endif
# }
 __label_2: # endif
.annotate 'line', 2802
    .return($S1)
# }
.annotate 'line', 2803

.end # checkIdentifier


.sub 'getIdentifier' :method
# Body
# {
.annotate 'line', 2806
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2807
    set $S2, $P1
    ne $S2, '', __label_0
# {
.annotate 'line', 2808
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
 __label_1:
.annotate 'line', 2809
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    getattribute $P2, self, 'name'
    'SyntaxError'($S2, $P2)
# }
 __label_0: # endif
.annotate 'line', 2811
    .return($P1)
# }
.annotate 'line', 2812

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2815
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2816
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2817
    if_null $P2, __label_0
# {
.annotate 'line', 2818
    $I2 = $P2.'isconst'()
    unless $I2 goto __label_2
    $P3 = $P2.'getid'()
    isnull $I2, $P3
 __label_2:
    unless $I2 goto __label_1
.annotate 'line', 2819
    .tailcall $P2.'getvalue'()
 __label_1: # endif
.annotate 'line', 2820
# flags: $I1
    $P3 = $P2.'getflags'()
    set $I1, $P3
.annotate 'line', 2821
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2822
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 2823
    new $P4, [ 'LexicalVolatileExpr' ]
    $P4.'LexicalVolatileExpr'(self, $P2)
    set $P3, $P4
    .return($P3)
 __label_4: # endif
# }
 __label_3: # endif
# }
 __label_0: # endif
.annotate 'line', 2826
    .return(self)
# }
.annotate 'line', 2827

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2830
# id: $S1
    $P2 = self.'getIdentifier'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2831
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2832
# flags: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
 __label_2:
    $I1 = $P1.'getflags'()
 __label_1:
.annotate 'line', 2833
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2834
    band $I3, $I1, 2
    unless $I3 goto __label_4
# {
.annotate 'line', 2835
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
 __label_5:
.annotate 'line', 2836
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_7
    isne $I2, $S2, ''
 __label_7:
    unless $I2 goto __label_6
.annotate 'line', 2837
    __ARG_1.'emitfind_lex'($S1, $S2)
 __label_6: # endif
# }
 __label_4: # endif
# }
 __label_3: # endif
.annotate 'line', 2840
    .return($S1)
# }
.annotate 'line', 2841

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2844
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2845
    self.'annotate'(__ARG_1)
.annotate 'line', 2846
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2847
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_0: # endif
# }
.annotate 'line', 2849

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2852
    self.'annotate'(__ARG_1)
.annotate 'line', 2853
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2854
    .return($S1)
# }
.annotate 'line', 2855

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2858
    self.'annotate'(__ARG_1)
.annotate 'line', 2859
    $P1 = self.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# predefined die
.annotate 'line', 2860
    die "NO"
 __label_0: # endif
.annotate 'line', 2861
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2862
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 2863
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
# {
.annotate 'line', 2864
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_7
    set $S6, 'P'
    if $S5 == $S6 goto __label_8
    goto __label_6
# switch
 __label_7: # case
 __label_8: # case
.annotate 'line', 2867
    __ARG_1.'emitnull'($S2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2870
    getattribute $P2, self, 'start'
    'SyntaxError'("Can't assign null to that type", $P2)
 __label_5: # switch end
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 2873
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_9
.annotate 'line', 2874
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
# {
.annotate 'line', 2876
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_11
    set $S3, $P1
 __label_11:
.annotate 'line', 2877
    ne $S3, 'v', __label_12
.annotate 'line', 2878
    getattribute $P1, self, 'start'
    'SyntaxError'("Can't assign from void expression", $P1)
 __label_12: # endif
.annotate 'line', 2879
    ne $S1, $S3, __label_13
# {
.annotate 'line', 2880
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 2883
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_15
    set $S4, $P1
 __label_15:
.annotate 'line', 2884
    self.'annotate'(__ARG_1)
.annotate 'line', 2885
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_18
    isne $I1, $S3, 'P'
 __label_18:
    unless $I1 goto __label_16
.annotate 'line', 2886
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_17
 __label_16: # else
.annotate 'line', 2888
    __ARG_1.'emitset'($S2, $S4)
 __label_17: # endif
# }
 __label_14: # endif
# }
 __label_10: # endif
 __label_4: # endif
.annotate 'line', 2891
    .return($S2)
# }
.annotate 'line', 2892

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2745
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2747
    addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2902
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 2903
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2904

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2905
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2908
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2909
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2910
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 2911
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 2912
    .return($S2)
# }
.annotate 'line', 2913

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2916
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2917
    self.'annotate'(__ARG_1)
.annotate 'line', 2918
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2919
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_0: # endif
# }
.annotate 'line', 2921

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2924
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2925
    $P2 = __ARG_2.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2926
    __ARG_1.'emitnull'($S1)
    goto __label_2
 __label_1: # else
.annotate 'line', 2927
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 2928
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 2930
# typeright: $S2
    $P3 = __ARG_2.'checkresult'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 2931
    ne 'P', $S2, __label_6
# {
.annotate 'line', 2932
    __ARG_2.'emit'(__ARG_1, $S1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 2935
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
 __label_8:
.annotate 'line', 2936
    self.'annotate'(__ARG_1)
.annotate 'line', 2937
    __ARG_1.'emitbox'($S1, $S3)
# }
 __label_7: # endif
# }
 __label_4: # endif
 __label_2: # endif
.annotate 'line', 2941
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2942
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 2943
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 2944

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2897
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2899
    addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2953
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2954

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2949
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2965
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 2966
    $P2 = 'parseClassSpecifier'(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 2967

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2968
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2971
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 2974
    set $S1, __ARG_2
    ne $S1, '', __label_0
.annotate 'line', 2975
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
 __label_0: # endif
.annotate 'line', 2976
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 2977
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 2978
    __ARG_1.'say'()
# }
.annotate 'line', 2979

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 2959
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2961
    addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2989
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2990
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2991

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 2994
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2995

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2998
    self.'optimizearg'()
.annotate 'line', 2999
    .return(self)
# }
.annotate 'line', 3000

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2984
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2986
    addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3011
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3012
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3013
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3014

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3017
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3018
    .return(self)
# }
.annotate 'line', 3019

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3022
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3023

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3026
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3027
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3028

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3031
    self.'optimizearg'()
.annotate 'line', 3032
    .return(self)
# }
.annotate 'line', 3033

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3036
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3037
    .return($S1)
# }
.annotate 'line', 3038

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3041
# reg: $S1
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3042
    .return($S1)
# }
.annotate 'line', 3043

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 3005
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3007
    addattribute $P0, 'lexpr'
.annotate 'line', 3008
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3052
    .return('I')
# }
.annotate 'line', 3053

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3056
    self.'optimizearg'()
.annotate 'line', 3057
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3058
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3059
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3060
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3061
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3062
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
 __label_0: # endif
.annotate 'line', 3064
    .return(self)
# }
.annotate 'line', 3065

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 3048
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3074
    .return('I')
# }
.annotate 'line', 3075

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 3070
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDeleteExpr' ]

.sub 'OpDeleteExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3083
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3084

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3087
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3088
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_2
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 3089
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3090
    self.'annotate'(__ARG_1)
.annotate 'line', 3091
    __ARG_1.'print'('    delete ')
.annotate 'line', 3092
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3093
    __ARG_1.'say'()
.annotate 'line', 3094
    set $S1, __ARG_2
    eq $S1, '', __label_3
.annotate 'line', 3095
    __ARG_1.'emitset'(__ARG_2, '1')
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 3098
    getattribute $P2, self, 'start'
    'SyntaxError'("delete with invalid operator", $P2)
 __label_1: # endif
# }
.annotate 'line', 3099

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3079
    get_class $P1, [ 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'OpExistsExpr' ]

.sub 'OpExistsExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3106
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3107

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3110
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3111
# reg: $S1
    set $S2, __ARG_2
    eq $S2, '', __label_1
    set $P2, __ARG_2
    goto __label_0
 __label_1:
    $P2 = self.'tempreg'('I')
 __label_0:
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
 __label_2:
.annotate 'line', 3112
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_5
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3113
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3114
    self.'annotate'(__ARG_1)
.annotate 'line', 3115
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3116
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3117
    __ARG_1.'say'()
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 3120
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
 __label_4: # endif
# }
.annotate 'line', 3121

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3124
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3125
# reg: $S1
    $P2 = self.'tempreg'('I')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 3126
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3127
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3128
    self.'annotate'(__ARG_1)
.annotate 'line', 3129
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3130
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3131
    __ARG_1.'say'()
.annotate 'line', 3132
    .return($S1)
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 3135
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
 __label_2: # endif
# }
.annotate 'line', 3136

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3102
    get_class $P1, [ 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'OpUnaryMinusExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3145
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3146

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3149
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3150

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3153
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3154
    .return(self)
# }
.annotate 'line', 3155

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3158
    self.'optimizearg'()
.annotate 'line', 3159
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3160
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3161
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3162
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $I2, $I1
    .tailcall 'integerValue'($P3, $P5, $I2)
# }
 __label_0: # endif
# {
.annotate 'line', 3165
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3166
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3167
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3168
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $N2, $N1
    .tailcall 'floatValue'($P3, $P5, $N2)
# }
 __label_1: # endif
# }
.annotate 'line', 3171
    .return(self)
# }
.annotate 'line', 3172

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3175
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3176
    self.'annotate'(__ARG_1)
.annotate 'line', 3177
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3178

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3141
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'OpNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3187
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3188

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3189
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3192
    .return('I')
# }
.annotate 'line', 3193

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3196
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3197
    .return(self)
# }
.annotate 'line', 3198

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3201
    self.'optimizearg'()
.annotate 'line', 3202
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3203
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3204
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3205
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3206
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall 'integerValue'($P3, $P4, $I2)
# }
 __label_0: # endif
.annotate 'line', 3208
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 3209
    .tailcall $P1.'negated'()
 __label_1: # endif
.annotate 'line', 3210
    .return(self)
# }
.annotate 'line', 3211

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3214
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3215

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3218
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3219
    self.'annotate'(__ARG_1)
.annotate 'line', 3220
# type: $S2
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3221
    set $S3, $S2
    set $S4, 'I'
    if $S3 == $S4 goto __label_4
    set $S4, 'P'
    if $S3 == $S4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 3223
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 3226
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 3229
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
 __label_2: # switch end
# }
.annotate 'line', 3231

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3183
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3240
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3241

.end # OpPreIncExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3244
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3245

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3248
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3249
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3250
    .return(self)
# }
.annotate 'line', 3251

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3254
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3255
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3256
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3257

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3260
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3261
    self.'annotate'(__ARG_1)
.annotate 'line', 3262
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3263
    .return($S1)
# }
.annotate 'line', 3264

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3236
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3273
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3274
    .return(self)
# }
.annotate 'line', 3275

.end # OpPostIncExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3278
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3279

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3282
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3283
    self.'annotate'(__ARG_1)
.annotate 'line', 3284
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3285
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
.annotate 'line', 3286
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3287
    .return($S1)
# }
.annotate 'line', 3288

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3269
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3297
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3298

.end # OpPreDecExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3301
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3302

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3305
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3306
    .return(self)
# }
.annotate 'line', 3307

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3310
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3311
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3312
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3313

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3316
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3317
    self.'annotate'(__ARG_1)
.annotate 'line', 3318
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3319
    .return($S1)
# }
.annotate 'line', 3320

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3293
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3329
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3330
    .return(self)
# }
.annotate 'line', 3331

.end # OpPostDecExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3334
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3335

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3338
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3339
    self.'annotate'(__ARG_1)
.annotate 'line', 3340
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3341
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
.annotate 'line', 3342
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3343
    .return($S1)
# }
.annotate 'line', 3344

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3325
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3355
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3356
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3357
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3358
    .return(self)
# }
.annotate 'line', 3359

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3362
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3363

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3366
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3367
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3368
    .return(self)
# }
.annotate 'line', 3369

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3372
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3373

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3376
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3377
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3378
    self.'annotate'(__ARG_1)
.annotate 'line', 3379
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_1: # endif
# }
.annotate 'line', 3381

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3349
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3351
    addattribute $P0, 'lexpr'
.annotate 'line', 3352
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3390
    self.'annotate'(__ARG_1)
.annotate 'line', 3391
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3392
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3393

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3386
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3402
    self.'annotate'(__ARG_1)
.annotate 'line', 3403
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3404
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_2
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3405
    __ARG_1.'emitassign'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3406

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3409
    self.'annotate'(__ARG_1)
.annotate 'line', 3410
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3411
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3412
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3413
    .return($S1)
# }
.annotate 'line', 3414

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3398
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3423
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3424
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3425
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 3426
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 3427
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 3428
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_5
    isa $I1, $P2, [ 'ConcatString' ]
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 3429
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 3431
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_6
    set $S4, $P3
 __label_6:
.annotate 'line', 3432
# aux: $S5
    null $S5
.annotate 'line', 3433
    self.'annotate'(__ARG_1)
.annotate 'line', 3434
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_9
    set $S7, 'I'
    if $S6 == $S7 goto __label_10
    set $S7, 'N'
    if $S6 == $S7 goto __label_11
    goto __label_8
# switch
 __label_9: # case
.annotate 'line', 3436
    eq $S2, 'S', __label_12
# {
.annotate 'line', 3437
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3438
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3439
    set $S4, $S5
# }
 __label_12: # endif
.annotate 'line', 3441
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
.annotate 'line', 3445
    eq $S1, $S2, __label_13
# {
.annotate 'line', 3446
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3447
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3448
    set $S4, $S5
# }
 __label_13: # endif
.annotate 'line', 3450
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 3453
    __ARG_1.'emitaddto'($S3, $S4)
 __label_7: # switch end
# }
 __label_4: # endif
.annotate 'line', 3456
    .return($S3)
# }
.annotate 'line', 3457

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3419
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3466
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3467
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3468
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 3469
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 3470
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 3471
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 3472
# aux: $S5
    null $S5
.annotate 'line', 3473
    self.'annotate'(__ARG_1)
.annotate 'line', 3474
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_6
    set $S7, 'I'
    if $S6 == $S7 goto __label_7
    set $S7, 'N'
    if $S6 == $S7 goto __label_8
    goto __label_5
# switch
 __label_6: # case
.annotate 'line', 3476
    getattribute $P3, self, 'start'
    'SyntaxError'("-= can't be applied to string", $P3)
 __label_7: # case
 __label_8: # case
.annotate 'line', 3479
    eq $S1, $S2, __label_9
# {
.annotate 'line', 3480
    $P4 = self.'tempreg'($S1)
    set $S5, $P4
.annotate 'line', 3481
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3482
    set $S4, $S5
# }
 __label_9: # endif
.annotate 'line', 3484
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 3487
    __ARG_1.'emitsubto'($S3, $S4)
 __label_4: # switch end
.annotate 'line', 3489
    .return($S3)
# }
.annotate 'line', 3490

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3462
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3499
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3500
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3501
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3502
# rreg: $S4
    null $S4
.annotate 'line', 3503
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 3505
    ne $S2, 'I', __label_6
.annotate 'line', 3506
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 3508
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3509
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
 __label_7: # endif
.annotate 'line', 3511
    self.'annotate'(__ARG_1)
.annotate 'line', 3512
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 3515
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3516
    self.'annotate'(__ARG_1)
.annotate 'line', 3517
    __ARG_1.'emitarg2'('mul', $S3, $S4)
 __label_3: # switch end
.annotate 'line', 3519
    .return($S3)
# }
.annotate 'line', 3520

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3495
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3529
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3530
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3531
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3532
    self.'annotate'(__ARG_1)
.annotate 'line', 3533
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3534
    .return($S2)
# }
.annotate 'line', 3535

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3525
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3544
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3545
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3546
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3547
    self.'annotate'(__ARG_1)
.annotate 'line', 3548
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3549
    .return($S2)
# }
.annotate 'line', 3550

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3540
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3557
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3560
    self.'optimizearg'()
.annotate 'line', 3561
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3562
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3563
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3564
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3565
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3566
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
 __label_0: # endif
.annotate 'line', 3568
    .return(self)
# }
.annotate 'line', 3569

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3572
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3573
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3574
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3575
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_3
    set $S4, $P1
 __label_3:
.annotate 'line', 3576
    self.'annotate'(__ARG_1)
.annotate 'line', 3577
# aux: $S5
    null $S5
.annotate 'line', 3578
    iseq $I1, $S1, 'N'
    if $I1 goto __label_6
    iseq $I1, $S2, 'N'
 __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3580
    ne $S1, 'I', __label_7
# {
.annotate 'line', 3581
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3582
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3583
    set $S3, $S5
# }
 __label_7: # endif
.annotate 'line', 3585
    ne $S2, 'I', __label_8
# {
.annotate 'line', 3586
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3587
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3588
    set $S4, $S5
# }
 __label_8: # endif
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 3591
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_11
    iseq $I1, $S1, 'P'
 __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 3592
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3593
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3594
    set $S3, $S5
# }
    goto __label_10
 __label_9: # else
.annotate 'line', 3596
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 3597
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3598
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3599
    set $S4, $S5
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 3601
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_17
    iseq $I1, $S1, 'P'
 __label_17:
    unless $I1 goto __label_15
# {
.annotate 'line', 3602
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3603
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3604
    set $S3, $S5
# }
    goto __label_16
 __label_15: # else
.annotate 'line', 3606
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_19
    iseq $I1, $S1, 'S'
 __label_19:
    unless $I1 goto __label_18
# {
.annotate 'line', 3607
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3608
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3609
    set $S4, $S5
# }
 __label_18: # endif
 __label_16: # endif
 __label_13: # endif
 __label_10: # endif
 __label_5: # endif
.annotate 'line', 3612
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_22
    set $I2, 1
    if $I1 == $I2 goto __label_23
    set $I2, 2
    if $I1 == $I2 goto __label_24
    goto __label_21
# switch
 __label_22: # case
.annotate 'line', 3614
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_23: # case
.annotate 'line', 3617
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_24: # case
.annotate 'line', 3620
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_21: # default
 __label_20: # switch end
.annotate 'line', 3621
# }
.annotate 'line', 3623

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3626
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3627

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3630
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3631

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3634
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3635

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3555
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 3650
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3651
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3652
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3653

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3654
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3655
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3658
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3659
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3660
    .return(self)
# }
.annotate 'line', 3661

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3664
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3665
    self.'annotate'(__ARG_1)
.annotate 'line', 3666
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3667
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 3668
    __ARG_1.'emitarg1'('not', __ARG_2)
 __label_1: # endif
# }
.annotate 'line', 3669

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3672
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3673
    self.'annotate'(__ARG_1)
.annotate 'line', 3674
    getattribute $P1, self, 'checknull'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S2, 'unless'
    goto __label_1
 __label_2:
    set $S2, 'if'
 __label_1:
    __ARG_1.'say'('    ', $S2, '_null ', $S1, ', ', __ARG_2)
# }
.annotate 'line', 3675

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3643
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3645
    addattribute $P0, 'expr'
.annotate 'line', 3646
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3682
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3685
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3686

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3689
    self.'optimizearg'()
.annotate 'line', 3690
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3691
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3692
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3693
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3694
    unless $I1 goto __label_0
# {
.annotate 'line', 3695
    unless $I2 goto __label_1
.annotate 'line', 3696
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 1)
    goto __label_2
 __label_1: # else
.annotate 'line', 3698
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3700
    unless $I2 goto __label_3
.annotate 'line', 3701
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3702
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
 __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3703
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3704
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3705
    ne $S1, $S2, __label_8
# {
.annotate 'line', 3706
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
# switch
 __label_11: # case
.annotate 'line', 3708
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3709
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3710
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
 __label_12: # case
.annotate 'line', 3712
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
 __label_13:
.annotate 'line', 3713
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
 __label_14:
.annotate 'line', 3714
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    iseq $I6, $S3, $S4
    .tailcall 'integerValue'($P11, $P12, $I6)
 __label_10: # default
 __label_9: # switch end
# }
 __label_8: # endif
# }
 __label_4: # endif
.annotate 'line', 3718
    .return(self)
# }
.annotate 'line', 3719

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3722
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3723

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3726
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3727

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3730
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3731

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3734
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3735

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3680
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3742
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3745
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3746

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3749
    self.'optimizearg'()
.annotate 'line', 3750
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3751
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3752
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3753
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3754
    unless $I1 goto __label_0
# {
.annotate 'line', 3755
    unless $I2 goto __label_1
.annotate 'line', 3756
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 0)
    goto __label_2
 __label_1: # else
.annotate 'line', 3758
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3760
    unless $I2 goto __label_3
.annotate 'line', 3761
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3762
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
 __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3763
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3764
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3765
    ne $S1, $S2, __label_8
# {
.annotate 'line', 3766
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
# switch
 __label_11: # case
.annotate 'line', 3768
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3769
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3770
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
 __label_12: # case
.annotate 'line', 3772
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
 __label_13:
.annotate 'line', 3773
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
 __label_14:
.annotate 'line', 3774
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    isne $I6, $S3, $S4
    .tailcall 'integerValue'($P11, $P12, $I6)
 __label_10: # default
 __label_9: # switch end
# }
 __label_8: # endif
# }
 __label_4: # endif
.annotate 'line', 3778
    .return(self)
# }
.annotate 'line', 3779

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3782
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3783

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3786
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3787

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3790
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3791

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3794
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3795

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3740
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSameExpr' ]

.sub 'OpSameExpr' :method
        .param int __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 3805
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3806
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3807

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3808
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3811
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3812
    new $P2, [ 'OpSameExpr' ]
    not $I2, $I1
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'lexpr'
    getattribute $P6, self, 'rexpr'
    $P2.'OpSameExpr'($I2, $P3, $P4, $P5, $P6)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 3813

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3816
    getattribute $P1, self, 'positive'
    if_null $P1, __label_1
    unless $P1 goto __label_1
    iseq $I1, __ARG_1, __ARG_2
    goto __label_0
 __label_1:
    isne $I1, __ARG_1, __ARG_2
 __label_0:
    .return($I1)
# }
.annotate 'line', 3817

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3820
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3821
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'issame'
    goto __label_0
 __label_1:
    set $S1, 'isntsame'
 __label_0:
.annotate 'line', 3822
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3823

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3826
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3827

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3830
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3831
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'eq_addr'
    goto __label_0
 __label_1:
    set $S1, 'ne_addr'
 __label_0:
.annotate 'line', 3832
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3833

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3836
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3837
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'ne_addr'
    goto __label_0
 __label_1:
    set $S1, 'eq_addr'
 __label_0:
.annotate 'line', 3838
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3839

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3800
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3802
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3846
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3849
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3850

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3853
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3854

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3857
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3858

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3861
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3862

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3865
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3866

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3844
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3873
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3876
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3877

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3880
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3881

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3884
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3885

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3888
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3889

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3892
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3893

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3871
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3900
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3903
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3904

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3907
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3908

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3911
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3912

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3915
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3916

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3919
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3920

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3898
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3927
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3930
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3931

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3934
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3935

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3938
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3939

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3942
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3943

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3946
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3947

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3925
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3956
    .return('I')
# }
.annotate 'line', 3957

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3952
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'OpBoolAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3966
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3967

.end # OpBoolAndExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3970
    self.'optimizearg'()
.annotate 'line', 3971
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3972
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3973
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3974
    eq $I1, 0, __label_1
.annotate 'line', 3975
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 3977
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3979
    .return(self)
# }
.annotate 'line', 3980

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3983
# res: $S1
    if_null __ARG_2, __label_1
    set $P1, __ARG_2
    goto __label_0
 __label_1:
    $P1 = self.'tempreg'('I')
 __label_0:
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 3984
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3985
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
 __label_6:
.annotate 'line', 3986
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
 __label_7:
.annotate 'line', 3987
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 3990
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
 __label_8:
.annotate 'line', 3991
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3992
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3993
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3994
    __ARG_1.'emitlabel'($S4)
# }
 __label_4: # endif
# }
.annotate 'line', 3996

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3962
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'OpBoolOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4005
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4006

.end # OpBoolOrExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4009
    self.'optimizearg'()
.annotate 'line', 4010
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 4011
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4012
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4013
    ne $I1, 0, __label_1
.annotate 'line', 4014
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 4016
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 4018
    .return(self)
# }
.annotate 'line', 4019

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4022
# res: $S1
    null $S1
.annotate 'line', 4023
    if_null __ARG_2, __label_0
.annotate 'line', 4024
    set $S1, __ARG_2
    goto __label_1
 __label_0: # else
.annotate 'line', 4026
    $P1 = self.'tempreg'('I')
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 4027
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_4
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_4:
    unless $I1 goto __label_2
# {
.annotate 'line', 4028
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 4029
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
 __label_6:
.annotate 'line', 4030
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 4033
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_7
    set $S4, $P1
 __label_7:
.annotate 'line', 4034
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4035
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4036
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4037
    __ARG_1.'emitlabel'($S4)
# }
 __label_3: # endif
# }
.annotate 'line', 4039

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 4001
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 4044
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'OpBinAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4054
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4055

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4058
# res: $S1
    if_null __ARG_2, __label_1
    set $P1, __ARG_2
    goto __label_0
 __label_1:
    $P1 = self.'tempreg'('I')
 __label_0:
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 4059
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4060
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4061
    self.'annotate'(__ARG_1)
.annotate 'line', 4062
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4063

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4066
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4067

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 4050
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'OpBinOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4076
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4077

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4080
# res: $S1
    if_null __ARG_2, __label_1
    set $P1, __ARG_2
    goto __label_0
 __label_1:
    $P1 = self.'tempreg'('I')
 __label_0:
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 4081
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4082
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4083
    self.'annotate'(__ARG_1)
.annotate 'line', 4084
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4085

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4088
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4089

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 4072
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinXorExpr' ]

.sub 'OpBinXorExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4098
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4099

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4102
# res: $S1
    if_null __ARG_2, __label_1
    set $P1, __ARG_2
    goto __label_0
 __label_1:
    $P1 = self.'tempreg'('I')
 __label_0:
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 4103
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4104
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4105
    self.'annotate'(__ARG_1)
.annotate 'line', 4106
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4107

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4110
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4111

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 4094
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4121
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4122
    isa $I1, __ARG_3, [ 'ConcatString' ]
    unless $I1 goto __label_0
# {
.annotate 'line', 4123
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4124
    isa $I1, __ARG_4, [ 'ConcatString' ]
    unless $I1 goto __label_2
.annotate 'line', 4125
    getattribute $P1, self, 'values'
    getattribute $P2, __ARG_4, 'values'
    $P1.'append'($P2)
    goto __label_3
 __label_2: # else
.annotate 'line', 4127
    getattribute $P3, self, 'values'
# predefined push
    push $P3, __ARG_4
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 4129
    isa $I1, __ARG_4, [ 'ConcatString' ]
    unless $I1 goto __label_4
# {
.annotate 'line', 4130
    getattribute $P2, __ARG_4, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4131
    getattribute $P1, self, 'values'
    $P1.'unshift'(__ARG_3)
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4134
    root_new $P2, ['parrot';'ResizablePMCArray']
    push $P2, __ARG_3
    push $P2, __ARG_4
    setattribute self, 'values', $P2
 __label_5: # endif
 __label_1: # endif
# }
.annotate 'line', 4135

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4136
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4139
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4140
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4141
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4142
# i: $I2
    null $I2
# for loop
.annotate 'line', 4143
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4144
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
 __label_0: # for iteration
.annotate 'line', 4143
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4145
    .return($P2)
# }
.annotate 'line', 4146

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4149
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4150
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4151
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4152
    self.'annotate'(__ARG_1)
.annotate 'line', 4153
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4154
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4155
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_0: # for iteration
.annotate 'line', 4154
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4156
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4157

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4160
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4161
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4162
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4163
    self.'annotate'(__ARG_1)
.annotate 'line', 4164
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4165
# i: $I2
    set $I2, 2
 __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4166
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_1: # for iteration
.annotate 'line', 4165
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4167
    .return($S1)
# }
.annotate 'line', 4168

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4171
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4172
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4173
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4174
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4175
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4174
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4176

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4179
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4180
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4181
    self.'annotate'(__ARG_1)
.annotate 'line', 4182
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4183
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4184
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4183
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4185

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 4116
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4118
    addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4194
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4195

.end # OpAddExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4198
    self.'optimizearg'()
.annotate 'line', 4199
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4200
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4201
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_0
    set $S1, $P10
 __label_0:
.annotate 'line', 4202
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_1
    set $S2, $P10
 __label_1:
.annotate 'line', 4203
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_3
    $I3 = $P2.'isliteral'()
 __label_3:
    unless $I3 goto __label_2
# {
.annotate 'line', 4204
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_5
    iseq $I4, $S2, 'S'
 __label_5:
    unless $I4 goto __label_4
# {
.annotate 'line', 4209
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4210
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4211
# var t: $P5
    isa $I3, $P3, [ 'TokenSingleQuoted' ]
    unless $I3 goto __label_8
.annotate 'line', 4212
    isa $I3, $P4, [ 'TokenSingleQuoted' ]
 __label_8:
    unless $I3 goto __label_7
.annotate 'line', 4214
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4215
    getattribute $P13, $P3, 'str'
    set $S3, $P13
# predefined string
    getattribute $P14, $P4, 'str'
    set $S4, $P14
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_6
 __label_7:
.annotate 'line', 4217
    new $P15, [ 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4218
    $P18 = $P3.'getasquoted'()
    set $S6, $P18
# predefined string
    $P19 = $P4.'getasquoted'()
    set $S7, $P19
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
 __label_6:
.annotate 'line', 4219
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
 __label_4: # endif
.annotate 'line', 4221
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_10
    iseq $I3, $S2, 'I'
 __label_10:
    unless $I3 goto __label_9
# {
.annotate 'line', 4222
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4223
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4224
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4225
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4226
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall 'integerValue'($P10, $P11, $I3)
# }
 __label_9: # endif
# {
.annotate 'line', 4229
    $P10 = 'floatresult'($S1, $S2)
    if_null $P10, __label_11
    unless $P10 goto __label_11
# {
.annotate 'line', 4230
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4231
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4232
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4233
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4234
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall 'floatValue'($P10, $P11, $N3)
# }
 __label_11: # endif
# }
# }
 __label_2: # endif
.annotate 'line', 4238
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_13
    iseq $I3, $S2, 'S'
 __label_13:
    unless $I3 goto __label_12
# {
.annotate 'line', 4239
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
 __label_12: # endif
.annotate 'line', 4241
    .return(self)
# }
.annotate 'line', 4242

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4245
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4246
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4247
    ne $S1, $S2, __label_2
.annotate 'line', 4248
    .return($S1)
 __label_2: # endif
.annotate 'line', 4249
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'S'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4250
    .return('S')
 __label_3: # endif
.annotate 'line', 4251
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4252
    .return('S')
 __label_5: # endif
.annotate 'line', 4253
    $P1 = 'floatresult'($S1, $S2)
    if_null $P1, __label_7
    unless $P1 goto __label_7
.annotate 'line', 4254
    .return('N')
 __label_7: # endif
.annotate 'line', 4255
    .return('I')
# }
.annotate 'line', 4256

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4259
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4260
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4261
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4262
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4263
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 4265
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 4266
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_4
    set $S5, $P3
 __label_4:
.annotate 'line', 4267
    ne $S1, 'S', __label_5
# {
.annotate 'line', 4268
    isne $I1, $S2, 'S'
    if $I1 goto __label_8
    isne $I1, $S3, 'S'
 __label_8:
    unless $I1 goto __label_7
# {
.annotate 'line', 4269
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_9
    set $S6, $P3
 __label_9:
.annotate 'line', 4270
    eq $S2, 'S', __label_10
# {
.annotate 'line', 4271
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4272
    set $S4, $S6
# }
    goto __label_11
 __label_10: # else
# {
.annotate 'line', 4275
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4276
    set $S5, $S6
# }
 __label_11: # endif
# }
 __label_7: # endif
.annotate 'line', 4279
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_6
 __label_5: # else
# {
.annotate 'line', 4282
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_14
    isne $I1, $S2, 'I'
    if $I1 goto __label_15
    isne $I1, $S3, 'I'
 __label_15:
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 4283
# l: $S7
    null $S7
.annotate 'line', 4284
    ne $S2, 'I', __label_16
    set $S7, $S4
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4286
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4287
    __ARG_1.'emitset'($S7, $S4)
# }
 __label_17: # endif
.annotate 'line', 4289
# r: $S8
    null $S8
.annotate 'line', 4290
    ne $S3, 'I', __label_18
    set $S8, $S5
    goto __label_19
 __label_18: # else
# {
.annotate 'line', 4292
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4293
    __ARG_1.'emitset'($S8, $S5)
# }
 __label_19: # endif
.annotate 'line', 4295
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 4298
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
 __label_13: # endif
# }
 __label_6: # endif
# }
.annotate 'line', 4300

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4190
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'OpSubExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4309
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4310

.end # OpSubExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4313
    self.'optimizearg'()
.annotate 'line', 4314
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4315
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4316
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4317
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4318
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4319
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4320
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4321
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4322
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4323
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4324
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall 'integerValue'($P5, $P6, $I3)
# }
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 4327
    .return(self)
# }
.annotate 'line', 4328

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4331
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4332
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4333
    ne $S1, $S2, __label_2
.annotate 'line', 4334
    .return($S1)
 __label_2: # endif
.annotate 'line', 4335
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'N'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4336
    .return('N')
 __label_3: # endif
.annotate 'line', 4337
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4338
    .return('N')
 __label_5: # endif
.annotate 'line', 4339
    .return('I')
# }
.annotate 'line', 4340

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4343
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4344
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4345
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4346

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4305
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'OpMulExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4355
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4356

.end # OpMulExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4359
    self.'optimizearg'()
.annotate 'line', 4360
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4361
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4362
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4363
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
 __label_2:
.annotate 'line', 4364
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_3
    set $S2, $P7
 __label_3:
.annotate 'line', 4365
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4366
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4367
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4368
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4369
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4370
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall 'integerValue'($P7, $P8, $I3)
# }
 __label_4: # endif
# {
.annotate 'line', 4373
    $P7 = 'floatresult'($S1, $S2)
    if_null $P7, __label_6
    unless $P7 goto __label_6
# {
.annotate 'line', 4374
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4375
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4376
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4377
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4378
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall 'floatValue'($P7, $P8, $N3)
# }
 __label_6: # endif
# }
# }
 __label_0: # endif
.annotate 'line', 4382
    .return(self)
# }
.annotate 'line', 4383

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4386
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4387
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4388
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 4389
    ne $S1, $S2, __label_2
.annotate 'line', 4390
    .return($S1)
 __label_2: # endif
.annotate 'line', 4391
    ne $S1, 'S', __label_3
.annotate 'line', 4392
    .return('S')
    goto __label_4
 __label_3: # else
.annotate 'line', 4394
    .return('N')
 __label_4: # endif
# }
.annotate 'line', 4395

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4398
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4399
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4400
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4401
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4402
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4403
    ne $S1, 'S', __label_2
# {
.annotate 'line', 4404
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4405
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4406
# rval: $S5
    null $S5
.annotate 'line', 4407
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 4409
    set $S5, $S4
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 4412
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4413
    __ARG_1.'emitset'($S5, $S4)
 __label_3: # switch end
.annotate 'line', 4415
    self.'annotate'(__ARG_1)
.annotate 'line', 4416
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4417
    .return()
# }
 __label_2: # endif
.annotate 'line', 4419
    iseq $I3, $S1, $S2
    unless $I3 goto __label_7
    iseq $I3, $S1, 'I'
    if $I3 goto __label_9
    iseq $I3, $S1, 'N'
 __label_9:
    if $I3 goto __label_8
    iseq $I3, $S1, 'P'
 __label_8:
 __label_7:
    unless $I3 goto __label_6
# {
.annotate 'line', 4420
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4421
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4422
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4423
    .return()
# }
 __label_6: # endif
.annotate 'line', 4428
    ne $S1, 'N', __label_10
# {
.annotate 'line', 4429
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4430
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4431
# rval: $S6
    null $S6
.annotate 'line', 4432
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_13
    set $S8, 'N'
    if $S7 == $S8 goto __label_14
    goto __label_12
# switch
 __label_13: # case
.annotate 'line', 4434
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4435
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4436
    set $S6, $S4
    goto __label_11 # break
 __label_14: # case
.annotate 'line', 4439
    set $S6, $S4
    goto __label_11 # break
 __label_12: # default
.annotate 'line', 4442
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4443
    __ARG_1.'emitset'($S6, $S4)
 __label_11: # switch end
.annotate 'line', 4445
    set $S7, __ARG_2
    eq $S7, '', __label_15
# {
.annotate 'line', 4446
    self.'annotate'(__ARG_1)
.annotate 'line', 4447
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
 __label_15: # endif
.annotate 'line', 4449
    .return()
# }
 __label_10: # endif
.annotate 'line', 4452
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4453
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P1.'isidentifier'()
 __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4454
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4455
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4458
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4459
    set $S3, $I1
# }
 __label_17: # endif
.annotate 'line', 4461
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_21
    $I3 = $P2.'isidentifier'()
 __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 4462
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4463
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_20
 __label_19: # else
# {
.annotate 'line', 4466
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_24
    set $S8, 'N'
    if $S7 == $S8 goto __label_25
    set $S8, 'I'
    if $S7 == $S8 goto __label_26
    goto __label_23
# switch
 __label_24: # case
.annotate 'line', 4468
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4469
    $P2.'emit'(__ARG_1, $S4)
    goto __label_22 # break
 __label_25: # case
.annotate 'line', 4472
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_22 # break
 __label_26: # case
 __label_23: # default
.annotate 'line', 4476
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4477
    set $S4, $I2
    goto __label_22 # break
 __label_22: # switch end
.annotate 'line', 4478
# }
 __label_20: # endif
.annotate 'line', 4481
    self.'annotate'(__ARG_1)
.annotate 'line', 4482
    set $S7, __ARG_2
    ne $S7, '', __label_27
.annotate 'line', 4483
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
 __label_27: # endif
.annotate 'line', 4484
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4485

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4351
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'OpDivExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4494
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4495

.end # OpDivExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4498
    self.'optimizearg'()
.annotate 'line', 4499
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4500
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4501
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4502
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4503
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4504
# var lval: $P3
    null $P3
.annotate 'line', 4505
# var rval: $P4
    null $P4
.annotate 'line', 4506
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4507
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4508
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4509
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4510
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4511
    eq $I2, 0, __label_6
.annotate 'line', 4512
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall 'integerValue'($P5, $P6, $N3)
 __label_6: # endif
# }
 __label_4: # endif
# {
.annotate 'line', 4515
    $P5 = 'floatresult'($S1, $S2)
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 4516
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4517
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4518
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4519
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4520
    set $N3, 0
    eq $N2, $N3, __label_8
.annotate 'line', 4521
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N4, $N1, $N2
    .tailcall 'floatValue'($P5, $P6, $N4)
 __label_8: # endif
# }
 __label_7: # endif
# }
# }
 __label_0: # endif
.annotate 'line', 4525
    .return(self)
# }
.annotate 'line', 4526

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4529
    .return('N')
# }
.annotate 'line', 4530

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4533
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4534
# var aux: $P2
    null $P2
.annotate 'line', 4535
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4536
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_0
# {
.annotate 'line', 4537
    $P2 = self.'tempreg'('N')
.annotate 'line', 4538
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4539
    set $P3, $P2
# }
 __label_0: # endif
.annotate 'line', 4541
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4542
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4543
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4544
    $P2 = self.'tempreg'('N')
.annotate 'line', 4545
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4546
    set $P5, $P2
# }
 __label_1: # endif
.annotate 'line', 4548
    self.'annotate'(__ARG_1)
.annotate 'line', 4549
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4550

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4490
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'OpModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4559
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4560

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4563
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4564
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4565
    self.'annotate'(__ARG_1)
.annotate 'line', 4566
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4567

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4570
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4571

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4555
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'OpCModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4580
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4581

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4584
    .return('I')
# }
.annotate 'line', 4585

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4588
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4589
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4590
    self.'annotate'(__ARG_1)
.annotate 'line', 4595
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4596

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4576
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'OpShiftleftExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4605
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4606

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4609
# res: $S1
    if_null __ARG_2, __label_1
    set $P1, __ARG_2
    goto __label_0
 __label_1:
    $P1 = self.'tempreg'('I')
 __label_0:
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 4610
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4611
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4612
    self.'annotate'(__ARG_1)
.annotate 'line', 4613
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4614

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4617
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4618

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4601
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'OpShiftrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4627
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4628

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4631
# res: $S1
    if_null __ARG_2, __label_1
    set $P1, __ARG_2
    goto __label_0
 __label_1:
    $P1 = self.'tempreg'('I')
 __label_0:
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 4632
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4633
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4634
    self.'annotate'(__ARG_1)
.annotate 'line', 4635
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4636

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4639
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4640

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4623
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4651
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4652
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4653

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4656
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4657
    .return(self)
# }
.annotate 'line', 4658

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4661
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4662

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4647
    addattribute $P0, 'arg'
.annotate 'line', 4648
    addattribute $P0, 'modifiers'
.end
.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4674
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4675
    setattribute self, 'start', __ARG_2
.annotate 'line', 4676
# var args: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 4677
# var t: $P2
    $P2 = __ARG_3.'get'()
.annotate 'line', 4678
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 4679
    __ARG_3.'unget'($P2)
 __label_1: # do
.annotate 'line', 4680
# {
.annotate 'line', 4681
# var modifier: $P3
    null $P3
.annotate 'line', 4682
# var expr: $P4
    $P4 = 'parseExpr'(__ARG_3, __ARG_1)
.annotate 'line', 4683
    $P2 = __ARG_3.'get'()
.annotate 'line', 4684
    $P5 = $P2.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4685
    $P2 = __ARG_3.'get'()
.annotate 'line', 4686
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 4687
    new $P6, [ 'ModifierList' ]
    $P6.'ModifierList'(__ARG_3, __ARG_1)
    set $P3, $P6
.annotate 'line', 4688
    $P2 = __ARG_3.'get'()
# }
    goto __label_6
 __label_5: # else
.annotate 'line', 4691
    'Expected'('modifier list', $P2)
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 4693
    new $P6, [ 'Argument' ]
    $P6.'Argument'($P4, $P3)
    set $P5, $P6
# predefined push
    push $P1, $P5
# }
 __label_3: # continue
.annotate 'line', 4694
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 4695
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_7
.annotate 'line', 4696
    'SyntaxError'("Unfinished argument list", $P2)
 __label_7: # endif
.annotate 'line', 4697
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_8
.annotate 'line', 4698
    setattribute self, 'args', $P1
 __label_8: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 4700

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4703
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4704
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
    .return($I1)
# }
.annotate 'line', 4705

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4708
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4709

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4712
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4713
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4714

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4717
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4718
    $P2 = $P1[__ARG_1]
    getattribute $P3, $P2, 'arg'
    .return($P3)
# }
.annotate 'line', 4719

.end # getfreearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4722
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 4723
    .return(self)
# }
.annotate 'line', 4724

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4727
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4728
    unless_null $P1, __label_0
# {
.annotate 'line', 4729
    new $P2, ['ResizableStringArray']
.annotate 'line', 4730
# pnull: $S1
    set $S1, ''
.annotate 'line', 4731
    set $P1, $P2
.annotate 'line', 4732
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4733
# nargs: $I1
# predefined elements
    elements $I1, $P3
# for loop
.annotate 'line', 4734
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4735
# var a: $P4
    $P5 = $P3[$I2]
    getattribute $P4, $P5, 'arg'
.annotate 'line', 4736
# reg: $S2
    null $S2
.annotate 'line', 4737
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4739
    ne $S1, '', __label_6
# {
.annotate 'line', 4740
    getattribute $P7, self, 'owner'
    $P6 = $P7.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4741
    __ARG_1.'emitnull'($S1)
# }
 __label_6: # endif
.annotate 'line', 4743
    set $S2, $S1
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4746
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
 __label_5: # endif
.annotate 'line', 4747
# predefined push
    push $P1, $S2
# }
 __label_1: # for iteration
.annotate 'line', 4734
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4749
    setattribute self, 'argregs', $P1
# }
 __label_0: # endif
.annotate 'line', 4751
    .return($P1)
# }
.annotate 'line', 4752

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4755
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4756
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4758
# sep: $S1
    set $S1, ''
.annotate 'line', 4759
# n: $I1
    $P6 = self.'numargs'()
    set $I1, $P6
# for loop
.annotate 'line', 4760
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 4761
# a: $S2
    $S2 = $P2[$I2]
.annotate 'line', 4762
    __ARG_1.'print'($S1, $S2)
.annotate 'line', 4763
# var modifiers: $P3
    $P6 = $P1[$I2]
    getattribute $P3, $P6, 'modifiers'
.annotate 'line', 4764
    if_null $P3, __label_3
# {
.annotate 'line', 4765
# isflat: $I3
    null $I3
# isnamed: $I4
    null $I4
.annotate 'line', 4766
# setname: $S3
    set $S3, ''
.annotate 'line', 4767
    $P6 = $P3.'getlist'()
    iter $P7, $P6
    set $P7, 0
 __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4768
# name: $S4
    $P8 = $P4.'getname'()
    null $S4
    if_null $P8, __label_6
    set $S4, $P8
 __label_6:
.annotate 'line', 4769
    ne $S4, 'flat', __label_7
.annotate 'line', 4770
    set $I3, 1
 __label_7: # endif
.annotate 'line', 4771
    ne $S4, 'named', __label_8
# {
.annotate 'line', 4772
    set $I4, 1
.annotate 'line', 4773
    $P6 = $P4.'numargs'()
    set $I5, $P6
    null $I6
    if $I5 == $I6 goto __label_11
    set $I6, 1
    if $I5 == $I6 goto __label_12
    goto __label_10
# switch
 __label_11: # case
    goto __label_9 # break
 __label_12: # case
.annotate 'line', 4777
# var argmod: $P5
    $P5 = $P4.'getarg'(0)
.annotate 'line', 4778
    $P8 = $P5.'isstringliteral'()
    isfalse $I7, $P8
    unless $I7 goto __label_13
.annotate 'line', 4779
    getattribute $P9, self, 'start'
    'SyntaxError'('Invalid modifier', $P9)
 __label_13: # endif
.annotate 'line', 4780
    $P10 = $P5.'getPirString'()
    set $S3, $P10
    goto __label_9 # break
 __label_10: # default
.annotate 'line', 4783
    getattribute $P11, self, 'start'
    'SyntaxError'('Invalid modifier', $P11)
 __label_9: # switch end
# }
 __label_8: # endif
# }
    goto __label_4
 __label_5: # endfor
.annotate 'line', 4787
    unless $I3 goto __label_14
# {
.annotate 'line', 4788
    unless $I4 goto __label_16
.annotate 'line', 4789
    __ARG_1.'print'(' :flat :named')
    goto __label_17
 __label_16: # else
.annotate 'line', 4791
    __ARG_1.'print'(' :flat')
 __label_17: # endif
# }
    goto __label_15
 __label_14: # else
.annotate 'line', 4793
    unless $I4 goto __label_18
# {
.annotate 'line', 4794
    __ARG_1.'print'(' :named')
.annotate 'line', 4795
    eq $S3, '', __label_19
.annotate 'line', 4796
    __ARG_1.'print'("(", $S3, ")")
 __label_19: # endif
# }
 __label_18: # endif
 __label_15: # endif
# }
 __label_3: # endif
.annotate 'line', 4799
    set $S1, ', '
# }
 __label_0: # for iteration
.annotate 'line', 4760
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4801

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4667
    addattribute $P0, 'owner'
.annotate 'line', 4668
    addattribute $P0, 'start'
.annotate 'line', 4669
    addattribute $P0, 'args'
.annotate 'line', 4670
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4806
    iter $P2, __ARG_1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 4807
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 4808
    .return(0)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
.annotate 'line', 4809
    .return(1)
# }
.annotate 'line', 4810

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4821
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4822
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4823
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4824

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4827
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4828

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4831
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4832
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4833
    new $P3, ['ResizableStringArray']
.annotate 'line', 4834
# var arg: $P4
    null $P4
.annotate 'line', 4835
# np: $I1
    $P6 = $P1.'params'()
    set $I1, $P6
.annotate 'line', 4836
# pnull: $S1
    set $S1, ''
.annotate 'line', 4837
    set $I4, $I1
    set $I5, -1
    if $I4 == $I5 goto __label_2
    set $I5, -2
    if $I4 == $I5 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 4839
    iter $P7, $P2
    set $P7, 0
 __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4840
# reg: $S2
    getattribute $P8, $P4, 'arg'
    $P6 = $P8.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 4842
    ne $S2, 'null', __label_7
# {
.annotate 'line', 4843
    ne $S1, '', __label_8
# {
.annotate 'line', 4844
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4845
    __ARG_1.'emitnull'($S1)
# }
 __label_8: # endif
.annotate 'line', 4847
    set $S2, $S1
# }
 __label_7: # endif
.annotate 'line', 4849
# predefined push
    push $P3, $S2
# }
    goto __label_4
 __label_5: # endfor
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 4853
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4854
    iter $P9, $P2
    set $P9, 0
 __label_9: # for iteration
    unless $P9 goto __label_10
    shift $P4, $P9
.annotate 'line', 4855
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_9
 __label_10: # endfor
.annotate 'line', 4856
    getattribute $P10, self, 'predef'
    getattribute $P11, self, 'start'
    $P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4857
    .return()
 __label_1: # default
.annotate 'line', 4859
# n: $I2
    getattribute $P12, self, 'args'
    set $I2, $P12
# for loop
.annotate 'line', 4860
# i: $I3
    null $I3
 __label_13: # for condition
    ge $I3, $I2, __label_12
# {
.annotate 'line', 4861
    $P13 = $P2[$I3]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4862
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_14
    set $S3, $P6
 __label_14:
.annotate 'line', 4863
# paramtype: $S4
    $P6 = $P1.'paramtype'($I3)
    null $S4
    if_null $P6, __label_15
    set $S4, $P6
 __label_15:
.annotate 'line', 4864
# argr: $S5
    null $S5
.annotate 'line', 4865
    $P6 = $P4.'isnull'()
    if_null $P6, __label_16
    unless $P6 goto __label_16
# {
.annotate 'line', 4866
    set $S7, $S4
    set $S8, 'I'
    if $S7 == $S8 goto __label_20
    set $S8, 'N'
    if $S7 == $S8 goto __label_21
    set $S8, 'S'
    if $S7 == $S8 goto __label_22
    goto __label_19
# switch
 __label_20: # case
 __label_21: # case
 __label_22: # case
.annotate 'line', 4870
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4871
    __ARG_1.'emitnull'($S5)
    goto __label_18 # break
 __label_19: # default
.annotate 'line', 4874
    ne $S1, '', __label_23
# {
.annotate 'line', 4875
    $P10 = self.'tempreg'('P')
    set $S1, $P10
.annotate 'line', 4876
    __ARG_1.'emitnull'($S1)
# }
 __label_23: # endif
.annotate 'line', 4878
    set $S5, $S1
 __label_18: # switch end
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4882
    iseq $I4, $S3, $S4
    if $I4 goto __label_26
    iseq $I4, $S4, '?'
 __label_26:
    unless $I4 goto __label_24
.annotate 'line', 4883
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_25
 __label_24: # else
# {
.annotate 'line', 4885
# aux: $S6
    null $S6
.annotate 'line', 4886
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
.annotate 'line', 4887
    set $S7, $S4
    set $S8, 'P'
    if $S7 == $S8 goto __label_29
    set $S8, 'I'
    if $S7 == $S8 goto __label_30
    set $S8, 'N'
    if $S7 == $S8 goto __label_31
    set $S8, 'S'
    if $S7 == $S8 goto __label_32
    goto __label_28
# switch
 __label_29: # case
.annotate 'line', 4889
    set $S9, $S3
    set $S10, 'I'
    if $S9 == $S10 goto __label_35
    set $S10, 'N'
    if $S9 == $S10 goto __label_36
    set $S10, 'S'
    if $S9 == $S10 goto __label_37
    goto __label_34
# switch
 __label_35: # case
 __label_36: # case
 __label_37: # case
.annotate 'line', 4893
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4894
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_33 # break
 __label_34: # default
.annotate 'line', 4897
    $P4.'emit'(__ARG_1, $S5)
 __label_33: # switch end
    goto __label_27 # break
 __label_30: # case
 __label_31: # case
 __label_32: # case
.annotate 'line', 4903
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4904
    __ARG_1.'emitset'($S5, $S6)
    goto __label_27 # break
 __label_28: # default
.annotate 'line', 4907
    $P4.'emit'(__ARG_1, $S5)
 __label_27: # switch end
# }
 __label_25: # endif
# }
 __label_17: # endif
.annotate 'line', 4911
# predefined push
    push $P3, $S5
# }
 __label_11: # for iteration
.annotate 'line', 4860
    inc $I3
    goto __label_13
 __label_12: # for end
 __label_0: # switch end
.annotate 'line', 4914
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4915

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4814
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4816
    addattribute $P0, 'predef'
.annotate 'line', 4817
    addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4927
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 4928
    setattribute self, 'funref', __ARG_4
.annotate 'line', 4929
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 4930
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 4931
    __ARG_1.'unget'($P1)
.annotate 'line', 4932
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 4934

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4935
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4938
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 4939
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4940
# nargs: $I1
    null $I1
.annotate 'line', 4941
    if_null $P2, __label_0
# {
.annotate 'line', 4942
    $P2 = $P2.'optimize'()
.annotate 'line', 4943
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
 __label_0: # endif
.annotate 'line', 4946
    isa $I2, $P1, [ 'MemberExpr' ]
    unless $I2 goto __label_1
.annotate 'line', 4947
    new $P7, [ 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_1: # endif
.annotate 'line', 4948
    isa $I2, $P1, [ 'MemberRefExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 4949
    new $P7, [ 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_2: # endif
.annotate 'line', 4952
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
# {
.annotate 'line', 4953
# call: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 4954
# var predef: $P3
    $P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4955
    if_null $P3, __label_5
# {
.annotate 'line', 4956
    self.'use_predef'($S1)
.annotate 'line', 4957
# var rawargs: $P4
    ne $I1, 0, __label_7
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P4, $P6
    goto __label_6
 __label_7:
    $P4 = $P2.'getrawargs'()
 __label_6:
.annotate 'line', 4960
    isa $I2, $P3, [ 'PredefFunctionEval' ]
    unless $I2 goto __label_8
# {
.annotate 'line', 4961
    $P6 = 'arglist_hascompilevalue'($P4)
    if_null $P6, __label_9
    unless $P6 goto __label_9
# {
.annotate 'line', 4962
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4963
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall $P5($P6, $P7, $P4)
# }
 __label_9: # endif
# }
 __label_8: # endif
.annotate 'line', 4967
    new $P7, [ 'CallPredefExpr' ]
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'start'
    $P7.'CallPredefExpr'($P8, $P9, $P3, $P4)
    set $P6, $P7
    .return($P6)
# }
 __label_5: # endif
# }
 __label_3: # endif
.annotate 'line', 4971
    setattribute self, 'funref', $P1
.annotate 'line', 4972
    setattribute self, 'args', $P2
.annotate 'line', 4973
    .return(self)
# }
.annotate 'line', 4974

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 4977
    .return(1)
# }
.annotate 'line', 4978

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4981
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4982
# call: $S1
    null $S1
.annotate 'line', 4983
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 4984
    $P3 = $P1.'checkIdentifier'()
    set $S1, $P3
.annotate 'line', 4985
    ne $S1, '', __label_2
.annotate 'line', 4986
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "'"
    push $P2, $P3
    $P4 = $P1.'getName'()
    push $P2, $P4
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
 __label_2: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 4989
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 4990
    .return($S1)
# }
.annotate 'line', 4991

.end # emitcall


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4994
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4995
# call: $S1
    $P3 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4996
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4997
    if_null $P2, __label_1
.annotate 'line', 4998
    $P2.'getargvalues'(__ARG_1)
 __label_1: # endif
.annotate 'line', 5000
    self.'annotate'(__ARG_1)
.annotate 'line', 5002
    __ARG_1.'print'('    ')
.annotate 'line', 5003
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5004
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5005
    __ARG_1.'print'('.tailcall ')
    goto __label_5
 __label_4: # else
.annotate 'line', 5007
    __ARG_1.'print'(__ARG_2, ' = ')
 __label_5: # endif
# }
 __label_2: # endif
.annotate 'line', 5010
    __ARG_1.'print'($S1)
.annotate 'line', 5011
    __ARG_1.'print'('(')
.annotate 'line', 5012
    if_null $P2, __label_6
.annotate 'line', 5013
    $P2.'emitargs'(__ARG_1)
 __label_6: # endif
.annotate 'line', 5014
    __ARG_1.'say'(')')
# }
.annotate 'line', 5015

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4920
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4922
    addattribute $P0, 'funref'
.annotate 'line', 4923
    addattribute $P0, 'args'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5027
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5028
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5029
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5030

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5033
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5034
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 5035
    $P5 = $P1.'get_member'()
.annotate 'line', 5034
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
    .return($S1)
# }
.annotate 'line', 5036

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 5023
    get_class $P1, [ 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5046
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5047
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5048
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5049

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5052
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5053
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5054
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5055
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_1
    set $S4, $P3
    isne $I1, $S4, 'S'
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5056
    getattribute $P4, $P1, 'start'
    'SyntaxError'("Invalid expression type in '.*'", $P4)
 __label_0: # endif
.annotate 'line', 5059
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
 __label_2:
.annotate 'line', 5060
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
 __label_3:
.annotate 'line', 5061
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5062

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 5042
    get_class $P1, [ 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5072
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5073
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5074

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5077
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5078
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 5079
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 5080
    eq $S1, 'P', __label_2
# {
.annotate 'line', 5081
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5082
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5083
    __ARG_1.'emitbox'($S2, $S3)
# }
 __label_2: # endif
.annotate 'line', 5085
    .return($S2)
# }
.annotate 'line', 5086

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 5067
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5069
    addattribute $P0, 'left'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5095
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5096
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5097

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5098
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5101
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5102
    .return(self)
# }
.annotate 'line', 5103

.end # optimize


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5106
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5107

.end # get_member


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5110
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5111
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5112
# result: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 5113
    self.'annotate'(__ARG_1)
.annotate 'line', 5114
    __ARG_1.'say'('    ', 'getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 5115
    .return($S3)
# }
.annotate 'line', 5116

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5119
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5120
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5121
    self.'annotate'(__ARG_1)
.annotate 'line', 5122
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5123

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5126
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5127

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5130
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5131
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5132
# value: $S3
    null $S3
.annotate 'line', 5133
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5135
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5136
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5137
    __ARG_1.'emitnull'(__ARG_3)
# }
 __label_4: # endif
.annotate 'line', 5139
    set $S3, __ARG_3
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 5142
    $P1 = self.'tempreg'('P')
    set $S3, $P1
.annotate 'line', 5143
    __ARG_1.'emitbox'($S3, __ARG_3)
# }
 __label_3: # endif
.annotate 'line', 5145
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 5146

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5149
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5150
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5151
# value: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 5152
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5153
    __ARG_1.'emitnull'($S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 5155
# rreg: $S4
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_5
    set $S4, $P2
 __label_5:
.annotate 'line', 5156
    $P1 = __ARG_2.'checkresult'()
    set $S5, $P1
    eq $S5, 'P', __label_6
.annotate 'line', 5157
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_7
 __label_6: # else
.annotate 'line', 5159
    set $S3, $S4
 __label_7: # endif
# }
 __label_4: # endif
.annotate 'line', 5161
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 5162
    .return($S3)
# }
.annotate 'line', 5163

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 5089
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5091
    addattribute $P0, 'right'
.end
.namespace [ 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5173
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5174
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5175

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5176
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5179
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5180
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5181
    .return(self)
# }
.annotate 'line', 5182

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5186
    getattribute $P1, self, 'start'
.annotate 'line', 5185
    'SyntaxError'('Member reference can be used only for method calls', $P1)
# }
.annotate 'line', 5187

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 5168
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5170
    addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5200
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5201
    setattribute self, 'left', __ARG_4
.annotate 'line', 5202
    self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 5203

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5206
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_0
.annotate 'line', 5207
    .return('S')
    goto __label_1
 __label_0: # else
.annotate 'line', 5209
    .return('P')
 __label_1: # endif
# }
.annotate 'line', 5210

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5213
# var left: $P1
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 5214
    setattribute self, 'left', $P1
.annotate 'line', 5215
    self.'optimizeargs'()
.annotate 'line', 5219
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_1
    $P4 = self.'numargs'()
    set $I3, $P4
    iseq $I2, $I3, 1
 __label_1:
    unless $I2 goto __label_0
# {
.annotate 'line', 5220
# var arg: $P2
    $P2 = self.'getarg'(0)
.annotate 'line', 5221
    $P4 = $P2.'isintegerliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 5222
# ival: $I1
    $P5 = $P2.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5223
# sval: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 5224
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, self, 'start'
    getattribute $P5, $P4, 'file'
    getattribute $P6, self, 'start'
    getattribute $P7, $P6, 'line'
.annotate 'line', 5225
# predefined substr
    substr $S2, $S1, $I1, 1
    $P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5226
    new $P5, [ 'StringLiteral' ]
    getattribute $P6, self, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5229
    .return(self)
# }
.annotate 'line', 5230

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5233
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5234
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5235
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_1
    isnull $I1, $P2
    not $I1
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5236
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_args', $P3)
 __label_0: # endif
.annotate 'line', 5237
    getattribute $P4, self, 'left'
    $P3 = $P4.'isidentifier'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 5238
    getattribute $P5, self, 'left'
    $P1 = $P5.'getIdentifier'()
    goto __label_3
 __label_2: # else
.annotate 'line', 5240
    getattribute $P6, self, 'left'
    $P1 = $P6.'emit_get'(__ARG_1)
 __label_3: # endif
.annotate 'line', 5241
    setattribute self, 'regleft', $P1
.annotate 'line', 5242
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5243
    setattribute self, 'argregs', $P2
# }
.annotate 'line', 5244

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5247
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5248
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5249
    isnull $I1, $P1
    if $I1 goto __label_1
    isnull $I1, $P2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5250
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
 __label_0: # endif
.annotate 'line', 5251
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5252
    getattribute $P3, self, 'argregs'
# predefined join
    join $S1, '; ', $P3
    __ARG_1.'print'($S1)
.annotate 'line', 5253
    __ARG_1.'print'(']')
# }
.annotate 'line', 5254

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5257
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5258
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 5259
    ne $S1, 'S', __label_1
# {
.annotate 'line', 5260
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5261
# nargs: $I1
    getattribute $P2, self, 'argregs'
# predefined elements
    elements $I1, $P2
.annotate 'line', 5262
    eq $I1, 1, __label_3
.annotate 'line', 5263
    getattribute $P2, self, 'start'
    'SyntaxError'('Bad string index', $P2)
 __label_3: # endif
.annotate 'line', 5264
    set $S2, __ARG_2
    ne $S2, '', __label_4
.annotate 'line', 5265
    __ARG_2 = self.'tempreg'('S')
 __label_4: # endif
.annotate 'line', 5266
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 5269
    self.'annotate'(__ARG_1)
.annotate 'line', 5270
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5271
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5272
    __ARG_1.'say'('')
# }
 __label_2: # endif
# }
.annotate 'line', 5274

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5277
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5278
    self.'annotate'(__ARG_1)
.annotate 'line', 5279
    __ARG_1.'print'('    ')
.annotate 'line', 5280
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5281
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5282

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5285
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5286
# rreg: $S1
    null $S1
.annotate 'line', 5287
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 5288
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5289
    __ARG_1.'emitnull'($S1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5292
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 5293
    self.'annotate'(__ARG_1)
.annotate 'line', 5294
    __ARG_1.'print'('    ')
.annotate 'line', 5295
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5296
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5297
    .return($S1)
# }
.annotate 'line', 5298

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 5192
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'SimpleArgList' ]
    addparent $P0, $P2
.annotate 'line', 5194
    addattribute $P0, 'left'
.annotate 'line', 5195
    addattribute $P0, 'regleft'
.annotate 'line', 5196
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5309
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5310
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'values', $P4
.annotate 'line', 5311
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5312
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 5313
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5314
# {
.annotate 'line', 5315
# var item: $P2
    $P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5316
    getattribute $P3, self, 'values'
# predefined push
    push $P3, $P2
# }
 __label_3: # continue
.annotate 'line', 5317
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
 __label_2: # enddo
.annotate 'line', 5318
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 5319
    'Expected'("']' or ','", $P1)
 __label_4: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 5321

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5322
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5325
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5326
    .return(self)
# }
.annotate 'line', 5327

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5330
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 5331
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 5332
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 5338
    self.'emit_init'(__ARG_1, '')
# }
 __label_1: # endif
# }
.annotate 'line', 5340

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5343
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5344
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5345
    .return($S1)
# }
.annotate 'line', 5346

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5349
    self.'annotate'(__ARG_1)
.annotate 'line', 5350
# itemreg: $S1
    null $S1
.annotate 'line', 5351
# it_p: $S2
    null $S2
.annotate 'line', 5352
    eq __ARG_2, '', __label_0
# {
.annotate 'line', 5353
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5354
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
 __label_0: # endif
.annotate 'line', 5356
    getattribute $P2, self, 'values'
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 5357
# type: $S3
    $P4 = $P1.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
 __label_3:
.annotate 'line', 5358
    set $S5, $S3
    set $S6, 'I'
    if $S5 == $S6 goto __label_6
    set $S6, 'N'
    if $S5 == $S6 goto __label_7
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    goto __label_5
# switch
 __label_6: # case
 __label_7: # case
 __label_8: # case
.annotate 'line', 5360
# aux: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 5361
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5362
    __ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 5363
    set $S1, $S2
# }
 __label_10: # endif
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 5367
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5368
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5369
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5370
    __ARG_1.'emitnull'($S1)
# }
 __label_13: # endif
# }
    goto __label_12
 __label_11: # else
.annotate 'line', 5374
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_12: # endif
 __label_4: # switch end
.annotate 'line', 5376
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5377
    self.'annotate'(__ARG_1)
.annotate 'line', 5378
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
 __label_14: # endif
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 5381

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5303
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5305
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5393
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5394
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5395
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5396
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5397
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_0
# {
.annotate 'line', 5398
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5399
# {
.annotate 'line', 5400
# var key: $P4
    $P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5401
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 5402
# var value: $P5
    $P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5403
# predefined push
    push $P2, $P4
.annotate 'line', 5404
# predefined push
    push $P3, $P5
# }
 __label_3: # continue
.annotate 'line', 5406
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
 __label_2: # enddo
.annotate 'line', 5407
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_4
.annotate 'line', 5408
    'Expected'("',' or '}'", $P1)
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 5410
    setattribute self, 'keys', $P2
.annotate 'line', 5411
    setattribute self, 'values', $P3
# }
.annotate 'line', 5412

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5413
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5416
    getattribute $P1, self, 'keys'
    'optimize_array'($P1)
.annotate 'line', 5417
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5418
    .return(self)
# }
.annotate 'line', 5419

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5422
    self.'annotate'(__ARG_1)
.annotate 'line', 5427
    set $S6, __ARG_2
    eq $S6, '', __label_0
.annotate 'line', 5428
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
 __label_0: # endif
.annotate 'line', 5430
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5431
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5432
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5433
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5434
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5435
# item: $S1
    null $S1
.annotate 'line', 5436
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5437
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 5438
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5439
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5442
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
 __label_5: # endif
.annotate 'line', 5444
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5445
# itemreg: $S3
    null $S3
.annotate 'line', 5446
    $P5 = $P4.'isnull'()
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 5447
    set $S6, __ARG_2
    eq $S6, '', __label_9
# {
.annotate 'line', 5448
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5449
    __ARG_1.'emitnull'($S3)
# }
 __label_9: # endif
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 5452
    $P5 = $P4.'isidentifier'()
    if_null $P5, __label_10
    unless $P5 goto __label_10
# {
.annotate 'line', 5453
# s: $S4
    $P6 = $P4.'checkIdentifier'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 5454
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_15
    isne $I3, $S4, ''
 __label_15:
    unless $I3 goto __label_13
.annotate 'line', 5455
    set $S3, $S4
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 5457
# id: $S5
    $P5 = $P4.'getName'()
    null $S5
    if_null $P5, __label_16
    set $S5, $P5
 __label_16:
.annotate 'line', 5458
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_17
# {
.annotate 'line', 5459
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5460
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_18
 __label_17: # else
.annotate 'line', 5463
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_18: # endif
# }
 __label_14: # endif
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 5467
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_11: # endif
 __label_8: # endif
.annotate 'line', 5468
    set $S6, __ARG_2
    eq $S6, '', __label_19
.annotate 'line', 5469
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
 __label_19: # endif
# }
 __label_1: # for iteration
.annotate 'line', 5433
    inc $I2
    goto __label_3
 __label_2: # for end
# }
.annotate 'line', 5471

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5474
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5475
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5476
    .return($S1)
# }
.annotate 'line', 5477

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5386
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5388
    addattribute $P0, 'keys'
.annotate 'line', 5389
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5490
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5495
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 5496
# var initializer: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5497
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 5498
    $P5 = $P3.'isop'(')')
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 5499
    __ARG_1.'unget'($P3)
 __label_1: # do
.annotate 'line', 5500
# {
.annotate 'line', 5501
# var auxinit: $P4
    $P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 5502
# predefined push
    push $P2, $P4
# }
 __label_3: # continue
.annotate 'line', 5503
    $P3 = __ARG_1.'get'()
    $P5 = $P3.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 5504
    'RequireOp'(')', $P3)
# }
 __label_0: # endif
.annotate 'line', 5506
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5507

.end # parseinitializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5510
    getattribute $P1, self, 'initializer'
    'optimize_array'($P1)
.annotate 'line', 5511
    .return(self)
# }
.annotate 'line', 5512

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5515
    new $P1, ['ResizableStringArray']
.annotate 'line', 5516
    getattribute $P3, self, 'initializer'
    iter $P4, $P3
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P2, $P4
# {
.annotate 'line', 5517
# reg: $S1
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 5518
# predefined push
    push $P1, $S1
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 5520
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5521
# predefined join
    join $S2, ", ", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 5522
    __ARG_1.'say'(")")
# }
.annotate 'line', 5523

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5482
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5484
    addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5534
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5536
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_1
    $I2 = __ARG_4.'isidentifier'()
 __label_1:
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 5537
    'SyntaxError'("Unimplemented", __ARG_4)
 __label_0: # endif
.annotate 'line', 5538
    setattribute self, 'value', __ARG_4
.annotate 'line', 5539
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5541
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 5542
    self.'parseinitializer'(__ARG_1)
    goto __label_3
 __label_2: # else
.annotate 'line', 5544
    __ARG_1.'unget'($P1)
 __label_3: # endif
# }
.annotate 'line', 5545

.end # NewExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5548
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5549
    isa $I1, $P1, [ 'Token' ]
    unless $I1 goto __label_1
    $I1 = $P1.'isidentifier'()
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 5552
# var name: $P2
    $P2 = $P1.'getidentifier'()
.annotate 'line', 5553
# var desc: $P3
    getattribute $P4, self, 'owner'
    $P3 = $P4.'getvar'($P2)
.annotate 'line', 5554
    isnull $I1, $P3
    not $I1
    unless $I1 goto __label_3
    $I1 = $P3.'isconst'()
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5555
    $P4 = $P3.'getid'()
    unless_null $P4, __label_4
# {
.annotate 'line', 5556
    $P1 = $P3.'getvalue'()
.annotate 'line', 5557
    isa $I2, $P1, [ 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_6
.annotate 'line', 5558
    'SyntaxError'('Constant value must evaluate to a string', $P1)
 __label_6: # endif
.annotate 'line', 5559
    getattribute $P5, $P1, 'strval'
    setattribute self, 'value', $P5
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5562
    'SyntaxError'('*Constant value must evaluate to a string', $P1)
 __label_5: # endif
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5566
    getattribute $P4, self, 'initializer'
    'optimize_array'($P4)
.annotate 'line', 5567
    .return(self)
# }
.annotate 'line', 5568

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 5571
    self.'annotate'(__ARG_1)
.annotate 'line', 5573
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5574
# numinits: $I1
    unless_null $P1, __label_1
    set $I1, -1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5577
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
    null $I2
    goto __label_2
 __label_3:
.annotate 'line', 5578
    getattribute $P9, self, 'value'
    $P8 = $P9.'isidentifier'()
    if_null $P8, __label_5
    unless $P8 goto __label_5
    set $I2, 1
    goto __label_4
 __label_5:
    set $I2, -1
 __label_4:
 __label_2:
.annotate 'line', 5580
# reginit: $S1
    set $S1, ''
.annotate 'line', 5581
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 5582
# constructor: $S3
    null $S3
.annotate 'line', 5583
    set $I3, $I1
    set $I4, -1
    if $I3 == $I4 goto __label_9
    null $I4
    if $I3 == $I4 goto __label_10
    set $I4, 1
    if $I3 == $I4 goto __label_11
    goto __label_8
# switch
 __label_9: # case
 __label_10: # case
    goto __label_7 # break
 __label_11: # case
.annotate 'line', 5588
    ne $I2, 1, __label_12
# {
.annotate 'line', 5589
    not $I5, __ARG_3
    unless $I5 goto __label_14
.annotate 'line', 5590
    $P6 = self.'tempreg'('P')
    set $S2, $P6
 __label_14: # endif
# }
    goto __label_13
 __label_12: # else
# {
.annotate 'line', 5593
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5594
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5595
    concat $S0, ', ', $S1
    set $S1, $S0
# }
 __label_13: # endif
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 5599
    eq $I2, 1, __label_15
.annotate 'line', 5600
    getattribute $P6, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P6)
 __label_15: # endif
.annotate 'line', 5601
    not $I3, __ARG_3
    unless $I3 goto __label_16
.annotate 'line', 5602
    $P7 = self.'tempreg'('P')
    set $S2, $P7
 __label_16: # endif
 __label_7: # switch end
.annotate 'line', 5605
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_19
    set $I4, 1
    if $I3 == $I4 goto __label_20
    goto __label_18
# switch
 __label_19: # case
.annotate 'line', 5608
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_21
    set $S4, $P6
 __label_21:
.annotate 'line', 5609
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5610
    isnull $I5, $P3
    unless $I5 goto __label_23
    $I5 = self.'dowarnings'()
 __label_23:
    unless $I5 goto __label_22
.annotate 'line', 5611
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    'Warn'($S5, $P8)
 __label_22: # endif
.annotate 'line', 5615
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5616
    le $I1, 1, __label_24
# {
.annotate 'line', 5617
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
 __label_24: # endif
    goto __label_17 # break
 __label_20: # case
.annotate 'line', 5621
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5622
    unless_null $P4, __label_25
# {
.annotate 'line', 5624
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5625
    if_null $P5, __label_27
# {
.annotate 'line', 5626
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_28
 __label_27: # else
# {
.annotate 'line', 5629
    $P6 = self.'dowarnings'()
    if_null $P6, __label_29
    unless $P6 goto __label_29
.annotate 'line', 5630
    'Warn'('Checking: new unknown type')
 __label_29: # endif
.annotate 'line', 5631
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
 __label_28: # endif
.annotate 'line', 5633
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_26
 __label_25: # else
# {
.annotate 'line', 5637
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
 __label_26: # endif
    goto __label_17 # break
 __label_18: # default
.annotate 'line', 5641
    'InternalError'('Unexpected type in new')
 __label_17: # switch end
.annotate 'line', 5643
    isgt $I3, $I1, 1
    if $I3 goto __label_31
    isge $I3, $I1, 0
    unless $I3 goto __label_32
    iseq $I3, $I2, 1
 __label_32:
 __label_31:
    unless $I3 goto __label_30
# {
.annotate 'line', 5644
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5645
    not $I3, __ARG_3
    unless $I3 goto __label_33
.annotate 'line', 5646
    __ARG_1.'emitset'(__ARG_2, $S2)
 __label_33: # endif
# }
 __label_30: # endif
# }
.annotate 'line', 5648

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5651
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5652

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5528
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5530
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5663
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5664
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5665
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5666
    setattribute self, 'nskey', $P1
.annotate 'line', 5667
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5668
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5669
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5671
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5672

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5675
# reginit: $S1
    null $S1
.annotate 'line', 5676
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5677
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5678
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_4
    set $I3, 1
    if $I2 == $I3 goto __label_5
    goto __label_3
# switch
 __label_4: # case
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 5682
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5683
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5686
    getattribute $P5, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P5)
 __label_2: # switch end
.annotate 'line', 5688
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5689
    __ARG_1.'print'('    ')
.annotate 'line', 5690
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 5691
    __ARG_1.'print'("root_")
 __label_6: # endif
.annotate 'line', 5692
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5693
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5694
    if_null $S1, __label_7
.annotate 'line', 5695
    __ARG_1.'print'(', ', $S1)
 __label_7: # endif
.annotate 'line', 5696
    __ARG_1.'say'()
# }
.annotate 'line', 5697

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5657
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5659
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5708
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5709
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5710
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5711
    setattribute self, 'nskey', $P1
.annotate 'line', 5712
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5713
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5714
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5716
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5717

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5720
# reginit: $S1
    null $S1
.annotate 'line', 5721
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5723
# numinits: $I1
    unless_null $P1, __label_1
    set $I1, -1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5724
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
 __label_2:
.annotate 'line', 5725
    le $I1, 0, __label_3
.annotate 'line', 5726
    $P3 = self.'tempreg'('P')
    set $S2, $P3
 __label_3: # endif
.annotate 'line', 5727
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5728
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5729
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5730
    __ARG_1.'say'()
.annotate 'line', 5732
    lt $I1, 0, __label_4
# {
.annotate 'line', 5733
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_5
    set $S3, $P3
 __label_5:
.annotate 'line', 5734
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5735
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
 __label_4: # endif
# }
.annotate 'line', 5737

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5702
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5704
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5744
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5746
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 5748
    new $P5, [ 'CallExpr' ]
.annotate 'line', 5749
    new $P7, [ 'StringLiteral' ]
    $P7.'StringLiteral'(__ARG_2, __ARG_3)
    set $P6, $P7
    $P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
    set $P4, $P5
.annotate 'line', 5748
    .return($P4)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5751
    $P3 = $P1.'isop'('[')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 5753
    new $P5, [ 'NewIndexedExpr' ]
    $P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
    goto __label_3
 __label_2: # else
.annotate 'line', 5755
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 5758
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5759
    __ARG_1.'unget'($P2)
.annotate 'line', 5760
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 5762
    new $P5, [ 'NewQualifiedExpr' ]
    $P5.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P4, $P5
    .return($P4)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 5766
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
 __label_7: # endif
# }
    goto __label_5
 __label_4: # else
# {
.annotate 'line', 5771
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
 __label_5: # endif
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 5773

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5784
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5785
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5786
    $P2 = 'parseClassSpecifier'(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5787

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5790
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5791
    .return(self)
# }
.annotate 'line', 5792

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5793
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5796
# var checked: $P1
    getattribute $P1, self, 'checked'
.annotate 'line', 5798
# r: $S1
    null $S1
.annotate 'line', 5799
    set $S3, __ARG_2
    ne $S3, '', __label_0
.annotate 'line', 5800
    $P2 = self.'tempreg'('I')
    set $S1, $P2
    goto __label_1
 __label_0: # else
.annotate 'line', 5802
    set $S1, __ARG_2
 __label_1: # endif
.annotate 'line', 5803
# check: $S2
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 5804
    self.'annotate'(__ARG_1)
.annotate 'line', 5805
    __ARG_1.'print'('    isa ', $S1, ', ', $S2, ', ')
.annotate 'line', 5806
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 5807
    __ARG_1.'say'()
# }
.annotate 'line', 5808

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5777
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5779
    addattribute $P0, 'lexpr'
.annotate 'line', 5780
    addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 5825
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5826
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5827
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5828
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5829
    .return(self)
# }
.annotate 'line', 5830

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5833
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 5834
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5836
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
 __label_3: # case
.annotate 'line', 5838
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
 __label_1: # default
.annotate 'line', 5840
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5841
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5842
    .return(self)
 __label_0: # switch end
# }
.annotate 'line', 5844

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5847
    getattribute $P1, self, 'etrue'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 5848

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5851
# cond_end: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5852
# cond_false: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5853
    getattribute $P1, self, 'condition'
    $P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5854
    getattribute $P1, self, 'etrue'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5855
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5856
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5857
    getattribute $P1, self, 'efalse'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5858
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5859

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5813
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5819
    addattribute $P0, 'condition'
.annotate 'line', 5820
    addattribute $P0, 'etrue'
.annotate 'line', 5821
    addattribute $P0, 'efalse'
.end
.namespace [ ]
# Constant Code_none evaluated at compile time
# Constant Code_paren evaluated at compile time
# Constant Code_bracket evaluated at compile time
# Constant Code_dot evaluated at compile time
# Constant Code_assign evaluated at compile time
# Constant Code_assign_to evaluated at compile time
# Constant Code_add_assign evaluated at compile time
# Constant Code_add evaluated at compile time
# Constant Code_minus evaluated at compile time
# Constant Code_inc evaluated at compile time
# Constant Code_dec evaluated at compile time
# Constant Code_not evaluated at compile time
# Constant Code_equal evaluated at compile time
# Constant Code_not_equal evaluated at compile time
# Constant Code_less evaluated at compile time
# Constant Code_less_equal evaluated at compile time
# Constant Code_greater evaluated at compile time
# Constant Code_greater_equal evaluated at compile time
# Constant Code_sub_assign evaluated at compile time
# Constant Code_mul evaluated at compile time
# Constant Code_div evaluated at compile time
# Constant Code_mod evaluated at compile time
# Constant Code_cmod evaluated at compile time
# Constant Code_mul_assign evaluated at compile time
# Constant Code_div_assign evaluated at compile time
# Constant Code_same evaluated at compile time
# Constant Code_not_same evaluated at compile time
# Constant Code_instanceof evaluated at compile time
# Constant Code_shiftleft evaluated at compile time
# Constant Code_shiftright evaluated at compile time
# Constant Code_mod_assign evaluated at compile time
# Constant Code_delete evaluated at compile time
# Constant Code_exists evaluated at compile time

.sub 'getOpCode_2'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5903
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '('
    if $S1 == $S2 goto __label_2
    set $S2, '['
    if $S1 == $S2 goto __label_3
    set $S2, '.'
    if $S1 == $S2 goto __label_4
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5904
    .return(1)
 __label_3: # case
.annotate 'line', 5905
    .return(2)
 __label_4: # case
.annotate 'line', 5906
    .return(3)
 __label_1: # default
.annotate 'line', 5907
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5909

.end # getOpCode_2


.sub 'getOpCode_4'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5913
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '-'
    if $S1 == $S2 goto __label_2
    set $S2, '!'
    if $S1 == $S2 goto __label_3
    set $S2, '++'
    if $S1 == $S2 goto __label_4
    set $S2, '--'
    if $S1 == $S2 goto __label_5
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5914
    .return(8)
 __label_3: # case
.annotate 'line', 5915
    .return(11)
 __label_4: # case
.annotate 'line', 5916
    .return(9)
 __label_5: # case
.annotate 'line', 5917
    .return(10)
 __label_1: # default
.annotate 'line', 5919
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(31)
    goto __label_7
 __label_6: # else
.annotate 'line', 5920
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_8
    unless $P3 goto __label_8
    .return(32)
    goto __label_9
 __label_8: # else
.annotate 'line', 5921
    .return(0)
 __label_9: # endif
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5923

.end # getOpCode_4


.sub 'getOpCode_5'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5927
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '*'
    if $S1 == $S2 goto __label_2
    set $S2, '/'
    if $S1 == $S2 goto __label_3
    set $S2, '%'
    if $S1 == $S2 goto __label_4
    set $S2, '%%'
    if $S1 == $S2 goto __label_5
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5928
    .return(19)
 __label_3: # case
.annotate 'line', 5929
    .return(20)
 __label_4: # case
.annotate 'line', 5930
    .return(21)
 __label_5: # case
.annotate 'line', 5931
    .return(22)
 __label_1: # default
.annotate 'line', 5932
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5934

.end # getOpCode_5


.sub 'getOpCode_7'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5938
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_2
    set $S2, '>>'
    if $S1 == $S2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5939
    .return(28)
 __label_3: # case
.annotate 'line', 5940
    .return(29)
 __label_1: # default
.annotate 'line', 5941
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5943

.end # getOpCode_7


.sub 'getOpCode_8'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5947
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<'
    if $S1 == $S2 goto __label_2
    set $S2, '>'
    if $S1 == $S2 goto __label_3
    set $S2, '<='
    if $S1 == $S2 goto __label_4
    set $S2, '>='
    if $S1 == $S2 goto __label_5
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5948
    .return(14)
 __label_3: # case
.annotate 'line', 5949
    .return(16)
 __label_4: # case
.annotate 'line', 5950
    .return(15)
 __label_5: # case
.annotate 'line', 5951
    .return(17)
 __label_1: # default
.annotate 'line', 5953
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(27)
    goto __label_7
 __label_6: # else
.annotate 'line', 5954
    .return(0)
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5956

.end # getOpCode_8


.sub 'getOpCode_9'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5960
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '=='
    if $S1 == $S2 goto __label_2
    set $S2, '!='
    if $S1 == $S2 goto __label_3
    set $S2, '==='
    if $S1 == $S2 goto __label_4
    set $S2, '!=='
    if $S1 == $S2 goto __label_5
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5961
    .return(12)
 __label_3: # case
.annotate 'line', 5962
    .return(13)
 __label_4: # case
.annotate 'line', 5963
    .return(25)
 __label_5: # case
.annotate 'line', 5964
    .return(26)
 __label_1: # default
.annotate 'line', 5965
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5967

.end # getOpCode_9


.sub 'getOpCode_16'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5971
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '='
    if $S1 == $S2 goto __label_2
    set $S2, '=:'
    if $S1 == $S2 goto __label_3
    set $S2, '+='
    if $S1 == $S2 goto __label_4
    set $S2, '-='
    if $S1 == $S2 goto __label_5
    set $S2, '*='
    if $S1 == $S2 goto __label_6
    set $S2, '/='
    if $S1 == $S2 goto __label_7
    set $S2, '%='
    if $S1 == $S2 goto __label_8
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5972
    .return(4)
 __label_3: # case
.annotate 'line', 5973
    .return(5)
 __label_4: # case
.annotate 'line', 5974
    .return(6)
 __label_5: # case
.annotate 'line', 5975
    .return(18)
 __label_6: # case
.annotate 'line', 5976
    .return(23)
 __label_7: # case
.annotate 'line', 5977
    .return(24)
 __label_8: # case
.annotate 'line', 5978
    .return(30)
 __label_1: # default
.annotate 'line', 5979
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5981

.end # getOpCode_16


.sub 'parseExpr_0'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5985
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5987
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5988
# var expr: $P2
    null $P2
.annotate 'line', 5989
    $P4 = $P1.'isop'('(')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 5990
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5991
    'ExpectOp'(')', __ARG_1)
.annotate 'line', 5992
    .return($P2)
# }
 __label_0: # endif
.annotate 'line', 5994
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5995
    new $P6, [ 'ArrayExpr' ]
    $P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_1: # endif
.annotate 'line', 5996
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 5997
    new $P6, [ 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 5998
    $P4 = $P1.'isstring'()
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 5999
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_3: # endif
.annotate 'line', 6000
    $P4 = $P1.'isint'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6001
    new $P6, [ 'IntegerLiteral' ]
    $P6.'IntegerLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_4: # endif
.annotate 'line', 6002
    $P4 = $P1.'isfloat'()
    if_null $P4, __label_5
    unless $P4 goto __label_5
.annotate 'line', 6003
    new $P6, [ 'FloatLiteral' ]
    $P6.'FloatLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_5: # endif
.annotate 'line', 6004
    $P4 = $P1.'checkkeyword'()
    set $S1, $P4
    set $S2, 'new'
    if $S1 == $S2 goto __label_8
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'class'
    if $S1 == $S2 goto __label_10
    goto __label_7
# switch
 __label_8: # case
.annotate 'line', 6006
    .tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
 __label_9: # case
.annotate 'line', 6008
    new $P6, [ 'FunctionExpr' ]
    $P6.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_10: # case
.annotate 'line', 6010
    new $P8, [ 'OpClassExpr' ]
    $P8.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P7, $P8
    .return($P7)
 __label_7: # default
 __label_6: # switch end
.annotate 'line', 6012
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_11
    unless $P4 goto __label_11
.annotate 'line', 6013
    new $P6, [ 'IdentifierExpr' ]
    $P6.'IdentifierExpr'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_11: # endif
.annotate 'line', 6014
    'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 6015

.end # parseExpr_0


.sub 'parseExpr_2'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6019
.const 'Sub' $P5 = 'parseExpr_0'
.annotate 'line', 6020
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 6022
# var subexp: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6023
# var t: $P2
    null $P2
.annotate 'line', 6024
# var start: $P3
    null $P3
.annotate 'line', 6025
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6026
    $P2 = __ARG_1.'get'()
    $P7 = $P6($P2)
    set $I1, $P7
    eq $I1, 0, __label_0
# {
.annotate 'line', 6027
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_4
    set $I3, 2
    if $I2 == $I3 goto __label_5
    set $I3, 3
    if $I2 == $I3 goto __label_6
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 6029
    new $P8, [ 'CallExpr' ]
    $P8.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P8
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6032
    new $P9, [ 'IndexExpr' ]
    $P9.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P9
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6035
    set $P3, $P2
.annotate 'line', 6036
    $P2 = __ARG_1.'get'()
.annotate 'line', 6037
    $P10 = $P2.'isop'('*')
    if_null $P10, __label_7
    unless $P10 goto __label_7
# {
.annotate 'line', 6038
# var right: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6039
    new $P7, [ 'MemberRefExpr' ]
    $P7.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P7
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 6042
    new $P7, [ 'MemberExpr' ]
    $P7.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
 __label_8: # endif
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6045
    'InternalError'('Unexpected code in parseExpr_2')
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6048
    __ARG_1.'unget'($P2)
.annotate 'line', 6049
    .return($P1)
# }
.annotate 'line', 6050

.end # parseExpr_2


.sub 'parseExpr_3'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6054
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 6056
# var subexp: $P1
    $P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6057
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6058
    $P4 = $P2.'isop'('++')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 6059
    new $P6, [ 'OpPostIncExpr' ]
    $P6.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
    goto __label_1
 __label_0: # else
.annotate 'line', 6060
    $P7 = $P2.'isop'('--')
    if_null $P7, __label_2
    unless $P7 goto __label_2
.annotate 'line', 6061
    new $P9, [ 'OpPostDecExpr' ]
    $P9.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P8, $P9
    .return($P8)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 6064
    __ARG_1.'unget'($P2)
.annotate 'line', 6065
    .return($P1)
# }
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 6067

.end # parseExpr_3


.sub 'parseExpr_4'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6071
.const 'Sub' $P3 = 'parseExpr_4'
.annotate 'line', 6072
.const 'Sub' $P4 = 'parseExpr_3'
.annotate 'line', 6073
.const 'Sub' $P5 = 'getOpCode_4'
.annotate 'line', 6075
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6076
# code: $I1
    $P6 = $P5($P1)
    set $I1, $P6
.annotate 'line', 6077
    eq $I1, 0, __label_0
# {
.annotate 'line', 6078
# var subexpr: $P2
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6079
    set $I2, $I1
    set $I3, 8
    if $I2 == $I3 goto __label_4
    set $I3, 11
    if $I2 == $I3 goto __label_5
    set $I3, 9
    if $I2 == $I3 goto __label_6
    set $I3, 10
    if $I2 == $I3 goto __label_7
    set $I3, 31
    if $I2 == $I3 goto __label_8
    set $I3, 32
    if $I2 == $I3 goto __label_9
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 6081
    new $P7, [ 'OpUnaryMinusExpr' ]
    $P7.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_5: # case
.annotate 'line', 6083
    new $P9, [ 'OpNotExpr' ]
    $P9.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P8, $P9
    .return($P8)
 __label_6: # case
.annotate 'line', 6085
    new $P11, [ 'OpPreIncExpr' ]
    $P11.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P10, $P11
    .return($P10)
 __label_7: # case
.annotate 'line', 6087
    new $P13, [ 'OpPreDecExpr' ]
    $P13.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P12, $P13
    .return($P12)
 __label_8: # case
.annotate 'line', 6089
    new $P15, [ 'OpDeleteExpr' ]
    $P15.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P14, $P15
    .return($P14)
 __label_9: # case
.annotate 'line', 6091
    new $P17, [ 'OpExistsExpr' ]
    $P17.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P16, $P17
    .return($P16)
 __label_3: # default
.annotate 'line', 6093
    'InternalError'('Invalid code in parseExpr_4', $P1)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6097
    __ARG_1.'unget'($P1)
.annotate 'line', 6098
    .tailcall $P4(__ARG_1, __ARG_2)
# }
 __label_1: # endif
# }
.annotate 'line', 6100

.end # parseExpr_4


.sub 'parseExpr_5'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6104
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 6105
.const 'Sub' $P5 = 'getOpCode_5'
.annotate 'line', 6107
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6108
# var t: $P2
    null $P2
.annotate 'line', 6109
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6110
    $P2 = __ARG_1.'get'()
    $P6 = $P5($P2)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6111
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6112
    set $I2, $I1
    set $I3, 19
    if $I2 == $I3 goto __label_4
    set $I3, 20
    if $I2 == $I3 goto __label_5
    set $I3, 21
    if $I2 == $I3 goto __label_6
    set $I3, 22
    if $I2 == $I3 goto __label_7
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 6114
    new $P6, [ 'OpMulExpr' ]
    $P6.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6117
    new $P7, [ 'OpDivExpr' ]
    $P7.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6120
    new $P8, [ 'OpModExpr' ]
    $P8.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P8
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6123
    new $P9, [ 'OpCModExpr' ]
    $P9.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P9
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6126
    'InternalError'('Invalid code in parseExpr_5', $P2)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6129
    __ARG_1.'unget'($P2)
.annotate 'line', 6130
    .return($P1)
# }
.annotate 'line', 6131

.end # parseExpr_5


.sub 'parseExpr_6'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6135
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 6137
# var lexpr: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6138
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6139
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('-')
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 6140
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6141
# var expr: $P4
    null $P4
.annotate 'line', 6142
    $P6 = $P2.'isop'('+')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 6143
    new $P7, [ 'OpAddExpr' ]
    $P7.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
    goto __label_4
 __label_3: # else
.annotate 'line', 6145
    new $P8, [ 'OpSubExpr' ]
    $P8.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P8
 __label_4: # endif
.annotate 'line', 6146
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6148
    __ARG_1.'unget'($P2)
.annotate 'line', 6149
    .return($P1)
# }
.annotate 'line', 6150

.end # parseExpr_6


.sub 'parseExpr_7'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6154
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 6156
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6157
# var rexpr: $P2
    null $P2
.annotate 'line', 6158
# var t: $P3
    null $P3
.annotate 'line', 6159
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6160
    $P3 = __ARG_1.'get'()
    $P5 = 'getOpCode_7'($P3)
    set $I1, $P5
    eq $I1, 0, __label_0
# {
.annotate 'line', 6161
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_4
    set $I3, 29
    if $I2 == $I3 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 6163
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6164
    new $P6, [ 'OpShiftleftExpr' ]
    $P6.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6167
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6168
    new $P7, [ 'OpShiftrightExpr' ]
    $P7.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6171
    'InternalError'('Invalid code in parseExpr_7', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6174
    __ARG_1.'unget'($P3)
.annotate 'line', 6175
    .return($P1)
# }
.annotate 'line', 6176

.end # parseExpr_7


.sub 'parseExpr_8'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6180
.const 'Sub' $P4 = 'parseExpr_7'
.annotate 'line', 6181
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 6183
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6184
# var rexpr: $P2
    null $P2
.annotate 'line', 6185
# var t: $P3
    null $P3
.annotate 'line', 6186
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6187
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6188
    set $I2, $I1
    set $I3, 14
    if $I2 == $I3 goto __label_4
    set $I3, 16
    if $I2 == $I3 goto __label_5
    set $I3, 15
    if $I2 == $I3 goto __label_6
    set $I3, 17
    if $I2 == $I3 goto __label_7
    set $I3, 27
    if $I2 == $I3 goto __label_8
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 6190
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6191
    new $P7, [ 'OpLessExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6194
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6195
    new $P8, [ 'OpGreaterExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6198
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6199
    new $P9, [ 'OpLessEqualExpr' ]
    $P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6202
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6203
    new $P10, [ 'OpGreaterEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6206
    new $P11, [ 'OpInstanceOfExpr' ]
    $P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P11
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6209
    'InternalError'('Invalid code in parseExpr_9', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6212
    __ARG_1.'unget'($P3)
.annotate 'line', 6213
    .return($P1)
# }
.annotate 'line', 6214

.end # parseExpr_8


.sub 'parseExpr_9'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6218
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 6219
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6221
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6222
# var rexpr: $P2
    null $P2
.annotate 'line', 6223
# var t: $P3
    null $P3
.annotate 'line', 6224
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6225
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6226
    set $I2, $I1
    set $I3, 12
    if $I2 == $I3 goto __label_4
    set $I3, 13
    if $I2 == $I3 goto __label_5
    set $I3, 25
    if $I2 == $I3 goto __label_6
    set $I3, 26
    if $I2 == $I3 goto __label_7
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 6228
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6229
    new $P7, [ 'OpEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6232
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6233
    new $P8, [ 'OpNotEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6236
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6237
    new $P9, [ 'OpSameExpr' ]
    $P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6240
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6241
    new $P10, [ 'OpSameExpr' ]
    $P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P10
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6244
    'InternalError'('Invalid code in parseExpr_8', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6247
    __ARG_1.'unget'($P3)
.annotate 'line', 6248
    .return($P1)
# }
.annotate 'line', 6249

.end # parseExpr_9


.sub 'parseExpr_10'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6253
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6255
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6256
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6257
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6258
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6259
    new $P5, [ 'OpBinAndExpr' ]
    $P5.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6261
    __ARG_1.'unget'($P2)
.annotate 'line', 6262
    .return($P1)
# }
.annotate 'line', 6263

.end # parseExpr_10


.sub 'parseExpr_11'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6267
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6269
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6270
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6271
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('^')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6272
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6273
    new $P5, [ 'OpBinXorExpr' ]
    $P5.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6275
    __ARG_1.'unget'($P2)
.annotate 'line', 6276
    .return($P1)
# }
.annotate 'line', 6277

.end # parseExpr_11


.sub 'parseExpr_12'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6281
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6283
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6284
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6285
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('|')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6286
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6287
    new $P5, [ 'OpBinOrExpr' ]
    $P5.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6289
    __ARG_1.'unget'($P2)
.annotate 'line', 6290
    .return($P1)
# }
.annotate 'line', 6291

.end # parseExpr_12


.sub 'parseExpr_13'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6295
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6297
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6298
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6299
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6300
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6301
    new $P5, [ 'OpBoolAndExpr' ]
    $P5.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6303
    __ARG_1.'unget'($P2)
.annotate 'line', 6304
    .return($P1)
# }
.annotate 'line', 6305

.end # parseExpr_13


.sub 'parseExpr_14'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6309
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6311
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6312
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6313
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('||')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6314
# var rexpr: $P3
    $P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 6315
    new $P5, [ 'OpBoolOrExpr' ]
    $P5.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6317
    __ARG_1.'unget'($P2)
.annotate 'line', 6318
    .return($P1)
# }
.annotate 'line', 6319

.end # parseExpr_14


.sub 'parseExpr_15'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6323
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6324
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6326
# var econd: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6327
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6328
    $P7 = $P2.'isop'('?')
    if_null $P7, __label_0
    unless $P7 goto __label_0
# {
.annotate 'line', 6329
# var etrue: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6330
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 6331
# var efalse: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6332
    new $P8, [ 'OpConditionalExpr' ]
    $P8.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P7, $P8
    .return($P7)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6335
    __ARG_1.'unget'($P2)
.annotate 'line', 6336
    .return($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6338

.end # parseExpr_15


.sub 'parseExpr_16'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6342
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6343
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 6344
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6346
# var lexpr: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6347
# var t: $P2
    null $P2
.annotate 'line', 6348
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6349
    $P2 = __ARG_1.'get'()
    $P8 = $P7($P2)
    set $I1, $P8
    eq $I1, 0, __label_0
# {
.annotate 'line', 6350
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6351
# var expr: $P4
    null $P4
.annotate 'line', 6352
    set $I2, $I1
    set $I3, 4
    if $I2 == $I3 goto __label_4
    set $I3, 5
    if $I2 == $I3 goto __label_5
    set $I3, 6
    if $I2 == $I3 goto __label_6
    set $I3, 18
    if $I2 == $I3 goto __label_7
    set $I3, 23
    if $I2 == $I3 goto __label_8
    set $I3, 24
    if $I2 == $I3 goto __label_9
    set $I3, 30
    if $I2 == $I3 goto __label_10
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 6354
    new $P4, [ 'OpAssignExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6357
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6360
    new $P4, [ 'OpAddToExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6363
    new $P4, [ 'OpSubToExpr' ]
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6366
    new $P4, [ 'OpMulToExpr' ]
    goto __label_2 # break
 __label_9: # case
.annotate 'line', 6369
    new $P4, [ 'OpDivToExpr' ]
    goto __label_2 # break
 __label_10: # case
.annotate 'line', 6372
    new $P4, [ 'OpModToExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6375
    'InternalError'('Unexpected code in parseExpr_16', $P2)
 __label_2: # switch end
.annotate 'line', 6377
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6378
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6380
    __ARG_1.'unget'($P2)
.annotate 'line', 6381
    .return($P1)
# }
.annotate 'line', 6382

.end # parseExpr_16


.sub 'parseExpr'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6386
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6388
    .tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 6389

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method
# Body
# {
.annotate 'line', 6404
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_0
.annotate 'line', 6405
    'InternalError'('attempt to generate break label twice')
 __label_0: # endif
.annotate 'line', 6406
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6407
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6408
    .return($S1)
# }
.annotate 'line', 6409

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6412
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6413
    unless_null $P1, __label_0
.annotate 'line', 6414
    'InternalError'('attempt to get break label before creating it')
 __label_0: # endif
.annotate 'line', 6415
    .return($P1)
# }
.annotate 'line', 6416

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6400
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method
# Body
# {
.annotate 'line', 6425
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_0
.annotate 'line', 6426
    'InternalError'('attempt to generate continue label twice')
 __label_0: # endif
.annotate 'line', 6427
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6428
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6429
    .return($S1)
# }
.annotate 'line', 6430

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6433
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6434
    unless_null $P1, __label_0
.annotate 'line', 6435
    'InternalError'('attempt to get continue label before creating it')
 __label_0: # endif
.annotate 'line', 6436
    .return($P1)
# }
.annotate 'line', 6437

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6419
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6421
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6453
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6454
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6455
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6456
    __ARG_2.'unget'($P1)
.annotate 'line', 6457
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 6459

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6462
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6463
    if_null $P1, __label_0
.annotate 'line', 6464
    $P1 = $P1.'optimize'()
 __label_0: # endif
.annotate 'line', 6465
    .return(self)
# }
.annotate 'line', 6466

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6470
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6471
# n: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
 __label_0:
.annotate 'line', 6474
    iseq $I2, $I1, 1
    unless $I2 goto __label_3
    isa $I2, self, [ 'ReturnStatement' ]
 __label_3:
    unless $I2 goto __label_2
# {
.annotate 'line', 6475
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6476
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6477
    self.'annotate'(__ARG_1)
.annotate 'line', 6478
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 6482
    le $I1, 0, __label_5
.annotate 'line', 6483
    $P1.'getargvalues'(__ARG_1)
 __label_5: # endif
.annotate 'line', 6485
    self.'annotate'(__ARG_1)
.annotate 'line', 6486
    self.'emitret'(__ARG_1)
.annotate 'line', 6487
    le $I1, 0, __label_6
.annotate 'line', 6488
    $P1.'emitargs'(__ARG_1)
 __label_6: # endif
.annotate 'line', 6489
    __ARG_1.'say'(')')
# }
.annotate 'line', 6490

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6447
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6449
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6497
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6498

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6501
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6502

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6493
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6509
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6510

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6513
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6514

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6505
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6527
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6528
    setattribute self, 'name', __ARG_1
.annotate 'line', 6529
# value: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'createlabel'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6530
    box $P1, $S1
    setattribute self, 'value', $P1
# }
.annotate 'line', 6531

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6532
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6535
    self.'annotate'(__ARG_1)
.annotate 'line', 6536
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6537
# comment: $S2
    concat $S2, 'label ', $S1
.annotate 'line', 6538
    getattribute $P1, self, 'value'
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6539

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6521
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6523
    addattribute $P0, 'name'
.annotate 'line', 6524
    addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6553
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6554
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6555

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6556
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6559
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6560
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6561
    .return($S2)
# }
.annotate 'line', 6562

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6548
    addattribute $P0, 'owner'
.annotate 'line', 6549
    addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6575
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6576
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6577
    'RequireIdentifier'($P1)
.annotate 'line', 6578
    setattribute self, 'label', $P1
.annotate 'line', 6579
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6580

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6581
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6584
    self.'annotate'(__ARG_1)
.annotate 'line', 6585
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6586
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6587
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6588

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6569
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6571
    addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6599
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6600

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6603
    'ExpectOp'('(', __ARG_1)
.annotate 'line', 6604
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6605
    'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6606

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6595
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Condition' ]
    addparent $P0, $P2
.end
.namespace [ 'IfStatement' ]

.sub 'IfStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6619
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6620
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6621
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6622
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6623
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 6624
    $P4 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6626
    new $P6, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6627
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6629

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6632
    self.'optimize_condition'()
.annotate 'line', 6633
# checkvalue: $I1
    $P1 = self.'getvalue'()
    set $I1, $P1
.annotate 'line', 6634
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6635
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 6636
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    set $I3, 2
    if $I2 == $I3 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6638
    getattribute $P1, self, 'truebranch'
    .return($P1)
 __label_3: # case
.annotate 'line', 6640
    getattribute $P2, self, 'falsebranch'
    .return($P2)
 __label_1: # default
 __label_0: # switch end
.annotate 'line', 6642
    .return(self)
# }
.annotate 'line', 6643

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6646
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6647
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6648
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6649
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6650
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6651
    not $I3, $I2
    unless $I3 goto __label_0
.annotate 'line', 6652
    $P3 = self.'genlabel'()
    set $S1, $P3
 __label_0: # endif
.annotate 'line', 6653
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 6654
# cond_false: $S3
    unless $I2 goto __label_3
    set $S3, $S2
    goto __label_2
 __label_3:
    set $S3, $S1
 __label_2:
.annotate 'line', 6655
    self.'annotate'(__ARG_1)
.annotate 'line', 6656
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6657
    $P1.'emit'(__ARG_1)
.annotate 'line', 6659
    not $I3, $I2
    unless $I3 goto __label_4
# {
.annotate 'line', 6660
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6661
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6662
    $P2.'emit'(__ARG_1)
# }
 __label_4: # endif
.annotate 'line', 6664
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6665

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6613
    get_class $P1, [ 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6615
    addattribute $P0, 'truebranch'
.annotate 'line', 6616
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6677
    $P2 = 'parseStatement'(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6678

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6681
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6682
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6684
    self.'annotate'(__ARG_1)
.annotate 'line', 6685
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6686
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6687
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6688
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6689

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6672
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6674
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6700
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6701
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6702
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6703

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6706
    self.'optimize_condition'()
.annotate 'line', 6707
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6708
    .return(self)
# }
.annotate 'line', 6709

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6712
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6714
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 6717
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6720
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
 __label_4:
.annotate 'line', 6721
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 6723
    self.'annotate'(__ARG_1)
.annotate 'line', 6724
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6725
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6726
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6727
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6728
    __ARG_1.'emitlabel'($S1, 'endwhile')
 __label_0: # switch end
# }
.annotate 'line', 6730

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6696
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'ConditionalStatement' ]
    addparent $P0, $P2
.end
.namespace [ 'DoStatement' ]

.sub 'DoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6741
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6742
    self.'parsebody'(__ARG_2)
.annotate 'line', 6743
    'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6744
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6745

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6748
    self.'optimize_condition'()
.annotate 'line', 6749
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6750
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_1
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 6751
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
 __label_0: # endif
.annotate 'line', 6752
    setattribute self, 'body', $P1
.annotate 'line', 6753
    .return(self)
# }
.annotate 'line', 6754

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6757
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6758
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
.annotate 'line', 6759
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6761
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6764
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 6765
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
 __label_4:
.annotate 'line', 6766
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_5
    set $S3, $P4
 __label_5:
.annotate 'line', 6768
    self.'annotate'(__ARG_1)
.annotate 'line', 6769
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6771
    $P1.'emit'(__ARG_1)
.annotate 'line', 6772
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6773
    eq $I1, 2, __label_6
.annotate 'line', 6774
    self.'emit_if'(__ARG_1, $S1, $S2)
 __label_6: # endif
.annotate 'line', 6775
    __ARG_1.'emitlabel'($S2, 'enddo')
 __label_0: # switch end
# }
.annotate 'line', 6777

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6737
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'ConditionalStatement' ]
    addparent $P0, $P2
.end
.namespace [ 'ContinueStatement' ]

.sub 'ContinueStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6788
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6789
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6790

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6791
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6794
    self.'annotate'(__ARG_1)
.annotate 'line', 6795
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6796
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6797

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6784
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6808
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6809
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6810

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6811
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6814
    self.'annotate'(__ARG_1)
.annotate 'line', 6815
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6816
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6817

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6804
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6833
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6834
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6835
    $P3 = $P1.'isop'('(')
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 6836
    'Expected'("'(' in switch", $P1)
 __label_0: # endif
.annotate 'line', 6837
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'condition', $P4
.annotate 'line', 6838
    $P1 = __ARG_2.'get'()
.annotate 'line', 6839
    $P3 = $P1.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 6840
    'Expected'("')' in switch", $P1)
 __label_1: # endif
.annotate 'line', 6841
    $P1 = __ARG_2.'get'()
.annotate 'line', 6842
    $P3 = $P1.'isop'('{')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 6843
    'Expected'("'{' in switch", $P1)
 __label_2: # endif
.annotate 'line', 6844
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P4
.annotate 'line', 6845
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P4
.annotate 'line', 6846
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P4
 __label_4: # while
.annotate 'line', 6847
    $P1 = __ARG_2.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_5
    $I1 = $P1.'iskeyword'('default')
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 6848
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 6849
    getattribute $P4, self, 'case_value'
    $P5 = 'parseExpr'(__ARG_2, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6850
    $P1 = __ARG_2.'get'()
.annotate 'line', 6851
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_8
.annotate 'line', 6852
    'Expected'("':' in case", $P1)
 __label_8: # endif
.annotate 'line', 6853
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_10: # while
.annotate 'line', 6854
    $P1 = __ARG_2.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_12
    $I2 = $P1.'iskeyword'('case')
 __label_12:
    if $I2 goto __label_11
    $I2 = $P1.'iskeyword'('default')
 __label_11:
    not $I1, $I2
    unless $I1 goto __label_9
# {
.annotate 'line', 6855
    __ARG_2.'unget'($P1)
.annotate 'line', 6856
    $P3 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P2, $P3
# }
    goto __label_10
 __label_9: # endwhile
.annotate 'line', 6858
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6859
    __ARG_2.'unget'($P1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 6862
    $P1 = __ARG_2.'get'()
.annotate 'line', 6863
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_13
.annotate 'line', 6864
    'Expected'("':' in default", $P1)
 __label_13: # endif
 __label_15: # while
.annotate 'line', 6865
    $P1 = __ARG_2.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_17
    $I2 = $P1.'iskeyword'('case')
 __label_17:
    if $I2 goto __label_16
    $I2 = $P1.'iskeyword'('default')
 __label_16:
    not $I1, $I2
    unless $I1 goto __label_14
# {
.annotate 'line', 6866
    __ARG_2.'unget'($P1)
.annotate 'line', 6867
    getattribute $P3, self, 'default_st'
    $P4 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P3, $P4
# }
    goto __label_15
 __label_14: # endwhile
.annotate 'line', 6869
    __ARG_2.'unget'($P1)
# }
 __label_7: # endif
# }
    goto __label_4
 __label_3: # endwhile
# }
.annotate 'line', 6872

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6875
    getattribute $P4, self, 'condition'
    $P3 = $P4.'optimize'()
    setattribute self, 'condition', $P3
.annotate 'line', 6876
    getattribute $P2, self, 'case_value'
    'optimize_array'($P2)
.annotate 'line', 6877
    getattribute $P2, self, 'case_st'
    iter $P5, $P2
    set $P5, 0
 __label_0: # for iteration
    unless $P5 goto __label_1
    shift $P1, $P5
.annotate 'line', 6878
    'optimize_array'($P1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6879
    getattribute $P2, self, 'default_st'
    'optimize_array'($P2)
.annotate 'line', 6880
    .return(self)
# }
.annotate 'line', 6881

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6885
# type: $S1
    set $S1, ''
.annotate 'line', 6886
    getattribute $P10, self, 'case_value'
    iter $P11, $P10
    set $P11, 0
 __label_0: # for iteration
    unless $P11 goto __label_1
    shift $P1, $P11
# {
.annotate 'line', 6887
# t: $S2
    $P12 = $P1.'checkresult'()
    null $S2
    if_null $P12, __label_2
    set $S2, $P12
 __label_2:
.annotate 'line', 6888
    ne $S2, 'N', __label_3
.annotate 'line', 6889
    getattribute $P10, self, 'start'
    'SyntaxError'("Invalid type in case", $P10)
 __label_3: # endif
.annotate 'line', 6890
    ne $S1, '', __label_4
.annotate 'line', 6891
    set $S1, $S2
    goto __label_5
 __label_4: # else
.annotate 'line', 6892
    eq $S1, $S2, __label_6
.annotate 'line', 6893
    set $S1, 'P'
 __label_6: # endif
 __label_5: # endif
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6896
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 6897
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 6901
    ne $S1, '', __label_7
.annotate 'line', 6902
    set $S1, $P3
 __label_7: # endif
.annotate 'line', 6904
# reg: $S3
    $P10 = self.'tempreg'($S1)
    null $S3
    if_null $P10, __label_8
    set $S3, $P10
 __label_8:
.annotate 'line', 6905
    set $S9, $P3
    ne $S9, $S1, __label_9
.annotate 'line', 6906
    $P2.'emit'(__ARG_1, $S3)
    goto __label_10
 __label_9: # else
# {
.annotate 'line', 6908
# regcond: $S4
    $P10 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P10, __label_11
    set $S4, $P10
 __label_11:
.annotate 'line', 6909
    __ARG_1.'emitset'($S3, $S4)
# }
 __label_10: # endif
.annotate 'line', 6913
    self.'genbreaklabel'()
.annotate 'line', 6914
# defaultlabel: $S5
    $P10 = self.'genlabel'()
    null $S5
    if_null $P10, __label_12
    set $S5, $P10
 __label_12:
.annotate 'line', 6915
    new $P4, ['ResizableStringArray']
.annotate 'line', 6916
# regval: $S6
    $P10 = self.'tempreg'($S1)
    null $S6
    if_null $P10, __label_13
    set $S6, $P10
 __label_13:
.annotate 'line', 6917
    getattribute $P10, self, 'case_value'
    iter $P13, $P10
    set $P13, 0
 __label_14: # for iteration
    unless $P13 goto __label_15
    shift $P5, $P13
# {
.annotate 'line', 6918
# label: $S7
    $P12 = self.'genlabel'()
    null $S7
    if_null $P12, __label_16
    set $S7, $P12
 __label_16:
.annotate 'line', 6919
# predefined push
    push $P4, $S7
.annotate 'line', 6920
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 6921
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_14
 __label_15: # endfor
.annotate 'line', 6923
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 6926
    __ARG_1.'comment'('switch')
.annotate 'line', 6927
    self.'annotate'(__ARG_1)
.annotate 'line', 6928
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 6929
# n: $I1
    set $P10, $P6
    set $I1, $P10
# for loop
.annotate 'line', 6930
# i: $I2
    null $I2
 __label_19: # for condition
    ge $I2, $I1, __label_18
# {
.annotate 'line', 6931
# l: $S8
    $S8 = $P4[$I2]
.annotate 'line', 6932
    __ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6933
# var casest: $P7
    $P7 = $P6[$I2]
.annotate 'line', 6934
    iter $P14, $P7
    set $P14, 0
 __label_20: # for iteration
    unless $P14 goto __label_21
    shift $P8, $P14
.annotate 'line', 6935
    $P8.'emit'(__ARG_1)
    goto __label_20
 __label_21: # endfor
# }
 __label_17: # for iteration
.annotate 'line', 6930
    inc $I2
    goto __label_19
 __label_18: # for end
.annotate 'line', 6938
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6939
    getattribute $P10, self, 'default_st'
    iter $P15, $P10
    set $P15, 0
 __label_22: # for iteration
    unless $P15 goto __label_23
    shift $P9, $P15
.annotate 'line', 6940
    $P9.'emit'(__ARG_1)
    goto __label_22
 __label_23: # endfor
.annotate 'line', 6942
    getattribute $P12, self, 'start'
    $P10 = self.'getbreaklabel'($P12)
    __ARG_1.'emitlabel'($P10, 'switch end')
# }
.annotate 'line', 6943

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6824
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6826
    addattribute $P0, 'condition'
.annotate 'line', 6827
    addattribute $P0, 'case_value'
.annotate 'line', 6828
    addattribute $P0, 'case_st'
.annotate 'line', 6829
    addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6957
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6958
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6959
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6960
    __ARG_2.'unget'($P1)
.annotate 'line', 6961
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
 __label_0: # endif
.annotate 'line', 6963
    $P1 = __ARG_2.'get'()
.annotate 'line', 6964
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6965
    __ARG_2.'unget'($P1)
.annotate 'line', 6966
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6967
    'ExpectOp'(';', __ARG_2)
# }
 __label_1: # endif
.annotate 'line', 6969
    $P1 = __ARG_2.'get'()
.annotate 'line', 6970
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 6971
    __ARG_2.'unget'($P1)
.annotate 'line', 6972
    $P3 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 6973
    'ExpectOp'(')', __ARG_2)
# }
 __label_2: # endif
.annotate 'line', 6975
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6976

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6979
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_0
.annotate 'line', 6980
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
 __label_0: # endif
.annotate 'line', 6981
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_1
.annotate 'line', 6982
    self.'optimize_condition'()
 __label_1: # endif
.annotate 'line', 6983
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_2
.annotate 'line', 6984
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
 __label_2: # endif
.annotate 'line', 6985
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6986
    .return(self)
# }
.annotate 'line', 6987

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6990
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 6991
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6992
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 6993
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 6994
    .return()
# }
 __label_0: # endif
.annotate 'line', 6996
    __ARG_1.'comment'('for loop')
.annotate 'line', 6997
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
 __label_3:
.annotate 'line', 6998
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
 __label_4:
.annotate 'line', 6999
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
 __label_5:
.annotate 'line', 7000
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_6
.annotate 'line', 7001
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
 __label_6: # endif
.annotate 'line', 7003
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7004
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_7
.annotate 'line', 7005
    self.'emit_else'(__ARG_1, $S2)
 __label_7: # endif
.annotate 'line', 7007
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7008
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7009
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_8
.annotate 'line', 7010
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
 __label_8: # endif
.annotate 'line', 7011
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7013
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7014

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6950
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 6952
    addattribute $P0, 'initializer'
.annotate 'line', 6953
    addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
# Body
# {
.annotate 'line', 7029
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7030
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7031
    eq __ARG_5, '', __label_1
# {
.annotate 'line', 7032
# deftype: $S2
    $P1 = 'typetoregcheck'(__ARG_5)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 7033
    self.'createvar'($S1, $S2)
.annotate 'line', 7034
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
 __label_1: # endif
.annotate 'line', 7036
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7037
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7038
    'ExpectOp'(')', __ARG_2)
.annotate 'line', 7039
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7040

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7043
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7044
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7045
    .return(self)
# }
.annotate 'line', 7046

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7049
    self.'annotate'(__ARG_1)
.annotate 'line', 7050
# regcont: $S1
    null $S1
.annotate 'line', 7051
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_0
# {
.annotate 'line', 7052
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 7053
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7054
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 7057
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 7058
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7059
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 7060
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_4
    set $S4, $P2
 __label_4:
.annotate 'line', 7061
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_5
    set $S5, $P2
 __label_5:
.annotate 'line', 7062
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7063
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7064
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7065
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7066
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7067
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7068
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7069
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7070

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 7021
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7023
    addattribute $P0, 'deftype'
.annotate 'line', 7024
    addattribute $P0, 'varname'
.annotate 'line', 7025
    addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7077
    'ExpectOp'('(', __ARG_2)
.annotate 'line', 7078
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7079
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7080
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 7081
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7083
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7084
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 7085
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 7086
    __ARG_2.'unget'($P3)
.annotate 'line', 7087
    __ARG_2.'unget'($P2)
.annotate 'line', 7088
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
.annotate 'line', 7090
    new $P5, [ 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7091

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7103
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7104
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7105

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7108
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7109
    .return(self)
# }
.annotate 'line', 7110

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7113
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7114
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7115
    self.'annotate'(__ARG_1)
.annotate 'line', 7116
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_3
    set $S3, 'S'
    if $S2 == $S3 goto __label_4
    goto __label_2
# switch
 __label_3: # case
.annotate 'line', 7118
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_1 # break
 __label_4: # case
.annotate 'line', 7121
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_1 # break
 __label_2: # default
.annotate 'line', 7124
    getattribute $P3, self, 'start'
    'SyntaxError'("Invalid throw argument", $P3)
 __label_1: # switch end
# }
.annotate 'line', 7126

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 7097
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7099
    addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7142
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7143
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7144
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 7145
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_1
 __label_0: # else
.annotate 'line', 7147
    __ARG_2.'unget'($P1)
 __label_1: # endif
.annotate 'line', 7149
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7150
    $P1 = __ARG_2.'get'()
.annotate 'line', 7151
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7152
    'ExpectedOp'('catch', $P1)
 __label_2: # endif
.annotate 'line', 7153
    $P1 = __ARG_2.'get'()
.annotate 'line', 7154
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7155
    'Expected'("'(' after 'catch'", $P1)
 __label_3: # endif
.annotate 'line', 7156
    $P1 = __ARG_2.'get'()
.annotate 'line', 7157
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_4
# {
.annotate 'line', 7158
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
 __label_5:
.annotate 'line', 7159
    setattribute self, 'exname', $P1
.annotate 'line', 7160
    self.'createvar'($S1, 'P')
.annotate 'line', 7161
    $P1 = __ARG_2.'get'()
.annotate 'line', 7162
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 7163
    'Expected'("')' in 'catch'", $P1)
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 7165
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7166

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7169
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_0
.annotate 'line', 7170
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
 __label_0: # endif
.annotate 'line', 7171
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7172
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7173
    .return(self)
# }
.annotate 'line', 7174

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7177
# reghandler: $S1
    $P7 = self.'tempreg'('P')
    null $S1
    if_null $P7, __label_0
    set $S1, $P7
 __label_0:
.annotate 'line', 7178
# labelhandler: $S2
    $P7 = self.'genlabel'()
    null $S2
    if_null $P7, __label_1
    set $S2, $P7
 __label_1:
.annotate 'line', 7179
# labelpasthandler: $S3
    $P7 = self.'genlabel'()
    null $S3
    if_null $P7, __label_2
    set $S3, $P7
 __label_2:
.annotate 'line', 7180
# exreg: $S4
    null $S4
.annotate 'line', 7181
    getattribute $P7, self, 'exname'
    if_null $P7, __label_3
# {
.annotate 'line', 7182
# var exname: $P1
    getattribute $P8, self, 'exname'
    $P1 = self.'getvar'($P8)
.annotate 'line', 7183
    $P7 = $P1.'getreg'()
    set $S4, $P7
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 7186
    $P7 = self.'tempreg'('P')
    set $S4, $P7
 __label_4: # endif
.annotate 'line', 7188
    self.'annotate'(__ARG_1)
.annotate 'line', 7189
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7191
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7192
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7194
    getattribute $P7, self, 'modifiers'
    if_null $P7, __label_5
# {
.annotate 'line', 7195
# var modiflist: $P2
    getattribute $P8, self, 'modifiers'
    $P2 = $P8.'getlist'()
.annotate 'line', 7196
    iter $P9, $P2
    set $P9, 0
 __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P3, $P9
# {
.annotate 'line', 7197
# modifname: $S5
    $P7 = $P3.'getname'()
    null $S5
    if_null $P7, __label_8
    set $S5, $P7
 __label_8:
.annotate 'line', 7198
# nargs: $I1
    $P7 = $P3.'numargs'()
    set $I1, $P7
.annotate 'line', 7199
    set $S7, $S5
    set $S8, 'min_severity'
    if $S7 == $S8 goto __label_11
    set $S8, 'max_severity'
    if $S7 == $S8 goto __label_12
    set $S8, 'handle_types'
    if $S7 == $S8 goto __label_13
    set $S8, 'handle_types_except'
    if $S7 == $S8 goto __label_14
    goto __label_10
# switch
 __label_11: # case
 __label_12: # case
.annotate 'line', 7202
    eq $I1, 1, __label_15
.annotate 'line', 7203
    getattribute $P7, self, 'start'
    'SyntaxError'('Wrong modifier args', $P7)
 __label_15: # endif
.annotate 'line', 7204
# var arg: $P4
    $P4 = $P3.'getarg'(0)
.annotate 'line', 7205
# argreg: $S6
    $P8 = $P4.'emit_get'(__ARG_1)
    null $S6
    if_null $P8, __label_16
    set $S6, $P8
 __label_16:
.annotate 'line', 7206
    __ARG_1.'say'('    ', $S1, ".'", $S5, "'(", $S6, ")")
    goto __label_9 # break
 __label_13: # case
 __label_14: # case
.annotate 'line', 7210
    new $P5, ['ResizableStringArray']
# for loop
.annotate 'line', 7211
# i: $I2
    null $I2
 __label_19: # for condition
    ge $I2, $I1, __label_18
# {
.annotate 'line', 7212
# var arg: $P6
    $P6 = $P3.'getarg'($I2)
.annotate 'line', 7213
    $P7 = $P6.'emit_get'(__ARG_1)
# predefined push
    push $P5, $P7
# }
 __label_17: # for iteration
.annotate 'line', 7211
    inc $I2
    goto __label_19
 __label_18: # for end
.annotate 'line', 7216
# predefined join
    join $S7, ', ', $P5
.annotate 'line', 7215
    __ARG_1.'say'('    ', $S1, ".'", $S5, "'(", $S7, ")")
    goto __label_9 # break
 __label_10: # default
.annotate 'line', 7219
    getattribute $P7, self, 'start'
    'SyntaxError'('Unexpected modifier in try', $P7)
 __label_9: # switch end
# }
    goto __label_6
 __label_7: # endfor
# }
 __label_5: # endif
.annotate 'line', 7224
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7225
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7226
    getattribute $P7, self, 'stry'
    $P7.'emit'(__ARG_1)
.annotate 'line', 7227
    __ARG_1.'comment'('try: end')
.annotate 'line', 7228
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7230
    self.'annotate'(__ARG_1)
.annotate 'line', 7231
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7233
    __ARG_1.'comment'('catch')
.annotate 'line', 7234
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7235
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7236
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7237
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7238
    getattribute $P7, self, 'scatch'
    $P7.'emit'(__ARG_1)
.annotate 'line', 7240
    __ARG_1.'comment'('catch end')
.annotate 'line', 7241
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7242

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 7133
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7135
    addattribute $P0, 'stry'
.annotate 'line', 7136
    addattribute $P0, 'modifiers'
.annotate 'line', 7137
    addattribute $P0, 'exname'
.annotate 'line', 7138
    addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7255
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7256
    setattribute self, 'name', __ARG_3
.annotate 'line', 7257
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7258
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7259

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7249
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7251
    addattribute $P0, 'name'
.annotate 'line', 7252
    addattribute $P0, 'reg'
.end
.namespace [ 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 7274
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7275
    setattribute self, 'name', __ARG_3
.annotate 'line', 7276
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7277

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7266
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7268
    addattribute $P0, 'name'
.annotate 'line', 7269
    addattribute $P0, 'basetype'
.annotate 'line', 7270
    addattribute $P0, 'reg'
.end
.namespace [ 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7288
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7289
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7290
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7291
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7292
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7294
    $P5 = 'parseExpr'(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 7297
    __ARG_5.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 7298

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7301
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7302
    if_null $P1, __label_0
.annotate 'line', 7303
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7304
    .return(self)
# }
.annotate 'line', 7305

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7308
    self.'annotate'(__ARG_1)
.annotate 'line', 7309
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7310
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7311
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
 __label_2:
.annotate 'line', 7312
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7313
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7315
    isnull $I1, $P1
    if $I1 goto __label_5
    $I1 = $P1.'isnull'()
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 7316
    __ARG_1.'emitnull'($S2)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7318
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
 __label_6:
.annotate 'line', 7319
    ne $S4, $S3, __label_7
# {
.annotate 'line', 7320
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_11
    isa $I1, $P1, [ 'ConcatString' ]
 __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7321
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
.annotate 'line', 7323
    $P1.'emit'(__ARG_1, $S2)
 __label_10: # endif
# }
    goto __label_8
 __label_7: # else
# {
.annotate 'line', 7326
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_12
# {
.annotate 'line', 7328
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_13
 __label_12: # else
# {
.annotate 'line', 7331
# ireg: $S5
    null $S5
.annotate 'line', 7332
    ne $S4, '', __label_14
.annotate 'line', 7333
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15
 __label_14: # else
# {
.annotate 'line', 7335
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7336
    $P1.'emit'(__ARG_1, $S5)
# }
 __label_15: # endif
.annotate 'line', 7338
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
 __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 7339
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
 __label_19:
.annotate 'line', 7340
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7341
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7342
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7343
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
 __label_16: # else
.annotate 'line', 7346
    __ARG_1.'emitset'($S2, $S5)
 __label_17: # endif
# }
 __label_13: # endif
# }
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 7350

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7282
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7284
    addattribute $P0, 'init'
.end
.namespace [ 'DeclareArrayStatement' ]

.sub 'DeclareArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
        .param pmc __ARG_6
# Body
# {
.annotate 'line', 7365
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7366
    box $P4, __ARG_5
    setattribute self, 'arraytype', $P4
.annotate 'line', 7367
# var vdata: $P1
    getattribute $P4, self, 'name'
    $P1 = self.'createvar'($P4, 'P')
.annotate 'line', 7368
    $P5 = $P1.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 7369
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7370
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_0
# {
.annotate 'line', 7372
    __ARG_6.'unget'($P2)
.annotate 'line', 7373
    $P5 = 'parseExpr'(__ARG_6, self)
    setattribute self, 'size', $P5
.annotate 'line', 7374
    'ExpectOp'(']', __ARG_6)
# }
 __label_0: # endif
.annotate 'line', 7376
    $P2 = __ARG_6.'get'()
.annotate 'line', 7377
    $P4 = $P2.'isop'('=')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7378
    $P2 = __ARG_6.'get'()
.annotate 'line', 7379
    $P4 = $P2.'isop'('[')
    isfalse $I1, $P4
    unless $I1 goto __label_3
.annotate 'line', 7380
    'Expected'("array initializer", $P2)
 __label_3: # endif
.annotate 'line', 7381
    root_new $P5, ['parrot';'ResizablePMCArray']
    setattribute self, 'initarray', $P5
.annotate 'line', 7382
    $P2 = __ARG_6.'get'()
.annotate 'line', 7383
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_4
# {
.annotate 'line', 7384
    __ARG_6.'unget'($P2)
 __label_5: # do
.annotate 'line', 7385
# {
.annotate 'line', 7386
# var item: $P3
    $P3 = 'parseExpr'(__ARG_6, self)
.annotate 'line', 7387
    getattribute $P4, self, 'initarray'
# predefined push
    push $P4, $P3
# }
 __label_7: # continue
.annotate 'line', 7388
    $P2 = __ARG_6.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 7389
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_8
.annotate 'line', 7390
    'Expected'("',' or ']'", $P2)
 __label_8: # endif
# }
 __label_4: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 7394
    __ARG_6.'unget'($P2)
 __label_2: # endif
# }
.annotate 'line', 7395

.end # DeclareArrayStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7398
    getattribute $P1, self, 'size'
    if_null $P1, __label_0
.annotate 'line', 7399
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
 __label_0: # endif
.annotate 'line', 7400
    getattribute $P1, self, 'initarray'
    'optimize_array'($P1)
.annotate 'line', 7401
    .return(self)
# }
.annotate 'line', 7402

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7405
    self.'annotate'(__ARG_1)
.annotate 'line', 7407
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7408
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7409
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7410
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7411
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7412
    if_null $P2, __label_0
# {
.annotate 'line', 7414
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
 __label_2:
.annotate 'line', 7415
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7419
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
 __label_1: # endif
.annotate 'line', 7421
    if_null $P3, __label_3
# {
.annotate 'line', 7422
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_4
    set $S3, $P6
 __label_4:
.annotate 'line', 7423
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7424
    unless_null $P2, __label_5
# {
.annotate 'line', 7425
    le $I1, 0, __label_6
# {
.annotate 'line', 7427
    __ARG_1.'emitset'($P1, $I1)
# }
 __label_6: # endif
# }
 __label_5: # endif
.annotate 'line', 7430
# i: $I2
    null $I2
.annotate 'line', 7431
    iter $P7, $P3
    set $P7, 0
 __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P5, $P7
# {
.annotate 'line', 7432
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7433
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7434
    inc $I2
# }
    goto __label_7
 __label_8: # endfor
# }
 __label_3: # endif
# }
.annotate 'line', 7437

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7355
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7357
    addattribute $P0, 'size'
.annotate 'line', 7358
    addattribute $P0, 'initarray'
.annotate 'line', 7359
    addattribute $P0, 'arraytype'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7444
# var next: $P1
    null $P1
.annotate 'line', 7445
# var r: $P2
    null $P2
 __label_0: # do
.annotate 'line', 7446
# {
.annotate 'line', 7447
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7448
    'RequireIdentifier'($P3)
.annotate 'line', 7449
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7450
# var item: $P5
    null $P5
.annotate 'line', 7451
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 7452
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7454
    __ARG_4.'unget'($P4)
.annotate 'line', 7455
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
 __label_4: # endif
.annotate 'line', 7457
    $P2 = 'addtomulti'($P2, $P5)
.annotate 'line', 7458
    $P1 = __ARG_4.'get'()
# }
 __label_2: # continue
.annotate 'line', 7459
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_1
    if $P6 goto __label_0
 __label_1: # enddo
.annotate 'line', 7460
    'RequireOp'(';', $P1)
.annotate 'line', 7461
    .return($P2)
# }
.annotate 'line', 7462

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7470
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7471

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7466
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7478
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7479

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7474
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSingle'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7485
    new $P2, [ 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7486

.end # newIntSingle


.sub 'newIntArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7490
    new $P2, [ 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7491

.end # newIntArray


.sub 'parseInt'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7495
.const 'Sub' $P1 = 'newIntSingle'
.annotate 'line', 7496
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7497
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7498

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7506
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7507

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7502
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7514
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7515

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7510
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSingle'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7521
    new $P2, [ 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7522

.end # newFloatSingle


.sub 'newFloatArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7526
    new $P2, [ 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7527

.end # newFloatArray


.sub 'parseFloat'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7531
.const 'Sub' $P1 = 'newFloatSingle'
.annotate 'line', 7532
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7533
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7534

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7542
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7543

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7538
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7550
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7551

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7546
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSingle'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7557
    new $P2, [ 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7558

.end # newStringSingle


.sub 'newStringArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7562
    new $P2, [ 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7563

.end # newStringArray


.sub 'parseString'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7567
.const 'Sub' $P1 = 'newStringSingle'
.annotate 'line', 7568
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7569
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7570

.end # parseString

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7585
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7586
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7587
    setattribute self, 'name', __ARG_4
.annotate 'line', 7588
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7589

.end # ConstStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7592
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7593
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7594
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 7595
    $P1 = $P1.'optimize'()
.annotate 'line', 7596
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7598
    getattribute $P4, self, 'start'
.annotate 'line', 7597
    'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
 __label_1: # endif
.annotate 'line', 7600
    self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7601
    setattribute self, 'value', $P1
.annotate 'line', 7602
    .return(self)
# }
.annotate 'line', 7603

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 7606
    getattribute $P1, self, 'start'
    'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7607

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7610
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7611
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7612

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7576
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7578
    addattribute $P0, 'type'
.annotate 'line', 7579
    addattribute $P0, 'name'
.annotate 'line', 7580
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7617
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7618
# type: $S1
    $P5 = 'typetoregcheck'($P1)
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 7619
    isne $I1, $S1, 'I'
    unless $I1 goto __label_3
    isne $I1, $S1, 'N'
 __label_3:
    unless $I1 goto __label_2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7620
    'SyntaxError'('Invalid type for const', __ARG_1)
 __label_1: # endif
.annotate 'line', 7622
# var multi: $P2
    null $P2
 __label_4: # do
.annotate 'line', 7623
# {
.annotate 'line', 7624
    $P1 = __ARG_2.'get'()
.annotate 'line', 7625
# var name: $P3
    set $P3, $P1
.annotate 'line', 7626
    'ExpectOp'('=', __ARG_2)
.annotate 'line', 7627
# var value: $P4
    $P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7629
    new $P6, [ 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7628
    $P2 = 'addtomulti'($P2, $P5)
# }
 __label_6: # continue
.annotate 'line', 7630
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_5
    if $P5 goto __label_4
 __label_5: # enddo
.annotate 'line', 7631
    .return($P2)
# }
.annotate 'line', 7632

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
# Body
# {
.annotate 'line', 7643
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7644
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7645
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 7646
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7647
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 7649
    'RequireOp'(';', $P1)
# }
.annotate 'line', 7650

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7653
    getattribute $P1, self, 'init'
    if_null $P1, __label_0
.annotate 'line', 7654
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7655
    .return(self)
# }
.annotate 'line', 7656

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7659
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7660

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7663
    self.'annotate'(__ARG_1)
.annotate 'line', 7664
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7665
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7666
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7667
    concat $S5, 'var ', $S1
    concat $S5, $S5, ': '
    concat $S5, $S5, $S2
    __ARG_1.'comment'($S5)
.annotate 'line', 7668
    if_null $P1, __label_2
.annotate 'line', 7669
    $P2 = $P1.'isnull'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7670
    null $P1
 __label_3: # endif
 __label_2: # endif
.annotate 'line', 7671
    if_null $P1, __label_4
# {
.annotate 'line', 7672
# type: $S3
    $P2 = $P1.'checkresult'()
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 7673
    set $S5, $S3
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    set $S6, 'S'
    if $S5 == $S6 goto __label_10
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'N'
    if $S5 == $S6 goto __label_12
    set $S6, 'v'
    if $S5 == $S6 goto __label_13
    goto __label_8
# switch
 __label_9: # case
.annotate 'line', 7675
    isa $I1, $P1, [ 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'ArrayExpr' ]
 __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'NewExpr' ]
 __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7676
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
 __label_14: # else
.annotate 'line', 7678
    $P1.'emit'(__ARG_1, $S2)
 __label_15: # endif
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
 __label_12: # case
.annotate 'line', 7683
# value: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_18
    set $S4, $P2
 __label_18:
.annotate 'line', 7684
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_7 # break
 __label_13: # case
.annotate 'line', 7687
    getattribute $P3, self, 'name'
    'SyntaxError'("Can't use void function as initializer", $P3)
 __label_8: # default
.annotate 'line', 7689
    getattribute $P4, self, 'name'
    'SyntaxError'("Invalid var initializer", $P4)
 __label_7: # switch end
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 7693
    __ARG_1.'emitnull'($S2)
 __label_5: # endif
# }
.annotate 'line', 7694

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7638
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7640
    addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7701
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7702
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7703

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7706
    self.'annotate'(__ARG_1)
.annotate 'line', 7707
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7708
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7709
    concat $S3, 'var ', $S1
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 7710
    __ARG_1.'say'('    ', 'new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7711

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7697
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7720
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7721
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7722
    'ExpectOp'(']', __ARG_2)
.annotate 'line', 7723
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7724

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7727
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7728
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7729

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7732
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7733
    self.'annotate'(__ARG_1)
.annotate 'line', 7734
# name: $S2
    getattribute $P1, self, 'name'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7735
# reg: $S3
    getattribute $P1, self, 'reg'
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 7736
    concat $S4, 'var ', $S2
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S3
    __ARG_1.'comment'($S4)
.annotate 'line', 7737
    __ARG_1.'say'('    ', 'new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7738

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7714
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7716
    addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7743
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7744
    'RequireIdentifier'($P1)
.annotate 'line', 7745
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7746
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7747
    $P2 = __ARG_2.'get'()
.annotate 'line', 7748
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 7749
    new $P5, [ 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 7751
    __ARG_2.'unget'($P2)
.annotate 'line', 7752
    new $P4, [ 'FixedVarStatement' ]
    $P4.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7756
    __ARG_2.'unget'($P2)
.annotate 'line', 7757
    new $P4, [ 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
 __label_1: # endif
# }
.annotate 'line', 7759

.end # parseVar


.sub 'parseVolatile'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7763
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7764
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 7765
    'SyntaxError'("invalid volatile type", $P1)
 __label_0: # endif
.annotate 'line', 7766
    .tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7767

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7780
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7781
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7782
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7783
# var t: $P1
    null $P1
 __label_1: # while
.annotate 'line', 7784
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 7785
    __ARG_2.'unget'($P1)
.annotate 'line', 7786
# var c: $P2
    $P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7787
    unless_null $P2, __label_2
.annotate 'line', 7788
    'InternalError'('Unexpected null statement')
 __label_2: # endif
.annotate 'line', 7789
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 7791
    setattribute self, 'end', $P1
# }
.annotate 'line', 7792

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7795
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7796
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7797
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7798
    isnull $I1, $S2
    if $I1 goto __label_2
    iseq $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7799
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
 __label_1: # endif
.annotate 'line', 7800
    .return($S2)
# }
.annotate 'line', 7801

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7804
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7805
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7806
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7807
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7808
    'SyntaxError'('Label already defined', __ARG_1)
 __label_1: # endif
.annotate 'line', 7809
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 7810
    $P1[$S1] = $S3
.annotate 'line', 7811
    .return($S3)
# }
.annotate 'line', 7812

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 7813
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7816
    __ARG_1.'comment'('{')
.annotate 'line', 7817
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 7818
    $P1.'emit'(__ARG_1)
.annotate 'line', 7819
    self.'freetemps'()
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 7821
    __ARG_1.'comment'('}')
# }
.annotate 'line', 7822

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7773
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7775
    addattribute $P0, 'end'
.annotate 'line', 7776
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 7837
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 7839
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 7840
    new $P1, ['ResizableStringArray']
.annotate 'line', 7841
    new $P2, ['ResizableStringArray']
.annotate 'line', 7842
    setattribute self, 'tempreg', $P1
.annotate 'line', 7843
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 7844

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 7847
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 7848
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 7849
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 7850
    assign $P1, $I1
.annotate 'line', 7851
# type: $S2
    getattribute $P2, self, 'type'
    null $S2
    if_null $P2, __label_0
    set $S2, $P2
 __label_0:
.annotate 'line', 7852
    concat $S0, '$', $S2
    concat $S0, $S0, $S1
    set $S1, $S0
.annotate 'line', 7853
    .return($S1)
# }
.annotate 'line', 7854

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 7857
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7858
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7859
# reg: $S1
    null $S1
.annotate 'line', 7860
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_0
.annotate 'line', 7861
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 7863
    $P4 = self.'createreg'()
    set $S1, $P4
 __label_1: # endif
.annotate 'line', 7864
# predefined push
    push $P2, $S1
.annotate 'line', 7865
    .return($S1)
# }
.annotate 'line', 7866

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 7869
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7870
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7871
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 7872
# i: $I2
    sub $I2, $I1, 1
 __label_2: # for condition
    lt $I2, 0, __label_1
# {
.annotate 'line', 7873
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 7874
# predefined push
    push $P1, $S1
# }
 __label_0: # for iteration
.annotate 'line', 7872
    dec $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 7876
    assign $P2, 0
# }
.annotate 'line', 7877

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7831
    addattribute $P0, 'type'
.annotate 'line', 7832
    addattribute $P0, 'nreg'
.annotate 'line', 7833
    addattribute $P0, 'tempreg'
.annotate 'line', 7834
    addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7890
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7891
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = 'typetoregcheck'($P3)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7892
    eq $S1, '', __label_1
.annotate 'line', 7893
    $P1 = __ARG_2.'get'()
    goto __label_2
 __label_1: # else
.annotate 'line', 7895
    set $S1, 'P'
 __label_2: # endif
.annotate 'line', 7896
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 7897
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 7899
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 7900
    $P1 = __ARG_2.'get'()
.annotate 'line', 7901
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7902
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_4
 __label_3: # else
.annotate 'line', 7904
    __ARG_2.'unget'($P1)
 __label_4: # endif
# }
.annotate 'line', 7905

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7908
# paramname: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_0
    set $S1, $P8
 __label_0:
.annotate 'line', 7909
# var param: $P1
    $P1 = __ARG_1.'getvar'($S1)
.annotate 'line', 7910
# ptype: $S2
    $P9 = $P1.'gettype'()
    $P8 = 'typetopirname'($P9)
    null $S2
    if_null $P8, __label_1
    set $S2, $P8
 __label_1:
.annotate 'line', 7911
    $P8 = $P1.'getreg'()
    __ARG_2.'print'('        .param ', $S2, ' ', $P8)
.annotate 'line', 7912
# var modarg: $P2
    getattribute $P2, self, 'modifiers'
.annotate 'line', 7913
    if_null $P2, __label_2
# {
.annotate 'line', 7914
# var named: $P3
    null $P3
.annotate 'line', 7915
# var slurpy: $P4
    null $P4
.annotate 'line', 7916
# var modarglist: $P5
    $P5 = $P2.'getlist'()
.annotate 'line', 7917
    iter $P10, $P5
    set $P10, 0
 __label_3: # for iteration
    unless $P10 goto __label_4
    shift $P6, $P10
# {
.annotate 'line', 7918
# modname: $S3
    $P8 = $P6.'getname'()
    null $S3
    if_null $P8, __label_5
    set $S3, $P8
 __label_5:
.annotate 'line', 7919
    set $S5, $S3
    set $S6, 'named'
    if $S5 == $S6 goto __label_8
    set $S6, 'slurpy'
    if $S5 == $S6 goto __label_9
    goto __label_7
# switch
 __label_8: # case
.annotate 'line', 7921
    set $P3, $P6
    goto __label_6 # break
 __label_9: # case
.annotate 'line', 7924
    set $P4, $P6
    goto __label_6 # break
 __label_7: # default
.annotate 'line', 7927
    __ARG_2.'print'(' :', $S3)
 __label_6: # switch end
# }
    goto __label_3
 __label_4: # endfor
.annotate 'line', 7930
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_12
    isnull $I2, $P4
    not $I2
 __label_12:
    unless $I2 goto __label_10
# {
.annotate 'line', 7935
    __ARG_2.'print'(" :named :slurpy")
# }
    goto __label_11
 __label_10: # else
# {
.annotate 'line', 7938
    if_null $P3, __label_13
# {
.annotate 'line', 7939
# setname: $S4
    null $S4
.annotate 'line', 7940
# nargs: $I1
    $P8 = $P3.'numargs'()
    set $I1, $P8
.annotate 'line', 7941
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_17
    set $I3, 1
    if $I2 == $I3 goto __label_18
    goto __label_16
# switch
 __label_17: # case
.annotate 'line', 7943
    concat $S0, "'", $S1
    concat $S0, $S0, "'"
    set $S4, $S0
    goto __label_15 # break
 __label_18: # case
.annotate 'line', 7946
# var argmod: $P7
    $P7 = $P3.'getarg'(0)
.annotate 'line', 7947
    $P8 = $P7.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_19
.annotate 'line', 7948
    getattribute $P9, __ARG_1, 'start'
    'SyntaxError'('Invalid modifier', $P9)
 __label_19: # endif
.annotate 'line', 7949
    $P11 = $P7.'getPirString'()
    set $S4, $P11
    goto __label_15 # break
 __label_16: # default
.annotate 'line', 7952
    getattribute $P12, __ARG_1, 'start'
    'SyntaxError'('Invalid modifier', $P12)
 __label_15: # switch end
.annotate 'line', 7954
    __ARG_2.'print'(" :named(", $S4, ")")
# }
    goto __label_14
 __label_13: # else
.annotate 'line', 7956
    if_null $P4, __label_20
# {
.annotate 'line', 7957
    __ARG_2.'print'(" :slurpy")
# }
 __label_20: # endif
 __label_14: # endif
# }
 __label_11: # endif
# }
 __label_2: # endif
.annotate 'line', 7961
    __ARG_2.'say'('')
# }
.annotate 'line', 7962

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionParameter' ]
.annotate 'line', 7886
    addattribute $P0, 'name'
.annotate 'line', 7887
    addattribute $P0, 'modifiers'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7988
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7989
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'params', $P2
.annotate 'line', 7990
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 7991
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 7992
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 7993
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 7994
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 7995

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 7997
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8001
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8002
    unless_null $P1, __label_0
# {
.annotate 'line', 8003
    $P1 = self.'generatesubid'()
.annotate 'line', 8004
    setattribute self, 'subid', $P1
# }
 __label_0: # endif
.annotate 'line', 8006
    .return($P1)
# }
.annotate 'line', 8007

.end # makesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8011
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8012
    .return($I1)
# }
.annotate 'line', 8013

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8016
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 8017
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8018
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 8019
    __ARG_1.'unget'($P2)
 __label_1: # do
.annotate 'line', 8020
# {
.annotate 'line', 8021
    new $P4, [ 'FunctionParameter' ]
    $P4.'FunctionParameter'(self, __ARG_1)
    set $P3, $P4
# predefined push
    push $P1, $P3
.annotate 'line', 8022
    $P2 = __ARG_1.'get'()
# }
 __label_3: # continue
.annotate 'line', 8023
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
 __label_2: # enddo
.annotate 'line', 8024
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 8025
    'Expected'("')' or ','", $P2)
 __label_4: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 8027

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8031
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8032
    unless_null $P1, __label_0
.annotate 'line', 8033
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 8035
# predefined push
    push $P1, __ARG_1
 __label_1: # endif
# }
.annotate 'line', 8036

.end # addlocalfunction


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8040
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 8041
    .return(self)
# }
.annotate 'line', 8042

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8046
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8047
    unless_null $P1, __label_0
# {
.annotate 'line', 8048
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8049
    setattribute self, 'usedlexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 8051
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8052

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8055
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8056
    unless_null $P1, __label_0
# {
.annotate 'line', 8057
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8058
    setattribute self, 'lexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 8060
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8061

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8066
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8067
# lexname: $S1
    null $S1
.annotate 'line', 8068
    if_null $P1, __label_0
.annotate 'line', 8069
    set $S1, $P1
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 8071
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 8072
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8073
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8074
    self.'setlex'($S1, $S2)
.annotate 'line', 8075
    __ARG_1.'setlex'($S1)
# }
 __label_1: # endif
.annotate 'line', 8077
    .return($S1)
# }
.annotate 'line', 8078

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8082
# var store: $P1
    null $P1
.annotate 'line', 8083
    set $S2, __ARG_1
    set $S3, 'I'
    if $S2 == $S3 goto __label_2
    set $S3, 'N'
    if $S2 == $S3 goto __label_3
    set $S3, 'S'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 8085
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 8087
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 8089
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 8091
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 8093
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 8095
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 8096
    .return($S1)
# }
.annotate 'line', 8097

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8100
# var store: $P1
    null $P1
.annotate 'line', 8101
    set $S2, __ARG_1
    set $S3, 'I'
    if $S2 == $S3 goto __label_2
    set $S3, 'N'
    if $S2 == $S3 goto __label_3
    set $S3, 'S'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 8103
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 8105
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 8107
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 8109
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 8111
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 8113
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 8114
    .return($S1)
# }
.annotate 'line', 8115

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8118
    root_new $P2, ['parrot';'ResizablePMCArray']
    getattribute $P4, self, 'regstI'
    push $P2, $P4
    getattribute $P5, self, 'regstN'
    push $P2, $P5
    getattribute $P6, self, 'regstS'
    push $P2, $P6
    getattribute $P7, self, 'regstP'
    push $P2, $P7
    iter $P8, $P2
    set $P8, 0
 __label_0: # for iteration
    unless $P8 goto __label_1
    shift $P1, $P8
.annotate 'line', 8119
    $P1.'freetemps'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 8120

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8123
# var nlabel: $P1
    getattribute $P1, self, 'nlabel'
.annotate 'line', 8124
# n: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8125
# s: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, '__label_', $S2
.annotate 'line', 8126
    assign $P1, $I1
.annotate 'line', 8127
    .return($S1)
# }
.annotate 'line', 8128

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8131
    'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 8132

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8135
    'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8136

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8140
# name: $S1
    getattribute $P13, self, 'name'
    null $S1
    if_null $P13, __label_0
    set $S1, $P13
 __label_0:
.annotate 'line', 8141
    __ARG_1.'say'()
.annotate 'line', 8142
    __ARG_1.'print'(".sub ")
.annotate 'line', 8143
    $P13 = self.'isanonymous'()
    if_null $P13, __label_1
    unless $P13 goto __label_1
.annotate 'line', 8144
    __ARG_1.'print'("'' :anon")
    goto __label_2
 __label_1: # else
.annotate 'line', 8146
    __ARG_1.'print'("'", $S1, "'")
 __label_2: # endif
.annotate 'line', 8147
    getattribute $P13, self, 'subid'
    if_null $P13, __label_3
.annotate 'line', 8148
    getattribute $P14, self, 'subid'
    __ARG_1.'print'(" :subid('", $P14, "')")
 __label_3: # endif
.annotate 'line', 8149
    getattribute $P13, self, 'outer'
    if_null $P13, __label_4
# {
.annotate 'line', 8150
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8151
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8152
    if_null $P2, __label_5
.annotate 'line', 8153
    __ARG_1.'print'(" :outer('", $P2, "')")
 __label_5: # endif
# }
 __label_4: # endif
.annotate 'line', 8157
    $P13 = self.'ismethod'()
    if_null $P13, __label_6
    unless $P13 goto __label_6
.annotate 'line', 8158
    __ARG_1.'print'(' :method')
 __label_6: # endif
.annotate 'line', 8159
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8160
    if_null $P3, __label_7
# {
.annotate 'line', 8161
# var mlist: $P4
    $P4 = $P3.'getlist'()
.annotate 'line', 8162
    iter $P15, $P4
    set $P15, 0
 __label_9: # for iteration
    unless $P15 goto __label_10
    shift $P5, $P15
# {
.annotate 'line', 8163
# nargmods: $I1
    $P13 = $P5.'numargs'()
    set $I1, $P13
.annotate 'line', 8164
    $P13 = $P5.'getname'()
    __ARG_1.'print'(' :', $P13)
.annotate 'line', 8165
    le $I1, 0, __label_11
# {
.annotate 'line', 8166
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8167
# iargmod: $I2
    null $I2
 __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 8168
# var argmod: $P6
    $P6 = $P5.'getarg'($I2)
.annotate 'line', 8169
    $P13 = $P6.'isstringliteral'()
    isfalse $I4, $P13
    unless $I4 goto __label_15
.annotate 'line', 8170
    getattribute $P14, $P6, 'start'
    'SyntaxError'('Invalid modifier', $P14)
 __label_15: # endif
.annotate 'line', 8171
    $P13 = $P6.'getPirString'()
    __ARG_1.'print'($P13)
# }
 __label_12: # for iteration
.annotate 'line', 8167
    inc $I2
    goto __label_14
 __label_13: # for end
.annotate 'line', 8173
    __ARG_1.'print'(')')
# }
 __label_11: # endif
# }
    goto __label_9
 __label_10: # endfor
# }
    goto __label_8
 __label_7: # else
# {
.annotate 'line', 8178
    ne $S1, 'main', __label_16
.annotate 'line', 8179
    __ARG_1.'print'(' :main')
 __label_16: # endif
# }
 __label_8: # endif
.annotate 'line', 8181
    __ARG_1.'say'()
.annotate 'line', 8184
    getattribute $P13, self, 'params'
    iter $P16, $P13
    set $P16, 0
 __label_17: # for iteration
    unless $P16 goto __label_18
    shift $P7, $P16
.annotate 'line', 8185
    $P7.'emit'(self, __ARG_1)
    goto __label_17
 __label_18: # endfor
.annotate 'line', 8187
# var lexicals: $P8
    getattribute $P8, self, 'lexicals'
.annotate 'line', 8188
# var usedlexicals: $P9
    getattribute $P9, self, 'usedlexicals'
.annotate 'line', 8189
    isnull $I4, $P8
    not $I4
    if $I4 goto __label_20
    isnull $I4, $P9
    not $I4
 __label_20:
    unless $I4 goto __label_19
# {
.annotate 'line', 8190
    getattribute $P13, self, 'start'
    __ARG_1.'annotate'($P13)
.annotate 'line', 8192
    if_null $P8, __label_21
# {
.annotate 'line', 8194
    iter $P17, $P8
    set $P17, 0
 __label_22: # for iteration
    unless $P17 goto __label_23
    shift $S2, $P17
.annotate 'line', 8195
    $P13 = $P8[$S2]
    __ARG_1.'say'(".lex '", $P13, "', ", $S2)
    goto __label_22
 __label_23: # endfor
# }
 __label_21: # endif
.annotate 'line', 8198
    if_null $P9, __label_24
# {
.annotate 'line', 8200
    iter $P18, $P9
    set $P18, 0
 __label_25: # for iteration
    unless $P18 goto __label_26
    shift $S3, $P18
.annotate 'line', 8201
    $P13 = $P9[$S3]
    __ARG_1.'emitfind_lex'($S3, $P13)
    goto __label_25
 __label_26: # endfor
# }
 __label_24: # endif
# }
 __label_19: # endif
.annotate 'line', 8205
# var body: $P10
    getattribute $P10, self, 'body'
.annotate 'line', 8206
    $P13 = $P10.'isempty'()
    if_null $P13, __label_27
    unless $P13 goto __label_27
.annotate 'line', 8207
    __ARG_1.'comment'('Empty body')
    goto __label_28
 __label_27: # else
# {
.annotate 'line', 8209
    __ARG_1.'comment'('Body')
.annotate 'line', 8210
    $P10.'emit'(__ARG_1)
.annotate 'line', 8211
    $P13 = $P10.'getend'()
    __ARG_1.'annotate'($P13)
# }
 __label_28: # endif
.annotate 'line', 8213
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8216
# var localfun: $P11
    getattribute $P11, self, 'localfun'
.annotate 'line', 8217
    if_null $P11, __label_29
# {
# for loop
.annotate 'line', 8218
# ifn: $I3
    null $I3
 __label_32: # for condition
# predefined elements
    elements $I4, $P11
    ge $I3, $I4, __label_31
# {
.annotate 'line', 8219
# var fn: $P12
    $P12 = $P11[$I3]
.annotate 'line', 8220
    $P12.'emit'(__ARG_1)
# }
 __label_30: # for iteration
.annotate 'line', 8218
    inc $I3
    goto __label_32
 __label_31: # for end
# }
 __label_29: # endif
# }
.annotate 'line', 8223

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 7969
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7971
    addattribute $P0, 'name'
.annotate 'line', 7972
    addattribute $P0, 'subid'
.annotate 'line', 7973
    addattribute $P0, 'modifiers'
.annotate 'line', 7974
    addattribute $P0, 'params'
.annotate 'line', 7975
    addattribute $P0, 'body'
.annotate 'line', 7976
    addattribute $P0, 'regstI'
.annotate 'line', 7977
    addattribute $P0, 'regstN'
.annotate 'line', 7978
    addattribute $P0, 'regstS'
.annotate 'line', 7979
    addattribute $P0, 'regstP'
.annotate 'line', 7980
    addattribute $P0, 'nlabel'
.annotate 'line', 7981
    addattribute $P0, 'localfun'
.annotate 'line', 7982
    addattribute $P0, 'lexicals'
.annotate 'line', 7983
    addattribute $P0, 'usedlexicals'
.annotate 'line', 7984
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8237
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8238
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8239
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8240
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8241

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8243
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8247
# var paramnum: $P1
    getattribute $P1, self, 'paramnum'
.annotate 'line', 8248
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8249
    assign $P1, $I1
.annotate 'line', 8250
    .return($I1)
# }
.annotate 'line', 8251

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8255
# var lexnum: $P1
    getattribute $P1, self, 'lexnum'
.annotate 'line', 8256
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8257
    assign $P1, $I1
.annotate 'line', 8258
    .return($I1)
# }
.annotate 'line', 8259

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8260
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8264
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8265
    setattribute self, 'name', $P1
.annotate 'line', 8266
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8267
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 8268
    new $P7, [ 'ModifierList' ]
    $P7.'ModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 8269
    $P2 = __ARG_1.'get'()
# }
 __label_0: # endif
.annotate 'line', 8271
    'RequireOp'('(', $P2)
.annotate 'line', 8272
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8274
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 8275
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 8277
    new $P5, [ 'StringLiteral' ]
.annotate 'line', 8278
    new $P7, [ 'TokenQuoted' ]
    getattribute $P8, $P1, 'file'
    getattribute $P9, $P1, 'line'
# predefined join
    join $S1, '.', $P3
    $P7.'TokenQuoted'($P8, $P9, $S1)
    set $P6, $P7
    $P5.'StringLiteral'(self, $P6)
    set $P4, $P5
.annotate 'line', 8276
    self.'createconst'('__FUNCTION__', 'S', $P4, '')
.annotate 'line', 8281
    $P2 = __ARG_1.'get'()
.annotate 'line', 8282
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8283
    'ExpectedOp'('{', $P2)
 __label_1: # endif
.annotate 'line', 8284
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 8285
    .return(self)
# }
.annotate 'line', 8286

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8230
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8232
    addattribute $P0, 'paramnum'
.annotate 'line', 8233
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8297
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8298
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8299
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8300
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8301
    setattribute self, 'name', $P1
.annotate 'line', 8302
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8303
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8304
    'RequireOp'('{', $P2)
.annotate 'line', 8305
    new $P5, [ 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8306
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8307

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8308
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8309
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8312
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8313

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8317
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8318

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8322
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8323

.end # getlexnum


.sub 'getvar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8326
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8327
    unless_null $P1, __label_0
# {
.annotate 'line', 8330
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8331
    unless_null $P1, __label_1
# {
.annotate 'line', 8333
    ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 8334
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8335
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 8336
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_5
    set $S1, $P8
 __label_5:
.annotate 'line', 8337
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8338
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 8339
    self.'setusedlex'($S1, $S2)
# }
 __label_4: # endif
# }
 __label_3: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 8343
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_8
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
 __label_8:
    unless $I2 goto __label_7
# {
.annotate 'line', 8344
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8345
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8346
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8347
    isa $I2, $P4, [ 'FunctionBase' ]
    unless $I2 goto __label_9
# {
.annotate 'line', 8348
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_10
    unless $P6 goto __label_10
# {
.annotate 'line', 8349
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_11
    set $S3, $P7
 __label_11:
.annotate 'line', 8350
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8351
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8352
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8353
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 8354
    self.'setusedlex'($S3, $S4)
# }
 __label_10: # endif
# }
 __label_9: # endif
# }
 __label_7: # endif
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 8359
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_14
    isa $I3, $P1, [ 'VarData' ]
    not $I2, $I3
 __label_14:
    unless $I2 goto __label_13
.annotate 'line', 8360
    'InternalError'('Incorrect data for variable in LocalFunction')
 __label_13: # endif
.annotate 'line', 8361
    .return($P1)
# }
.annotate 'line', 8362

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8293
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8373
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8374

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8375
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8369
    get_class $P1, [ 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]
# Constant CLASSSPECIFIER_invalid evaluated at compile time
# Constant CLASSSPECIFIER_str evaluated at compile time
# Constant CLASSSPECIFIER_parrotkey evaluated at compile time
# Constant CLASSSPECIFIER_id evaluated at compile time
.namespace [ 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8392
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8393

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8394
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8398
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8399

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8388
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8407
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8408
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8409

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8410
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8414
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 8415
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8416

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8402
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8404
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8425
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8426
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8427
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8428
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 8429
    'Expected'('literal string', $P2)
 __label_0: # endif
.annotate 'line', 8430
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8431
    $P2 = __ARG_1.'get'()
.annotate 'line', 8432
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8433
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_4
    set $S2, ','
    if $S1 == $S2 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 8435
    box $P5, 1
    setattribute self, 'hll', $P5
 __label_5: # case
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 8439
    'SyntaxError'('Unexpected token in class key', $P2)
 __label_2: # switch end
 __label_6: # do
.annotate 'line', 8441
# {
.annotate 'line', 8442
    $P2 = __ARG_1.'get'()
.annotate 'line', 8443
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_9
.annotate 'line', 8444
    'Expected'('literal string', $P2)
 __label_9: # endif
.annotate 'line', 8445
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
 __label_8: # continue
.annotate 'line', 8446
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_7
    if $P3 goto __label_6
 __label_7: # enddo
.annotate 'line', 8447
    'RequireOp'(']', $P2)
# }
 __label_1: # endif
.annotate 'line', 8449
    setattribute self, 'key', $P1
# }
.annotate 'line', 8450

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8451
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8454
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8455

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8459
    getattribute $P2, self, 'key'
    $P1 = 'getparrotkey'($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8460

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8419
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8421
    addattribute $P0, 'key'
.annotate 'line', 8422
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8468
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8469
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8470
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 8471
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 8472
    $P2 = __ARG_1.'get'()
.annotate 'line', 8473
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 8475
    __ARG_1.'unget'($P2)
.annotate 'line', 8476
    setattribute self, 'key', $P1
# }
.annotate 'line', 8477

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8478
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8482
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8483
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8484

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8488
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8489
    unless_null $P1, __label_0
# {
.annotate 'line', 8490
    $P2 = self.'dowarnings'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8491
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    'Warn'($S2)
 __label_2: # endif
.annotate 'line', 8492
    getattribute $P3, self, 'key'
    $P2 = 'getparrotkey'($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 8494
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
 __label_1: # endif
# }
.annotate 'line', 8495

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8463
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8465
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8500
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8501
    $P2 = $P1.'isstring'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 8502
    new $P4, [ 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_0: # endif
.annotate 'line', 8503
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8504
    new $P4, [ 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_1: # endif
.annotate 'line', 8505
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8506
    new $P4, [ 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_2: # endif
.annotate 'line', 8507
    'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8508

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8526
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8527
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8528
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8529
    setattribute self, 'functions', $P1
.annotate 'line', 8530
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8531
    setattribute self, 'members', $P2
.annotate 'line', 8532
    root_new $P13, ['parrot';'ResizablePMCArray']
    setattribute self, 'bases', $P13
.annotate 'line', 8533
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8534
    setattribute self, 'constants', $P3
.annotate 'line', 8536
# var name: $P4
    $P4 = __ARG_2.'get'()
.annotate 'line', 8537
    setattribute self, 'name', $P4
.annotate 'line', 8538
# var classns: $P5
    $P12 = __ARG_3.'getpath'()
# predefined clone
    clone $P5, $P12
.annotate 'line', 8539
    getattribute $P12, self, 'name'
# predefined push
    push $P5, $P12
.annotate 'line', 8540
    setattribute self, 'classns', $P5
.annotate 'line', 8542
# var t: $P6
    $P6 = __ARG_2.'get'()
.annotate 'line', 8543
    $P12 = $P6.'isop'(':')
    if_null $P12, __label_0
    unless $P12 goto __label_0
# {
.annotate 'line', 8544
# var bases: $P7
    getattribute $P7, self, 'bases'
 __label_2: # Infinite loop
.annotate 'line', 8545
# {
.annotate 'line', 8546
# var base: $P8
    $P8 = 'parseClassSpecifier'(__ARG_2, self)
.annotate 'line', 8547
# predefined push
    push $P7, $P8
.annotate 'line', 8548
    $P6 = __ARG_2.'get'()
.annotate 'line', 8549
    $P12 = $P6.'isop'(',')
    isfalse $I1, $P12
    unless $I1 goto __label_3
    goto __label_1 # break
 __label_3: # endif
# }
    goto __label_2
 __label_1: # Infinite loop end
# }
 __label_0: # endif
.annotate 'line', 8552
    'RequireOp'('{', $P6)
# for loop
.annotate 'line', 8553
    $P6 = __ARG_2.'get'()
 __label_6: # for condition
    $P12 = $P6.'isop'('}')
    isfalse $I1, $P12
    unless $I1 goto __label_5
# {
.annotate 'line', 8554
    $P13 = $P6.'checkkeyword'()
    set $S1, $P13
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'var'
    if $S1 == $S2 goto __label_10
    set $S2, 'const'
    if $S1 == $S2 goto __label_11
    goto __label_8
# switch
 __label_9: # case
.annotate 'line', 8556
# var f: $P9
    new $P9, [ 'MethodStatement' ]
    $P9.'MethodStatement'($P6, __ARG_2, self)
.annotate 'line', 8557
# predefined push
    push $P1, $P9
    goto __label_7 # break
 __label_10: # case
.annotate 'line', 8560
# var name: $P10
    $P10 = __ARG_2.'get'()
.annotate 'line', 8561
    $P14 = $P10.'isidentifier'()
    isfalse $I2, $P14
    unless $I2 goto __label_12
.annotate 'line', 8562
    'Expected'("member identifier", $P10)
 __label_12: # endif
.annotate 'line', 8563
# predefined push
    push $P2, $P10
.annotate 'line', 8564
    $P6 = __ARG_2.'get'()
.annotate 'line', 8565
    $P15 = $P6.'isop'(';')
    isfalse $I3, $P15
    unless $I3 goto __label_13
.annotate 'line', 8566
    'Expected'("';' in member declaration", $P6)
 __label_13: # endif
    goto __label_7 # break
 __label_11: # case
.annotate 'line', 8569
# var cst: $P11
    $P11 = 'parseConst'($P6, __ARG_2, self)
.annotate 'line', 8570
# predefined push
    push $P3, $P11
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 8573
    'SyntaxError'("Unexpected item in class", $P6)
 __label_7: # switch end
# }
 __label_4: # for iteration
.annotate 'line', 8553
    $P6 = __ARG_2.'get'()
    goto __label_6
 __label_5: # for end
# }
.annotate 'line', 8576

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8579
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8580

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8583
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8584

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8587
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8588

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8591
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8592

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8595
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8596

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8599
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8600

.end # use_predef


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8603
    getattribute $P1, self, 'constants'
    'optimize_array'($P1)
.annotate 'line', 8604
    getattribute $P1, self, 'functions'
    'optimize_array'($P1)
.annotate 'line', 8605
    .return(self)
# }
.annotate 'line', 8606

.end # optimize


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 8609
    getattribute $P1, self, 'classns'
    .tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8610

.end # getclasskey


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8613
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8614
    $P5 = 'getparrotnamespacekey'($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 8615
    getattribute $P5, self, 'functions'
    iter $P6, $P5
    set $P6, 0
 __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
.annotate 'line', 8616
    $P2.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 8618
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8620
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8621
# n: $I1
    set $I1, 1
.annotate 'line', 8622
    getattribute $P5, self, 'bases'
    iter $P7, $P5
    set $P7, 0
 __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P3, $P7
# {
.annotate 'line', 8623
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8624
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8625
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8626
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8627
    __ARG_1.'say'()
.annotate 'line', 8628
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
 __label_3: # endfor
.annotate 'line', 8630
    getattribute $P5, self, 'members'
    iter $P8, $P5
    set $P8, 0
 __label_4: # for iteration
    unless $P8 goto __label_5
    shift $P4, $P8
# {
.annotate 'line', 8631
    __ARG_1.'annotate'($P4)
.annotate 'line', 8632
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
 __label_5: # endfor
.annotate 'line', 8635
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8636

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8514
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8516
    addattribute $P0, 'parent'
.annotate 'line', 8517
    addattribute $P0, 'name'
.annotate 'line', 8518
    addattribute $P0, 'bases'
.annotate 'line', 8519
    addattribute $P0, 'constants'
.annotate 'line', 8520
    addattribute $P0, 'functions'
.annotate 'line', 8521
    addattribute $P0, 'members'
.annotate 'line', 8522
    addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8645
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8646
    $P6 = $P1.'isstring'()
    isfalse $I4, $P6
    unless $I4 goto __label_0
.annotate 'line', 8647
    'Expected'('literal string', $P1)
 __label_0: # endif
.annotate 'line', 8648
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 8649
# filename: $S1
    $P6 = $P1.'rawstring'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
 __label_1:
.annotate 'line', 8650
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8655
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 8656
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 8657
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 8658
    iter $P7, $P4
    set $P7, 0
 __label_2: # for iteration
    unless $P7 goto __label_3
    shift $S2, $P7
# {
.annotate 'line', 8659
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 8660
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_4
    push_eh $P6
# try: begin
# {
.annotate 'line', 8661
    $P5.'open'($S3, 'r')
    goto __label_3 # break
.annotate 'line', 8662
# }
# try: end
    pop_eh
    goto __label_5
.annotate 'line', 8660
# catch
 __label_4:
    .get_results($P8)
    finalize $P8
    pop_eh
# catch end
 __label_5:
# }
    goto __label_2
 __label_3: # endfor
.annotate 'line', 8667
    $P6 = $P5.'is_closed'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
.annotate 'line', 8668
    'SyntaxError'('File not found', $P1)
 __label_6: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 8673
# line: $S4
    $P6 = $P5.'readline'()
    null $S4
    if_null $P6, __label_10
    set $S4, $P6
 __label_10:
 __label_9: # for condition
    $P8 = $P5.'eof'()
    isfalse $I4, $P8
    unless $I4 goto __label_8
# {
.annotate 'line', 8674
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_11
# {
.annotate 'line', 8675
# pos: $I1
    set $I1, 12
.annotate 'line', 8676
# c: $S5
    null $S5
 __label_13: # while
.annotate 'line', 8677
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_14
    iseq $I4, $S5, "\t"
 __label_14:
    unless $I4 goto __label_12
.annotate 'line', 8678
    inc $I1
    goto __label_13
 __label_12: # endwhile
.annotate 'line', 8679
# pos2: $I2
    set $I2, $I1
 __label_16: # while
.annotate 'line', 8680
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_20
    isne $I4, $S5, "\t"
 __label_20:
    unless $I4 goto __label_19
.annotate 'line', 8681
    isne $I4, $S5, "\n"
 __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, "\r"
 __label_18:
    unless $I4 goto __label_17
    isne $I4, $S5, ""
 __label_17:
    unless $I4 goto __label_15
.annotate 'line', 8682
    inc $I2
    goto __label_16
 __label_15: # endwhile
.annotate 'line', 8683
    ne $I2, $I1, __label_21
    goto __label_7 # continue
 __label_21: # endif
.annotate 'line', 8685
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
 __label_23: # while
.annotate 'line', 8686
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_24
    iseq $I4, $S5, "\t"
 __label_24:
    unless $I4 goto __label_22
.annotate 'line', 8687
    inc $I2
    goto __label_23
 __label_22: # endwhile
.annotate 'line', 8688
    set $I1, $I2
 __label_26: # while
.annotate 'line', 8689
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_30
    isne $I4, $S5, "\t"
 __label_30:
    unless $I4 goto __label_29
.annotate 'line', 8690
    isne $I4, $S5, "\n"
 __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, "\r"
 __label_28:
    unless $I4 goto __label_27
    isne $I4, $S5, ""
 __label_27:
    unless $I4 goto __label_25
.annotate 'line', 8691
    inc $I2
    goto __label_26
 __label_25: # endwhile
.annotate 'line', 8692
    ne $I2, $I1, __label_31
    goto __label_7 # continue
 __label_31: # endif
.annotate 'line', 8694
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 8696
# ivalue: $I3
    null $I3
.annotate 'line', 8697
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_34
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
 __label_34:
    unless $I4 goto __label_32
.annotate 'line', 8698
# predefined substr
    substr $S10, $S7, 2
    box $P8, $S10
    $P6 = $P8.'to_int'(16)
    set $I3, $P6
    goto __label_33
 __label_32: # else
.annotate 'line', 8700
    set $I3, $S7
 __label_33: # endif
.annotate 'line', 8703
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, __ARG_1, 'file'
    getattribute $P11, __ARG_1, 'line'
    $P9.'TokenInteger'($P10, $P11, $S6)
    set $P8, $P9
.annotate 'line', 8702
    $P6 = 'integerValue'(__ARG_3, $P8, $I3)
.annotate 'line', 8701
    __ARG_3.'createconst'($S6, 'I', $P6, '', 4)
# }
 __label_11: # endif
# }
 __label_7: # for iteration
.annotate 'line', 8673
    $P6 = $P5.'readline'()
    set $S4, $P6
    goto __label_9
 __label_8: # for end
.annotate 'line', 8708
    $P5.'close'()
# }
.annotate 'line', 8709

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8724
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 8725
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 8726
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 8727
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 8728
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 8729

.end # NamespaceBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8732
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 8733

.end # getpath


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8736
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 8737
    iter $P3, $P1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 8738
    getattribute $P4, $P2, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
.annotate 'line', 8739
    .return($P2)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P4
.annotate 'line', 8740
    .return($P4)
# }
.annotate 'line', 8741

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8746
# predefined elements
    elements $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_2
    set $I2, 1
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
    null $P5
.annotate 'line', 8748
    .return($P5)
 __label_3: # case
.annotate 'line', 8751
    $P6 = __ARG_1[0]
    .tailcall self.'checkclass_base'($P6)
 __label_1: # default
.annotate 'line', 8756
# var namespaces: $P1
    getattribute $P1, self, 'namespaces'
.annotate 'line', 8757
# var childkey: $P2
# predefined clone
    clone $P2, __ARG_1
.annotate 'line', 8758
# basename: $S1
    $P7 = $P2.'shift'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 8759
    iter $P8, $P1
    set $P8, 0
 __label_5: # for iteration
    unless $P8 goto __label_6
    shift $P3, $P8
# {
.annotate 'line', 8760
    getattribute $P9, $P3, 'name'
    set $S2, $P9
    ne $S2, $S1, __label_7
# {
.annotate 'line', 8761
# var found: $P4
    $P4 = $P3.'findclasskey'($P2)
.annotate 'line', 8762
    if_null $P4, __label_8
.annotate 'line', 8763
    .return($P4)
 __label_8: # endif
# }
 __label_7: # endif
# }
    goto __label_5
 __label_6: # endfor
 __label_0: # switch end
    null $P5
.annotate 'line', 8767
    .return($P5)
# }
.annotate 'line', 8768

.end # findclasskey_base


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8773
# predefined elements
    elements $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_2
    set $I2, 1
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
    null $P7
.annotate 'line', 8775
    .return($P7)
 __label_3: # case
.annotate 'line', 8777
# name: $S1
    $S1 = __ARG_1[0]
.annotate 'line', 8779
# var sym: $P1
    $P1 = self.'checkclass_base'($S1)
.annotate 'line', 8780
    if_null $P1, __label_4
.annotate 'line', 8781
    .return($P1)
 __label_4: # endif
.annotate 'line', 8782
    getattribute $P8, self, 'functions'
    iter $P9, $P8
    set $P9, 0
 __label_5: # for iteration
    unless $P9 goto __label_6
    shift $P2, $P9
.annotate 'line', 8783
    getattribute $P10, $P2, 'name'
    set $S3, $P10
    ne $S3, $S1, __label_7
.annotate 'line', 8784
    .return($P2)
 __label_7: # endif
    goto __label_5
 __label_6: # endfor
    null $P11
.annotate 'line', 8785
    .return($P11)
 __label_1: # default
.annotate 'line', 8790
# var namespaces: $P3
    getattribute $P3, self, 'namespaces'
.annotate 'line', 8791
# var childkey: $P4
# predefined clone
    clone $P4, __ARG_1
.annotate 'line', 8792
# basename: $S2
    $P12 = $P4.'shift'()
    null $S2
    if_null $P12, __label_8
    set $S2, $P12
 __label_8:
.annotate 'line', 8793
    iter $P13, $P3
    set $P13, 0
 __label_9: # for iteration
    unless $P13 goto __label_10
    shift $P5, $P13
# {
.annotate 'line', 8794
    getattribute $P14, $P5, 'name'
    set $S4, $P14
    ne $S4, $S2, __label_11
# {
.annotate 'line', 8795
# var found: $P6
    $P6 = $P5.'findsymbol'($P4)
.annotate 'line', 8796
    if_null $P6, __label_12
.annotate 'line', 8797
    .return($P6)
 __label_12: # endif
# }
 __label_11: # endif
# }
    goto __label_9
 __label_10: # endfor
 __label_0: # switch end
    null $P7
.annotate 'line', 8801
    .return($P7)
# }
.annotate 'line', 8802

.end # findsymbol


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8805
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8806
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 8807
    $P1 = __ARG_2.'get'()
.annotate 'line', 8809
# var modifier: $P2
    null $P2
.annotate 'line', 8810
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8811
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 8812
    $P1 = __ARG_2.'get'()
# }
 __label_1: # endif
.annotate 'line', 8815
    'RequireOp'('{', $P1)
.annotate 'line', 8816
# var child: $P3
    new $P3, [ 'NamespaceStatement' ]
    $P3.'NamespaceStatement'(self, __ARG_1, $S1, $P2)
.annotate 'line', 8817
    getattribute $P4, self, 'namespaces'
# predefined push
    push $P4, $P3
.annotate 'line', 8818
    getattribute $P4, self, 'items'
# predefined push
    push $P4, $P3
.annotate 'line', 8819
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 8820

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8823
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 8824
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 8825
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 8826
# var t: $P4
    null $P4
# for loop
.annotate 'line', 8827
    $P4 = __ARG_1.'get'()
 __label_2: # for condition
    set $I1, $P4
    unless $I1 goto __label_3
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 8829
    $P9 = $P4.'checkkeyword'()
    set $S2, $P9
    set $S3, 'namespace'
    if $S2 == $S3 goto __label_6
    set $S3, 'const'
    if $S2 == $S3 goto __label_7
    set $S3, 'function'
    if $S2 == $S3 goto __label_8
    set $S3, 'class'
    if $S2 == $S3 goto __label_9
    set $S3, 'using'
    if $S2 == $S3 goto __label_10
    set $S3, '$include_const'
    if $S2 == $S3 goto __label_11
    set $S3, '$load'
    if $S2 == $S3 goto __label_12
    set $S3, '$loadlib'
    if $S2 == $S3 goto __label_13
    goto __label_5
# switch
 __label_6: # case
.annotate 'line', 8831
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 8834
# var cst: $P5
    $P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 8835
# predefined push
    push $P1, $P5
    goto __label_4 # break
 __label_8: # case
.annotate 'line', 8838
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 8839
# predefined push
    push $P2, $P6
.annotate 'line', 8840
# predefined push
    push $P1, $P6
    goto __label_4 # break
 __label_9: # case
.annotate 'line', 8843
# var c: $P7
    new $P7, [ 'ClassStatement' ]
    $P7.'ClassStatement'($P4, __ARG_1, self)
.annotate 'line', 8844
# predefined push
    push $P3, $P7
.annotate 'line', 8845
# predefined push
    push $P1, $P7
    goto __label_4 # break
 __label_10: # case
.annotate 'line', 8848
    $P4 = __ARG_1.'get'()
.annotate 'line', 8849
    $P10 = $P4.'iskeyword'('extern')
    isfalse $I2, $P10
    unless $I2 goto __label_14
.annotate 'line', 8850
    'SyntaxError'('Unsupported at namespace level', $P4)
 __label_14: # endif
.annotate 'line', 8851
    $P4 = __ARG_1.'get'()
.annotate 'line', 8852
    $P11 = $P4.'isstring'()
    isfalse $I3, $P11
    unless $I3 goto __label_15
.annotate 'line', 8853
    'Expected'('string literal', $P4)
 __label_15: # endif
.annotate 'line', 8854
# reqlib: $S1
    set $P12, $P4
    null $S1
    if_null $P12, __label_16
    set $S1, $P12
 __label_16:
.annotate 'line', 8855
    self.'addlib'($S1)
.annotate 'line', 8856
    'ExpectOp'(';', __ARG_1)
    goto __label_4 # break
 __label_11: # case
.annotate 'line', 8859
    'include_parrot'($P4, __ARG_1, self)
    goto __label_4 # break
 __label_12: # case
.annotate 'line', 8862
    $P4 = __ARG_1.'get'()
.annotate 'line', 8863
    $P13 = $P4.'isstring'()
    isfalse $I4, $P13
    unless $I4 goto __label_17
.annotate 'line', 8864
    'Expected'('string literal', $P4)
 __label_17: # endif
.annotate 'line', 8865
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 8866
    new $P16, [ 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P4)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addload'($P14)
    goto __label_4 # break
 __label_13: # case
.annotate 'line', 8869
    $P4 = __ARG_1.'get'()
.annotate 'line', 8870
    $P17 = $P4.'isstring'()
    isfalse $I5, $P17
    unless $I5 goto __label_18
.annotate 'line', 8871
    'Expected'('string literal', $P4)
 __label_18: # endif
.annotate 'line', 8872
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 8873
    new $P20, [ 'StringLiteral' ]
    $P20.'StringLiteral'(self, $P4)
    set $P19, $P20
    $P18 = $P19.'getPirString'()
    self.'addlib'($P18)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 8876
    'SyntaxError'("Unexpected token", $P4)
 __label_4: # switch end
# }
 __label_0: # for iteration
.annotate 'line', 8827
    $P4 = __ARG_1.'get'()
    goto __label_2
 __label_1: # for end
.annotate 'line', 8879
    if_null $P4, __label_19
    unless $P4 goto __label_19
.annotate 'line', 8880
    self.'close_ns'($P4)
    goto __label_20
 __label_19: # else
.annotate 'line', 8882
    self.'unclosed_ns'()
 __label_20: # endif
# }
.annotate 'line', 8883

.end # parse


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 8886
    getattribute $P1, self, 'items'
    'optimize_array'($P1)
# }
.annotate 'line', 8887

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8890
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 8891
# s: $S1
    $P3 = 'getparrotnamespacekey'($P1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 8893
# activate: $I1
    set $I1, 1
.annotate 'line', 8894
    getattribute $P3, self, 'items'
    iter $P4, $P3
    set $P4, 0
 __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8895
    isa $I2, $P2, [ 'NamespaceStatement' ]
    if $I2 goto __label_5
.annotate 'line', 8896
    isa $I2, $P2, [ 'ClassStatement' ]
 __label_5:
    unless $I2 goto __label_3
.annotate 'line', 8897
    set $I1, 1
    goto __label_4
 __label_3: # else
.annotate 'line', 8899
    unless $I1 goto __label_6
# {
.annotate 'line', 8900
    __ARG_1.'say'($S1)
.annotate 'line', 8901
    null $I1
# }
 __label_6: # endif
 __label_4: # endif
.annotate 'line', 8903
    $P2.'emit'(__ARG_1)
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 8905

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8713
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 8715
    addattribute $P0, 'nspath'
.annotate 'line', 8716
    addattribute $P0, 'namespaces'
.annotate 'line', 8717
    addattribute $P0, 'classes'
.annotate 'line', 8718
    addattribute $P0, 'functions'
.annotate 'line', 8719
    addattribute $P0, 'items'
.annotate 'line', 8720
    addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8923
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8924
# predefined push
    push $P1, __ARG_3
.annotate 'line', 8925
    self.'NamespaceBase'($P1)
.annotate 'line', 8927
    setattribute self, 'parent', __ARG_1
.annotate 'line', 8928
    setattribute self, 'start', __ARG_2
.annotate 'line', 8929
    setattribute self, 'owner', __ARG_1
.annotate 'line', 8930
    box $P2, __ARG_3
    setattribute self, 'name', $P2
.annotate 'line', 8931
    setattribute self, 'modifier', __ARG_4
.annotate 'line', 8932
    if_null __ARG_4, __label_0
# {
.annotate 'line', 8933
    $P2 = __ARG_4.'pick'('HLL')
    if_null $P2, __label_1
.annotate 'line', 8934
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
 __label_1: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 8936

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 8939
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8940

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8943
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8944

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8947
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8948

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8951
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 8952

.end # addlib


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8955
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 8956

.end # addlib


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8959
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 8960
    unless_null $P1, __label_0
.annotate 'line', 8961
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 8963
    .return($P1)
 __label_1: # endif
# }
.annotate 'line', 8964

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8969
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 8970
    unless_null $P1, __label_0
.annotate 'line', 8971
    getattribute $P2, self, 'parent'
    $P1 = $P2.'findclasskey'(__ARG_1)
 __label_0: # endif
.annotate 'line', 8972
    .return($P1)
# }
.annotate 'line', 8973

.end # findclasskey


.sub 'unclosed_ns' :method
# Body
# {
.annotate 'line', 8976
    getattribute $P1, self, 'start'
    'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 8977

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8984
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 8985
    if_null $P1, __label_0
# {
.annotate 'line', 8986
    $P1 = $P1.'optimize'()
.annotate 'line', 8987
    setattribute self, 'modifier', $P1
# }
 __label_0: # endif
.annotate 'line', 8989
    self.'optimize_base'()
.annotate 'line', 8990
    .return(self)
# }
.annotate 'line', 8991

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8994
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 8995
    if_null $P1, __label_0
.annotate 'line', 8996
    __ARG_1.'say'(".HLL '", $P1, "'")
 __label_0: # endif
.annotate 'line', 8998
    self.'emit_base'(__ARG_1)
.annotate 'line', 9000
    if_null $P1, __label_1
.annotate 'line', 9001
    __ARG_1.'say'(".HLL 'parrot'")
 __label_1: # endif
# }
.annotate 'line', 9002

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 8912
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 8914
    addattribute $P0, 'parent'
.annotate 'line', 8915
    addattribute $P0, 'start'
.annotate 'line', 8916
    addattribute $P0, 'name'
.annotate 'line', 8917
    addattribute $P0, 'modifier'
.annotate 'line', 8918
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9019
    new $P1, ['ResizableStringArray']
.annotate 'line', 9020
    self.'NamespaceBase'($P1)
.annotate 'line', 9021
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9022
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9023
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9024

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9027
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9028
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9029

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9032
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9033
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_1
    null $I1
    goto __label_0
 __label_1:
    set $I1, 1
 __label_0:
    .return($I1)
# }
.annotate 'line', 9034

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9038
# var subidgen: $P1
    getattribute $P1, self, 'subidgen'
.annotate 'line', 9039
# idgen: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 9040
    inc $I1
.annotate 'line', 9041
    assign $P1, $I1
.annotate 'line', 9042
# id: $S1
# predefined string
    set $S2, $I1
    concat $S1, 'WSubId_', $S2
.annotate 'line', 9043
    .return($S1)
# }
.annotate 'line', 9044

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9048
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9049
    unless_null $P1, __label_0
# {
.annotate 'line', 9050
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 9051
    setattribute self, 'libs', $P1
# }
 __label_0: # endif
.annotate 'line', 9053
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9054

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9057
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9058
    unless_null $P1, __label_0
# {
.annotate 'line', 9059
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 9060
    setattribute self, 'loads', $P1
# }
 __label_0: # endif
.annotate 'line', 9062
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9063

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9066
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9067

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9071
    .tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 9072

.end # findclasskey


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9079
    'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9080

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9083
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9084

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9087
    self.'optimize_base'()
.annotate 'line', 9088
    .return(self)
# }
.annotate 'line', 9089

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9092
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9095
    $P5 = $P1['chomp']
    if_null $P5, __label_0
.annotate 'line', 9096
    self.'addload'('"String/Utils.pbc"')
 __label_0: # endif
.annotate 'line', 9099
    new $P2, ['ResizableStringArray']
    set $P2, 9
    set $S4, 'acos'
    $P2[0] = $S4
    set $S4, 'asin'
    $P2[1] = $S4
    set $S4, 'atan'
    $P2[2] = $S4
    set $S4, 'cos'
    $P2[3] = $S4
    set $S4, 'exp'
    $P2[4] = $S4
    set $S4, 'ln'
    $P2[5] = $S4
    set $S4, 'sin'
    $P2[6] = $S4
    set $S4, 'tan'
    $P2[7] = $S4
    set $S4, 'pow'
    $P2[8] = $S4
.annotate 'line', 9102
    iter $P6, $P2
    set $P6, 0
 __label_1: # for iteration
    unless $P6 goto __label_2
    shift $S1, $P6
.annotate 'line', 9103
    $P5 = $P1[$S1]
    if_null $P5, __label_3
# {
.annotate 'line', 9104
    self.'addlib'("'trans_ops'")
    goto __label_2 # break
.annotate 'line', 9105
# }
 __label_3: # endif
    goto __label_1
 __label_2: # endfor
.annotate 'line', 9108
# somelib: $I1
    null $I1
.annotate 'line', 9109
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9110
    if_null $P3, __label_4
# {
.annotate 'line', 9111
    set $I1, 1
.annotate 'line', 9112
    iter $P7, $P3
    set $P7, 0
 __label_5: # for iteration
    unless $P7 goto __label_6
    shift $S2, $P7
.annotate 'line', 9113
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_5
 __label_6: # endfor
# }
 __label_4: # endif
.annotate 'line', 9116
# someload: $I2
    null $I2
.annotate 'line', 9117
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9118
    if_null $P4, __label_7
# {
.annotate 'line', 9119
    set $I2, 1
.annotate 'line', 9120
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9121
    iter $P8, $P4
    set $P8, 0
 __label_8: # for iteration
    unless $P8 goto __label_9
    shift $S3, $P8
.annotate 'line', 9122
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_8
 __label_9: # endfor
.annotate 'line', 9123
    __ARG_1.'print'(".end\n\n")
# }
 __label_7: # endif
.annotate 'line', 9125
    or $I3, $I1, $I2
    unless $I3 goto __label_10
.annotate 'line', 9126
    __ARG_1.'comment'('end libs')
 __label_10: # endif
.annotate 'line', 9128
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9129

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9132
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9133
    iter $P4, $P1
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $S1, $P4
# {
.annotate 'line', 9134
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9135
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_4
.annotate 'line', 9136
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
 __label_4:
    if $I1 goto __label_3
.annotate 'line', 9137
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
 __label_3:
    unless $I1 goto __label_2
    goto __label_0 # continue
 __label_2: # endif
.annotate 'line', 9139
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9140
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 9142

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 9009
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9011
    addattribute $P0, 'unit'
.annotate 'line', 9012
    addattribute $P0, 'predefs_used'
.annotate 'line', 9013
    addattribute $P0, 'libs'
.annotate 'line', 9014
    addattribute $P0, 'loads'
.annotate 'line', 9015
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 9158
    box $P3, 1
    setattribute self, 'warnings', $P3
.annotate 'line', 9159
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9162
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9166
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9165
    $P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 9164
    $P1.'createconst'('false', 'I', $P3, '', 4)
.annotate 'line', 9170
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9169
    $P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 9168
    $P1.'createconst'('true', 'I', $P3, '', 4)
.annotate 'line', 9176
    new $P4, [ 'StringLiteral' ]
.annotate 'line', 9177
    new $P6, [ 'TokenQuoted' ]
    getattribute $P7, $P2, 'file'
    getattribute $P8, $P2, 'line'
# predefined string
# predefined int
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
    $P6.'TokenQuoted'($P7, $P8, $S1)
    set $P5, $P6
    $P4.'StringLiteral'($P1, $P5)
    set $P3, $P4
.annotate 'line', 9175
    $P1.'createconst'('__STAGE__', 'S', $P3, '', 4)
.annotate 'line', 9180
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9181

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9184
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9185

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9188
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9189

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9192
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
# }
.annotate 'line', 9193

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9196
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9197

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9200
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9201
    __ARG_1.'say'('')
.annotate 'line', 9203
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9205
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9206

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9209
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9210
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9212
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9214
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9215

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 9153
    addattribute $P0, 'rootns'
.annotate 'line', 9154
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9224
    set $S2, __ARG_2
    ne $S2, 'parse', __label_0
.annotate 'line', 9225
    .return(__ARG_1)
 __label_0: # endif
.annotate 'line', 9226
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9227
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9228
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9229
    if_null __ARG_3, __label_1
    unless __ARG_3 goto __label_1
.annotate 'line', 9230
    $P2.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9231
    __ARG_1.'emit'($P2)
.annotate 'line', 9232
    $P2.'close'()
.annotate 'line', 9233
    $P1.'close'()
.annotate 'line', 9234
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 9235
# var object: $P3
    null $P3
.annotate 'line', 9236
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_5
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_6
    set $S3, ''
    if $S2 == $S3 goto __label_7
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 9238
    new $P3, [ 'String' ]
.annotate 'line', 9239
    assign $P3, $S1
    goto __label_3 # break
 __label_6: # case
 __label_7: # case
.annotate 'line', 9243
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9244
    $P3 = $P4($S1)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 9245
# predefined die
.annotate 'line', 9247
    die 'Invalid target'
 __label_3: # switch end
.annotate 'line', 9249
    .return($P3)
# }
.annotate 'line', 9250

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9253
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9254
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9255
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9256
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9257
    $P2.'close'()
.annotate 'line', 9258
    $P1.'close'()
.annotate 'line', 9259
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9260

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9266
    unless_null __ARG_2, __label_0
.annotate 'line', 9267
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9268
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9269
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9270
    $P1.'puts'(__ARG_1)
.annotate 'line', 9271
    $P1.'close'()
.annotate 'line', 9272
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9273
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9274
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9275
    unless __ARG_4 goto __label_1
.annotate 'line', 9276
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9277
    $P3.'parse'($P2)
.annotate 'line', 9278
    $P1.'close'()
.annotate 'line', 9279
    $P3.'optimize'()
.annotate 'line', 9280
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 9281

.end # compile


.sub 'compile_from_file_to_pir' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9286
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9287
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9288
    $P1.'encoding'('utf8')
.annotate 'line', 9289
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9290
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9291
    unless __ARG_4 goto __label_0
.annotate 'line', 9292
    $P3.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9293
    $P3.'parse'($P2)
.annotate 'line', 9294
    $P1.'close'()
.annotate 'line', 9295
    $P3.'optimize'()
.annotate 'line', 9296
# var emit: $P4
    new $P4, [ 'Emit' ]
    $P4.'Emit'(__ARG_2)
.annotate 'line', 9297
    unless __ARG_3 goto __label_1
.annotate 'line', 9298
    $P4.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9299
    $P3.'emit'($P4)
.annotate 'line', 9300
    $P4.'close'()
# }
.annotate 'line', 9301

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9307
    unless_null __ARG_2, __label_0
.annotate 'line', 9308
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9309
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9310
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9311
    $P1.'encoding'('utf8')
.annotate 'line', 9312
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9313
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9314
    unless __ARG_4 goto __label_1
.annotate 'line', 9315
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9316
    $P3.'parse'($P2)
.annotate 'line', 9317
    $P1.'close'()
.annotate 'line', 9318
    $P3.'optimize'()
.annotate 'line', 9319
    ne __ARG_2, 'include', __label_2
# {
.annotate 'line', 9320
    .tailcall self.'__private_geninclude'($P3)
# }
    goto __label_3
 __label_2: # else
.annotate 'line', 9323
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
 __label_3: # endif
# }
.annotate 'line', 9324

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
        .param int __ARG_4
        .param int __ARG_5
# Body
# {
.annotate 'line', 9332
# var winxed: $P1
    new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 9333
    not $I1, __ARG_3
    unless $I1 goto __label_0
.annotate 'line', 9334
    $P1.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9335
    $P1.'parse'(__ARG_1)
.annotate 'line', 9337
    $P1.'optimize'()
.annotate 'line', 9339
# var handle: $P2
    null $P2
.annotate 'line', 9340
    ne __ARG_2, '-', __label_1
.annotate 'line', 9341
# predefined getstdout
    getstdout $P2
    goto __label_2
 __label_1: # else
.annotate 'line', 9343
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'(__ARG_2,'w')
 __label_2: # endif
.annotate 'line', 9344
# var emit: $P3
    new $P3, [ 'Emit' ]
    $P3.'Emit'($P2)
.annotate 'line', 9345
    unless __ARG_4 goto __label_3
.annotate 'line', 9346
    $P3.'disable_annotations'()
 __label_3: # endif
.annotate 'line', 9347
    unless __ARG_5 goto __label_4
.annotate 'line', 9348
    $P1.'emitinclude'($P3)
    goto __label_5
 __label_4: # else
.annotate 'line', 9350
    $P1.'emit'($P3)
 __label_5: # endif
.annotate 'line', 9351
    $P3.'close'()
.annotate 'line', 9352
    $P2.'close'()
# }
.annotate 'line', 9353

.end # winxed_parser


.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9361
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9362
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9363

.end # initializer

.namespace [ 'Options' ]

.sub 'Options' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9372
    load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 9373
# var getopts: $P1
    new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 9374
    $P1.'notOptStop'(1)
.annotate 'line', 9375
    $P1.'push_string'('o=s')
.annotate 'line', 9376
    $P1.'push_string'('e=s')
.annotate 'line', 9377
    $P1.'push_string'('geninclude')
.annotate 'line', 9378
    $P1.'push_string'('noan')
.annotate 'line', 9379
    $P1.'push_string'('nowarn')
.annotate 'line', 9380
    $P1.'notOptStop'(1)
.annotate 'line', 9381
    __ARG_1.'shift'()
.annotate 'line', 9382
# var opts: $P2
    $P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 9383
    setattribute self, 'getopts', $P1
.annotate 'line', 9384
    setattribute self, 'opts', $P2
# }
.annotate 'line', 9385

.end # Options


.sub 'getbool' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9388
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9389
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9390
    isnull $I1, $P2
    not $I1
    .return($I1)
# }
.annotate 'line', 9391

.end # getbool


.sub 'getstring' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 9394
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9395
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9396
    if_null $P2, __label_1
# predefined string
    set $S1, $P2
    goto __label_0
 __label_1:
    set $S1, __ARG_2
 __label_0:
    .return($S1)
# }
.annotate 'line', 9397

.end # getstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Options' ]
.annotate 'line', 9367
    addattribute $P0, 'getopts'
.annotate 'line', 9368
    addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'stage1'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9402
# var options: $P1
    new $P1, [ 'Options' ]
    $P1.'Options'(__ARG_1)
.annotate 'line', 9403
# outputfile: $S1
    $P4 = $P1.'getstring'('o', '')
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 9404
# expr: $S2
    $P4 = $P1.'getstring'('e')
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 9405
# noan: $I1
    $P4 = $P1.'getbool'('noan')
    set $I1, $P4
.annotate 'line', 9406
# warn: $I2
    $P4 = $P1.'getbool'('nowarn')
    isfalse $I2, $P4
.annotate 'line', 9407
# geninclude: $I3
    $P4 = $P1.'getbool'('geninclude')
    set $I3, $P4
.annotate 'line', 9409
# argc: $I4
    set $P4, __ARG_1
    set $I4, $P4
.annotate 'line', 9410
# filename: $S3
    null $S3
.annotate 'line', 9411
# var file: $P2
    null $P2
.annotate 'line', 9412
    unless_null $S2, __label_2
# {
.annotate 'line', 9413
    ne $I4, 0, __label_4
# predefined Error
.annotate 'line', 9414
    root_new $P4, ['parrot';'Exception']
    $P4['message'] = 'No file'
    throw $P4
 __label_4: # endif
.annotate 'line', 9416
    $S3 = __ARG_1[0]
.annotate 'line', 9417
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'($S3)
.annotate 'line', 9418
    $P2.'encoding'('utf8')
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 9421
    concat $S0, 'function main[main](argv){', $S2
    concat $S0, $S0, ';}'
    set $S2, $S0
.annotate 'line', 9422
    new $P2, [ 'StringHandle' ]
.annotate 'line', 9423
    $P2.'open'('__eval__', 'w')
.annotate 'line', 9424
    $P2.'puts'($S2)
.annotate 'line', 9425
    $P2.'close'()
.annotate 'line', 9426
    $P2.'open'('__eval__')
.annotate 'line', 9427
    set $S3, '__eval__'
# }
 __label_3: # endif
.annotate 'line', 9430
# var t: $P3
    new $P3, [ 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S3)
.annotate 'line', 9432
    'winxed_parser'($P3, $S1, $I2, $I1, $I3)
.annotate 'line', 9434
    $P2.'close'()
# }
.annotate 'line', 9435

.end # stage1


.sub 'show_backtrace'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9439
# i: $I1
    set $I1, 1
.annotate 'line', 9440
    iter $P4, __ARG_1
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
.annotate 'line', 9441
# var sub: $P2
    $P2 = $P1['sub']
.annotate 'line', 9442
# subname: $S1
    null $S1
.annotate 'line', 9443
    if_null $P2, __label_2
# {
.annotate 'line', 9444
    set $S1, $P2
.annotate 'line', 9445
# ns: $S2
    $P5 = $P2.'get_namespace'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 9446
    isne $I3, $S2, ''
    unless $I3 goto __label_5
    isne $I3, $S2, 'parrot'
 __label_5:
    unless $I3 goto __label_4
.annotate 'line', 9447
    concat $S0, $S2, '.'
    concat $S0, $S0, $S1
    set $S1, $S0
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 9449
# var ann: $P3
    $P3 = $P1['annotations']
.annotate 'line', 9450
# file: $S3
    $S3 = $P3['file']
.annotate 'line', 9451
    eq $S3, '', __label_6
# {
.annotate 'line', 9452
# line: $I2
    $I2 = $P3['line']
.annotate 'line', 9453
    set $I4, $I1
    inc $I1
    mul $I3, 2, $I4
    repeat $S4, ' ', $I3
# predefined cry
    getstderr $P0
    print $P0, $S4
    print $P0, "at "
    print $P0, $S1
    print $P0, " in '"
    print $P0, $S3
    print $P0, "' line "
    print $P0, $I2
    print $P0, "\n"
# }
 __label_6: # endif
# }
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 9456

.end # show_backtrace


.sub 'main' :main
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9460
# retval: $I1
    null $I1
.annotate 'line', 9461
# try: create handler
    new $P2, 'ExceptionHandler'
    set_label $P2, __label_0
    $P2.'min_severity'(2)
    $P2.'max_severity'(2)
    $P2.'handle_types'(555, 556, 557)
    push_eh $P2
# try: begin
.annotate 'line', 9467
    'stage1'(__ARG_1)
# try: end
    pop_eh
    goto __label_1
.annotate 'line', 9461
# catch
 __label_0:
    .get_results($P1)
    finalize $P1
    pop_eh
# {
.annotate 'line', 9470
# msg: $S1
    $S1 = $P1['message']
.annotate 'line', 9471
# type: $I2
    $I2 = $P1['type']
.annotate 'line', 9472
    set $I3, $I2
    set $I4, 556
    if $I3 == $I4 goto __label_4
    set $I4, 557
    if $I3 == $I4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
 __label_5: # case
.annotate 'line', 9475
# predefined cry
    getstderr $P0
    print $P0, 'Error: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9476
    set $I1, 1
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 9479
# predefined cry
    getstderr $P0
    print $P0, 'INTERNAL ERROR: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9480
    $P2 = $P1.'backtrace'()
    'show_backtrace'($P2)
.annotate 'line', 9481
    set $I1, 2
 __label_2: # switch end
# }
# catch end
 __label_1:
.annotate 'line', 9484
# predefined exit
    exit $I1
# }
.annotate 'line', 9485

.end # main

# End generated code
