# Begin generated code

.namespace [ ]

.sub 'isspace' :subid('WSubId_11')
        .param string __ARG_1
# Body
# {
.annotate 'file', 'winxedst1.winxed'
.annotate 'line', 13
    iseq $I1, __ARG_1, ' '
    if $I1 goto __label_2
    iseq $I1, __ARG_1, "\n"
  __label_2:
    if $I1 goto __label_1
    iseq $I1, __ARG_1, "\t"
  __label_1:
    .return($I1)
# }
.annotate 'line', 14

.end # isspace


.sub 'isdigit' :subid('WSubId_9')
        .param string __ARG_1
# Body
# {
.annotate 'line', 18
# predefined indexof
.annotate 'line', 17
    index $I2, '0123456789', __ARG_1
.annotate 'line', 18
    isgt $I1, $I2, -1
    .return($I1)
# }
.annotate 'line', 19

.end # isdigit


.sub 'hexdigit' :subid('WSubId_10')
        .param string __ARG_1
# Body
# {
.annotate 'line', 23
# i: $I1
# predefined indexof
    index $I1, '0123456789abcdef0123456789ABCDEF', __ARG_1
.annotate 'line', 24
    lt $I1, 0, __label_1
    mod $I1, $I1, 16
  __label_1: # endif
.annotate 'line', 25
    .return($I1)
# }
.annotate 'line', 26

.end # hexdigit


.sub 'isidentstart' :subid('WSubId_12')
        .param string __ARG_1
# Body
# {
.annotate 'line', 33
# predefined indexof
.annotate 'line', 29
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', __ARG_1
.annotate 'line', 33
    isgt $I1, $I2, -1
.annotate 'line', 30
    .return($I1)
# }
.annotate 'line', 34

.end # isidentstart


.sub 'isident' :subid('WSubId_8')
        .param string __ARG_1
# Body
# {
.annotate 'line', 42
# predefined indexof
.annotate 'line', 37
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

.sub 'Warn' :subid('WSubId_54')
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
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 61
    $P1.'print'(' near ')
.annotate 'line', 62
    $P2 = __ARG_2.'show'()
    $P1.'print'($P2)
# }
  __label_1: # endif
.annotate 'line', 64
    $P1.'print'("\n")
# }
.annotate 'line', 65

.end # Warn


.sub 'InternalError' :subid('WSubId_6')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 69
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 70
# desc: $S1
    $P1 = __ARG_2.'show'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 71
    concat $S0, __ARG_1, ' near '
    concat $S0, $S0, $S1
    set __ARG_1, $S0
# }
  __label_1: # endif
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


.sub 'TokenError' :subid('WSubId_7')
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


.sub 'SyntaxError' :subid('WSubId_1')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 84
# sline: $S1
    getattribute $P1, __ARG_2, 'line'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 85
# file: $S2
    getattribute $P1, __ARG_2, 'file'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 86
# desc: $S3
    $P1 = __ARG_2.'viewable'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
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


.sub 'Expected' :subid('WSubId_29')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 93
    concat $S1, "Expected ", __ARG_1
    $P1($S1, __ARG_2)
# }
.annotate 'line', 94

.end # Expected


.sub 'Unexpected' :subid('WSubId_31')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 98
    concat $S1, "Unexpected ", __ARG_1
    $P1($S1, __ARG_2)
# }
.annotate 'line', 99

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_3')
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 103
    $P1("Expected identifier", __ARG_1)
# }
.annotate 'line', 104

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_2')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 108
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    $P1($S1, __ARG_2)
# }
.annotate 'line', 109

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_4')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 113
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_2'
.annotate 'line', 114
    $P2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 115

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_5')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 119
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_2'
.annotate 'line', 120
    $P2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 121

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_79')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 125
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_3'
.annotate 'line', 126
    $P2(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 127

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_43')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 131
# var t: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P2 = 'WSubId_4'
.annotate 'line', 132
    $P2(__ARG_1, $P1)
# }
.annotate 'line', 133

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_81')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 137
# var t: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P2 = 'WSubId_5'
.annotate 'line', 138
    $P2(__ARG_1, $P1)
# }
.annotate 'line', 139

.end # ExpectKeyword

.namespace [ 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 151
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 152
    box $P1, __ARG_2
    setattribute self, 'line', $P1
# }
.annotate 'line', 153

.end # Token


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 156
    .return(1)
# }
.annotate 'line', 157

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 160
    .return(1)
# }
.annotate 'line', 161

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 163
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 164
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 165
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method
# Body
# {
.annotate 'line', 166
    .return(0)
# }

.end # isint


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 167
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method
# Body
# {
.annotate 'line', 168
    .return(0)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 172
    $P1('Not a literal string', self)
# }
.annotate 'line', 173

.end # rawstring


.sub 'getidentifier' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_3'
.annotate 'line', 176
    $P1(self)
# }
.annotate 'line', 177

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 178
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 179
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 180
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 181
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 182
    .return('(unknown)')
# }

.end # viewable


.sub 'show' :method
# Body
# {
.annotate 'line', 185
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 186
# predefined string
    getattribute $P1, self, 'file'
.annotate 'line', 184
    set $S2, $P1
# predefined string
.annotate 'line', 186
    getattribute $P2, self, 'line'
.annotate 'line', 184
    set $S3, $P2
.annotate 'line', 186
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
# }
.annotate 'line', 187

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Token' ]
.annotate 'line', 147
    addattribute $P0, 'file'
.annotate 'line', 148
    addattribute $P0, 'line'
.end
.namespace [ 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 194
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 195

.end # TokenEof


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 198
    .return(0)
# }
.annotate 'line', 199

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 202
    .return(0)
# }
.annotate 'line', 203

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 204
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 205
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenEof' ]
.annotate 'line', 190
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
.annotate 'line', 213
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 214
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 215

.end # TokenWithVal


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 216
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
# Body
# {
.annotate 'line', 219
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 220

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenWithVal' ]
.annotate 'line', 208
    get_class $P1, [ 'Token' ]
    addparent $P0, $P1
.annotate 'line', 210
    addattribute $P0, 'str'
.end
.namespace [ 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 227
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 228

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 229
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenComment' ]
.annotate 'line', 223
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
.annotate 'line', 236
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 237

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 240
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 241

.end # isop


.sub 'checkop' :method
# Body
# {
# predefined string
.annotate 'line', 244
    getattribute $P1, self, 'str'
.annotate 'line', 243
    set $S1, $P1
.annotate 'line', 244
    .return($S1)
# }
.annotate 'line', 245

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenOp' ]
.annotate 'line', 232
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
.annotate 'line', 252
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 253

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 254
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 257
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 258

.end # getidentifier


.sub 'checkkeyword' :method
# Body
# {
# predefined string
.annotate 'line', 261
    getattribute $P1, self, 'str'
.annotate 'line', 260
    set $S1, $P1
.annotate 'line', 261
    .return($S1)
# }
.annotate 'line', 262

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 265
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 266

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenIdentifier' ]
.annotate 'line', 248
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenString' ]

.sub 'isstring' :method
# Body
# {
.annotate 'line', 271
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 274
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 275

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenString' ]
.annotate 'line', 269
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
.annotate 'line', 282
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 283

.end # TokenQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 286
    getattribute $P1, self, 'str'
.annotate 'line', 285
    set $S1, $P1
.annotate 'line', 286
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 287

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 290
    getattribute $P1, self, 'str'
.annotate 'line', 289
    set $S1, $P1
.annotate 'line', 290
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 291

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 294
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 295

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenQuoted' ]
.annotate 'line', 278
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
.annotate 'line', 302
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 303

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 306
    getattribute $P1, self, 'str'
.annotate 'line', 305
    set $S1, $P1
.annotate 'line', 306
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 307

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 310
    getattribute $P1, self, 'str'
.annotate 'line', 309
    set $S1, $P1
.annotate 'line', 310
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 311

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 314
# s: $S1
    set $S1, ''
.annotate 'line', 315
    getattribute $P1, self, 'str'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S2, $P2
# {
# switch
.annotate 'line', 316
    set $S3, $S2
    set $S4, '"'
    if $S3 == $S4 goto __label_5
    set $S4, '\'
    if $S3 == $S4 goto __label_6
    set $S4, "'"
    if $S3 == $S4 goto __label_7
    goto __label_4
  __label_5: # case
  __label_6: # case
  __label_7: # case
.annotate 'line', 320
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_3 # break
  __label_4: # default
  __label_3: # switch end
.annotate 'line', 323
    concat $S1, $S1, $S2
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 325
    .return($S1)
# }
.annotate 'line', 326

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenSingleQuoted' ]
.annotate 'line', 298
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
.annotate 'line', 333
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 334

.end # TokenInteger


.sub 'isint' :method
# Body
# {
.annotate 'line', 335
    .return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenInteger' ]
.annotate 'line', 329
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
.annotate 'line', 342
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 343

.end # TokenFloat


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 344
    .return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenFloat' ]
.annotate 'line', 338
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
.annotate 'line', 354
# s: $S1
    set $S1, ''
.annotate 'line', 355
# c: $S2
    null $S2
# for loop
.annotate 'line', 356
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
# {
# switch
.annotate 'line', 357
    set $S4, $S2
    set $S5, ""
    if $S4 == $S5 goto __label_6
    set $S5, "\n"
    if $S4 == $S5 goto __label_7
    set $S5, '\'
    if $S4 == $S5 goto __label_8
    goto __label_5
  __label_6: # case
  __label_7: # case
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 360
    $P2('Unterminated string', __ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 363
# c2: $S3
    $P3 = __ARG_1.'getchar'()
    null $S3
    if_null $P3, __label_9
    set $S3, $P3
  __label_9:
.annotate 'line', 364
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.const 'Sub' $P4 = 'WSubId_7'
.annotate 'line', 365
    $P4('Unterminated string', __ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 366
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 369
    concat $S1, $S1, $S2
  __label_4: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 356
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 372
    new $P3, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenQuoted'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
.annotate 'line', 373

.end # getquoted


.sub 'getsinglequoted'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 377
# s: $S1
    set $S1, ''
.annotate 'line', 378
# c: $S2
    null $S2
# for loop
.annotate 'line', 379
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
# {
.annotate 'line', 380
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 381
    $P2('Unterminated string', __ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 382
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 379
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 384
    new $P3, [ 'TokenSingleQuoted' ]
    getattribute $P4, __ARG_1, 'filename'
    $P3.'TokenSingleQuoted'($P4, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
.annotate 'line', 385

.end # getsinglequoted


.sub 'getheredoc'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 389
# mark: $S1
    set $S1, ''
.annotate 'line', 390
# c: $S2
    null $S2
# for loop
.annotate 'line', 391
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
# {
# switch
.annotate 'line', 392
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_6
    set $S6, '"'
    if $S5 == $S6 goto __label_7
    set $S6, '\'
    if $S5 == $S6 goto __label_8
    goto __label_5
  __label_6: # case
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 394
    $P2('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 399
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 402
    concat $S0, $S1, $S2
    set $S1, $S0
# }
  __label_1: # for iteration
.annotate 'line', 391
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 404
    concat $S0, $S1, ':>>'
    set $S1, $S0
.annotate 'line', 406
# content: $S3
    set $S3, ''
.annotate 'line', 407
# line: $S4
    null $S4
  __label_9: # do
.annotate 'line', 408
# {
.annotate 'line', 409
    set $S4, ''
# for loop
.annotate 'line', 410
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
# {
# switch
.annotate 'line', 411
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_17
    set $S6, '"'
    if $S5 == $S6 goto __label_18
    set $S6, '\'
    if $S5 == $S6 goto __label_19
    goto __label_16
  __label_17: # case
.const 'Sub' $P3 = 'WSubId_7'
.annotate 'line', 413
    $P3('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 416
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_15 # break
  __label_16: # default
  __label_15: # switch end
.annotate 'line', 419
    concat $S4, $S4, $S2
# }
  __label_12: # for iteration
.annotate 'line', 410
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 421
    eq $S4, $S1, __label_20
.annotate 'line', 422
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
# }
  __label_11: # continue
.annotate 'line', 423
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 424
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_1, 'filename'
    $P4.'TokenQuoted'($P5, __ARG_3, $S3)
    set $P1, $P4
    .return($P1)
# }
.annotate 'line', 425

.end # getheredoc


.sub 'getident' :subid('WSubId_13')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 429
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 430
# c: $S2
    null $S2
# for loop
.annotate 'line', 431
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
.const 'Sub' $P3 = 'WSubId_8'
    $P2 = $P3($S2)
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 432
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 431
    $P4 = __ARG_1.'getchar'()
    set $S2, $P4
    goto __label_3
  __label_2: # for end
.annotate 'line', 433
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 434
    new $P2, [ 'TokenIdentifier' ]
    getattribute $P4, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P4, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 435

.end # getident


.sub 'getnumber' :subid('WSubId_14')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 439
# s: $S1
    null $S1
.annotate 'line', 440
# c: $S2
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 441
# {
.annotate 'line', 442
    concat $S1, $S1, $S2
.annotate 'line', 443
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_3: # continue
.const 'Sub' $P2 = 'WSubId_9'
.annotate 'line', 444
    $P1 = $P2($S2)
    if_null $P1, __label_2
    if $P1 goto __label_1
  __label_2: # enddo
.annotate 'line', 445
    iseq $I3, $S1, '0'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'x'
    if $I3 goto __label_6
    iseq $I3, $S2, 'X'
  __label_6:
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 446
# hexval: $I1
    null $I1
# h: $I2
    null $I2
# for loop
.annotate 'line', 447
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_9: # for condition
.const 'Sub' $P4 = 'WSubId_10'
    $P3 = $P4($S2)
    set $I2, $P3
    lt $I2, 0, __label_8
# {
.annotate 'line', 448
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 449
    concat $S1, $S1, $S2
# }
  __label_7: # for iteration
.annotate 'line', 447
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_9
  __label_8: # for end
.annotate 'line', 451
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 452
    set $S1, $I1
.annotate 'line', 453
    new $P3, [ 'TokenInteger' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenInteger'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
  __label_4: # endif
.annotate 'line', 455
    ne $S2, '.', __label_10
# {
  __label_12: # do
.annotate 'line', 456
# {
.annotate 'line', 457
    concat $S1, $S1, $S2
.annotate 'line', 458
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_14: # continue
.const 'Sub' $P6 = 'WSubId_9'
.annotate 'line', 459
    $P1 = $P6($S2)
    if_null $P1, __label_13
    if $P1 goto __label_12
  __label_13: # enddo
.annotate 'line', 460
    iseq $I3, $S2, 'e'
    if $I3 goto __label_16
    iseq $I3, $S2, 'E'
  __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 461
    concat $S1, $S1, 'E'
.annotate 'line', 462
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_18
    iseq $I3, $S2, '-'
  __label_18:
    unless $I3 goto __label_17
# {
.annotate 'line', 463
    concat $S1, $S1, $S2
.annotate 'line', 464
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_17: # endif
# for loop
  __label_21: # for condition
.const 'Sub' $P7 = 'WSubId_9'
.annotate 'line', 466
    $P1 = $P7($S2)
    if_null $P1, __label_20
    unless $P1 goto __label_20
.annotate 'line', 467
    concat $S1, $S1, $S2
  __label_19: # for iteration
.annotate 'line', 466
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_21
  __label_20: # for end
# }
  __label_15: # endif
.annotate 'line', 469
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 470
    new $P3, [ 'TokenFloat' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenFloat'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 473
    iseq $I3, $S2, 'e'
    if $I3 goto __label_24
    iseq $I3, $S2, 'E'
  __label_24:
    unless $I3 goto __label_22
# {
.annotate 'line', 474
    concat $S1, $S1, 'E'
.annotate 'line', 475
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_26
    iseq $I3, $S2, '-'
  __label_26:
    unless $I3 goto __label_25
# {
.annotate 'line', 476
    concat $S1, $S1, $S2
.annotate 'line', 477
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_25: # endif
# for loop
  __label_29: # for condition
.const 'Sub' $P8 = 'WSubId_9'
.annotate 'line', 479
    $P1 = $P8($S2)
    if_null $P1, __label_28
    unless $P1 goto __label_28
.annotate 'line', 480
    concat $S1, $S1, $S2
  __label_27: # for iteration
.annotate 'line', 479
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_29
  __label_28: # for end
.annotate 'line', 481
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 482
    new $P3, [ 'TokenFloat' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenFloat'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
    goto __label_23
  __label_22: # else
# {
.annotate 'line', 485
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 486
    new $P3, [ 'TokenInteger' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenInteger'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
  __label_23: # endif
# }
  __label_11: # endif
# }
.annotate 'line', 489

.end # getnumber


.sub 'getlinecomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 493
# s: $S1
    set $S1, __ARG_2
# for loop
.annotate 'line', 494
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
  __label_3: # for condition
    isne $I1, $S2, ''
    unless $I1 goto __label_5
    isne $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_2
.annotate 'line', 495
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 494
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 496
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 497

.end # getlinecomment


.sub 'getcomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 501
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 502
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
.annotate 'line', 503
# {
# for loop
  __label_7: # for condition
.annotate 'line', 504
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 505
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 504
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 506
    ne $S2, '', __label_9
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 507
    $P2("Unclosed comment", __ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 508
    concat $S1, $S1, $S2
.annotate 'line', 509
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 510
    ne $S2, '', __label_10
.const 'Sub' $P3 = 'WSubId_7'
.annotate 'line', 511
    $P3("Unclosed comment", __ARG_1, __ARG_3)
  __label_10: # endif
# }
  __label_4: # continue
.annotate 'line', 512
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 513
    concat $S1, $S1, '/'
.annotate 'line', 514
    new $P4, [ 'TokenComment' ]
    getattribute $P5, __ARG_1, 'filename'
    $P4.'TokenComment'($P5, __ARG_3, $S1)
    set $P1, $P4
    .return($P1)
# }
.annotate 'line', 515

.end # getcomment


.sub 'getop' :subid('WSubId_15')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 519
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 520
    new $P2, [ 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 521

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 537
.const 'Sub' $P2 = 'getop'
.const 'Sub' $P3 = 'getident'
.const 'Sub' $P4 = 'getquoted'
.const 'Sub' $P5 = 'getsinglequoted'
.const 'Sub' $P6 = 'getheredoc'
.const 'Sub' $P7 = 'getcomment'
.const 'Sub' $P8 = 'getlinecomment'
.annotate 'line', 541
    setattribute self, 'h', __ARG_1
.annotate 'line', 542
    box $P9, ''
    setattribute self, 'pending', $P9
.annotate 'line', 543
    root_new $P10, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P10
.annotate 'line', 544
    box $P9, __ARG_2
    setattribute self, 'filename', $P9
.annotate 'line', 545
    box $P9, 1
    setattribute self, 'line', $P9
.annotate 'line', 546
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 547
    root_new $P9, ['parrot';'Hash']
    $P9[''] = $P3
    $P9['{'] = $P2
    $P1['$'] = $P9
    $P1['"'] = $P4
    $P1["'"] = $P5
.annotate 'line', 550
    root_new $P10, ['parrot';'Hash']
.annotate 'line', 551
    root_new $P11, ['parrot';'Hash']
    $P11[''] = $P2
    $P11['='] = $P2
    $P10['='] = $P11
    $P10[':'] = $P2
    $P1['='] = $P10
.annotate 'line', 554
    root_new $P12, ['parrot';'Hash']
    $P12['+'] = $P2
    $P12['='] = $P2
    $P1['+'] = $P12
.annotate 'line', 555
    root_new $P13, ['parrot';'Hash']
    $P13['-'] = $P2
    $P13['='] = $P2
    $P1['-'] = $P13
.annotate 'line', 556
    root_new $P14, ['parrot';'Hash']
    $P14['='] = $P2
    $P1['*'] = $P14
.annotate 'line', 557
    root_new $P15, ['parrot';'Hash']
    $P15['|'] = $P2
    $P1['|'] = $P15
.annotate 'line', 558
    root_new $P16, ['parrot';'Hash']
    $P16['&'] = $P2
    $P1['&'] = $P16
.annotate 'line', 559
    root_new $P17, ['parrot';'Hash']
.annotate 'line', 560
    root_new $P18, ['parrot';'Hash']
    $P18[''] = $P2
    $P18[':'] = $P6
    $P17['<'] = $P18
    $P17['='] = $P2
    $P1['<'] = $P17
.annotate 'line', 563
    root_new $P19, ['parrot';'Hash']
    $P19['>'] = $P2
    $P19['='] = $P2
    $P1['>'] = $P19
.annotate 'line', 564
    root_new $P20, ['parrot';'Hash']
.annotate 'line', 565
    root_new $P21, ['parrot';'Hash']
    $P21[''] = $P2
    $P21['='] = $P2
    $P20['='] = $P21
    $P1['!'] = $P20
.annotate 'line', 567
    root_new $P22, ['parrot';'Hash']
    $P22['%'] = $P2
    $P22['='] = $P2
    $P1['%'] = $P22
.annotate 'line', 568
    root_new $P23, ['parrot';'Hash']
    $P23['='] = $P2
    $P23['/'] = $P8
    $P23['*'] = $P7
    $P1['/'] = $P23
    $P1['#'] = $P8
.annotate 'line', 571
    setattribute self, 'select', $P1
# }
.annotate 'line', 572

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 575
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 576
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 577
    eq $S1, '', __label_2
.annotate 'line', 578
    assign $P1, ''
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 580
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 581
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 582
    ne $S1, "\n", __label_4
.annotate 'line', 583
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 585
    .return($S1)
# }
.annotate 'line', 586

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 589
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 590

.end # ungetchar


.sub 'get_token' :method
# Body
# {
.annotate 'line', 593
.const 'Sub' $P3 = 'isspace'
.const 'Sub' $P4 = 'isidentstart'
.const 'Sub' $P5 = 'isdigit'
.const 'Sub' $P6 = 'getop'
.const 'Sub' $P7 = 'getident'
.const 'Sub' $P8 = 'getnumber'
.annotate 'line', 596
    getattribute $P9, self, 'stacked'
    if_null $P9, __label_1
    unless $P9 goto __label_1
.annotate 'line', 597
    getattribute $P10, self, 'stacked'
    .tailcall $P10.'pop'()
  __label_1: # endif
.annotate 'line', 599
# c: $S1
    $P9 = self.'getchar'()
    null $S1
    if_null $P9, __label_2
    set $S1, $P9
  __label_2:
  __label_4: # while
.annotate 'line', 600
.const 'Sub' $P11 = 'WSubId_11'
    $P9 = $P11($S1)
    if_null $P9, __label_3
    unless $P9 goto __label_3
.annotate 'line', 601
    $P10 = self.'getchar'()
    set $S1, $P10
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 602
# line: $I1
    getattribute $P9, self, 'line'
    set $I1, $P9
.annotate 'line', 603
    ne $S1, '', __label_5
.annotate 'line', 604
    new $P10, [ 'TokenEof' ]
    getattribute $P12, self, 'filename'
    $P10.'TokenEof'($P12)
    set $P9, $P10
    .return($P9)
  __label_5: # endif
.annotate 'line', 605
.const 'Sub' $P13 = 'WSubId_12'
    $P9 = $P13($S1)
    if_null $P9, __label_6
    unless $P9 goto __label_6
.annotate 'line', 606
.const 'Sub' $P14 = 'WSubId_13'
    .tailcall $P14(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 607
.const 'Sub' $P15 = 'WSubId_9'
    $P9 = $P15($S1)
    if_null $P9, __label_7
    unless $P9 goto __label_7
.annotate 'line', 608
.const 'Sub' $P16 = 'WSubId_14'
    .tailcall $P16(self, $S1, $I1)
  __label_7: # endif
.annotate 'line', 610
# op: $S2
    set $S2, $S1
.annotate 'line', 611
# var select: $P1
    getattribute $P1, self, 'select'
.annotate 'line', 612
# var current: $P2
    $P2 = $P1[$S1]
  __label_9: # while
.annotate 'line', 614
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P2, 'Hash'
  __label_10:
    unless $I2 goto __label_8
# {
.annotate 'line', 615
    $P9 = self.'getchar'()
    set $S1, $P9
.annotate 'line', 616
    set $P1, $P2
.annotate 'line', 617
    $P2 = $P1[$S1]
.annotate 'line', 618
    unless_null $P2, __label_11
# {
.annotate 'line', 619
    self.'ungetchar'($S1)
.annotate 'line', 620
    $P2 = $P1['']
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 623
    concat $S2, $S2, $S1
  __label_12: # endif
# }
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 625
    if_null $P2, __label_13
    unless $P2 goto __label_13
.annotate 'line', 626
    .tailcall $P2(self, $S2, $I1)
  __label_13: # endif
.annotate 'line', 627
.const 'Sub' $P17 = 'WSubId_15'
    .tailcall $P17(self, $S2, $I1)
# }
.annotate 'line', 628

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 631
# var t: $P1
    $P1 = self.'get_token'()
  __label_2: # while
.annotate 'line', 632
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_4
    not $I1, __ARG_1
  __label_4:
    unless $I1 goto __label_3
    $I1 = $P1.'iscomment'()
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 633
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 634
    .return($P1)
# }
.annotate 'line', 635

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 638
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 639

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 529
    addattribute $P0, 'h'
.annotate 'line', 530
    addattribute $P0, 'pending'
.annotate 'line', 531
    addattribute $P0, 'select'
.annotate 'line', 532
    addattribute $P0, 'stacked'
.annotate 'line', 533
    addattribute $P0, 'filename'
.annotate 'line', 534
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

.sub 'typetoregcheck' :subid('WSubId_82')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 660
    set $S1, __ARG_1
    set $S2, 'int'
    if $S1 == $S2 goto __label_3
    set $S2, 'float'
    if $S1 == $S2 goto __label_4
    set $S2, 'string'
    if $S1 == $S2 goto __label_5
    set $S2, 'var'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 661
    .return('I')
  __label_4: # case
.annotate 'line', 662
    .return('N')
  __label_5: # case
.annotate 'line', 663
    .return('S')
  __label_6: # case
.annotate 'line', 664
    .return('P')
  __label_2: # default
.annotate 'line', 665
    .return('')
  __label_1: # switch end
# }
.annotate 'line', 667

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_85')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 671
    set $S1, __ARG_1
    set $S2, 'I'
    if $S1 == $S2 goto __label_3
    set $S2, 'N'
    if $S1 == $S2 goto __label_4
    set $S2, 'S'
    if $S1 == $S2 goto __label_5
    set $S2, 'P'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 672
    .return('int')
  __label_4: # case
.annotate 'line', 673
    .return('num')
  __label_5: # case
.annotate 'line', 674
    .return('string')
  __label_6: # case
.annotate 'line', 675
    .return('pmc')
  __label_2: # default
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 676
    $P1('Invalid reg type')
  __label_1: # switch end
# }
.annotate 'line', 678

.end # typetopirname

# Constant INDENT evaluated at compile time
# Constant INDENTLABEL evaluated at compile time
.namespace [ 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 698
    setattribute self, 'handle', __ARG_1
.annotate 'line', 699
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 700
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 701
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 702
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 703

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 706
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 707

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 710
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 711

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 714
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 715
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 717
    getattribute $P5, self, 'file'
.annotate 'line', 715
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 720
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_1: # endif
.annotate 'line', 722
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
# {
.annotate 'line', 723
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 725
    getattribute $P5, self, 'line'
.annotate 'line', 723
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 728
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_2: # endif
# }
.annotate 'line', 730

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 733
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 734
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 735

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 738
    self.'updateannot'()
.annotate 'line', 739
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 740

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 743
    self.'updateannot'()
.annotate 'line', 744
    self.'vprint'(__ARG_1)
.annotate 'line', 745
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 746

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 749
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
# {
.annotate 'line', 751
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 752
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 753
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 754
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 755
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 756
    assign $P1, $S1
.annotate 'line', 757
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 758
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 760
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 761
    assign $P2, $I1
.annotate 'line', 762
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 765

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 768
    self.'updateannot'()
.annotate 'line', 769
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 770

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 773
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 774
    $P1.'print'('  ')
.annotate 'line', 775
    $P1.'print'(__ARG_1)
.annotate 'line', 776
    $P1.'print'(':')
.annotate 'line', 777
    if_null __ARG_2, __label_1
.annotate 'line', 778
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 779
    $P1.'print'("\n")
# }
.annotate 'line', 780

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 783
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 784
    $P1.'print'('    goto ')
.annotate 'line', 785
    $P1.'print'(__ARG_1)
.annotate 'line', 786
    if_null __ARG_2, __label_1
.annotate 'line', 787
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 788
    $P1.'print'("\n")
# }
.annotate 'line', 789

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 793
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 794

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 797
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 798

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 801
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 802

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 805
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 806

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 809
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 810

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 813
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 814

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 817
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 818

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 822
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 823

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 826
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 827

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 830
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 831

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 834
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 835

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 838
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 839

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 842
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 843

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 846
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 847

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 850
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 851

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 854
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 855

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 858
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 859

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 862
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 863

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 866
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 867

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 870
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 871

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 874
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 875

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 878
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 879

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 882
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 883

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 886
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 887

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 890
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 891

.end # emitsay


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 894
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 895

.end # emitfind_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Emit' ]
.annotate 'line', 689
    addattribute $P0, 'handle'
.annotate 'line', 690
    addattribute $P0, 'file'
.annotate 'line', 691
    addattribute $P0, 'line'
.annotate 'line', 692
    addattribute $P0, 'pendingf'
.annotate 'line', 693
    addattribute $P0, 'pendingl'
.annotate 'line', 694
    addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue' :subid('WSubId_16')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 904
    new $P2, [ 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 905

.end # integerValue


.sub 'floatValue' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 909
# var t: $P1
    new $P1, [ 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 910
    new $P3, [ 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 911

.end # floatValue


.sub 'floatresult' :subid('WSubId_50')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 919
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 920
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 921
    .return($I1)
# }
.annotate 'line', 922

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant VAR_is_extern evaluated at compile time
# Constant __DEBUG_PREDEFS evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Predef_frombody' ]

.sub 'Predef_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 959
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 960
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 961
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 962
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 963
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 964
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 965

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 968
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 970
    ne $S1, 'v', __label_2
# {
.annotate 'line', 971
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_3, ''
  __label_5:
    unless $I1 goto __label_4
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 972
    $P3('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 975
    isnull $I1, __ARG_3
    if $I1 goto __label_7
    iseq $I1, __ARG_3, ''
  __label_7:
    unless $I1 goto __label_6
.const 'Sub' $P4 = 'WSubId_6'
.annotate 'line', 976
    $P4('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 979
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 980
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 981
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 982
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 983

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 945
    addattribute $P0, 'body'
.annotate 'line', 946
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
.annotate 'line', 1004
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1005
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1006
    new $P3, [ 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1008
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1009
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1010
# n: $I1
    null $I1
.annotate 'line', 1011
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1012
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1013
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1015
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1018
    set $I1, -2
.annotate 'line', 1019
    if_null __ARG_5, __label_8
.const 'Sub' $P5 = 'WSubId_6'
.annotate 'line', 1020
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    $P5($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1023
    set $I1, 1
.annotate 'line', 1024
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1025
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1026
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1028
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1029
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1030
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1032
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1033
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1034
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1038
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1039

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1042
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1043
    .return($S1)
# }
.annotate 'line', 1044

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1047
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1048

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1049
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1052
# type: $S1
    null $S1
# switch
.annotate 'line', 1053
    set $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_3
    set $I2, 1
    if $I1 == $I2 goto __label_4
    set $I2, 2
    if $I1 == $I2 goto __label_5
    set $I2, 3
    if $I1 == $I2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 1054
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1055
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1056
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1057
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.const 'Sub' $P5 = 'WSubId_6'
.annotate 'line', 1059
    $P5('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1061
    .return($S1)
# }
.annotate 'line', 1062

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1065
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1066
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1067
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1068
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1069
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1070
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1071

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefBase' ]
.annotate 'line', 988
    addattribute $P0, 'name'
.annotate 'line', 989
    addattribute $P0, 'body'
.annotate 'line', 990
    addattribute $P0, 'typeresult'
.annotate 'line', 991
    addattribute $P0, 'type0'
.annotate 'line', 992
    addattribute $P0, 'type1'
.annotate 'line', 993
    addattribute $P0, 'type2'
.annotate 'line', 994
    addattribute $P0, 'type3'
.annotate 'line', 995
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
.annotate 'line', 1083
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1084

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1074
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
.annotate 'line', 1097
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1098
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1099

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1087
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1089
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1107
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1108

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1111
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1112
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_2
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 1113
    $P3("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1114
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1115
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1117
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1118
    isa $I1, $P1, [ 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1119
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1122
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1123
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1125
    ne $S3, 'null', __label_9
.annotate 'line', 1126
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_10
  __label_9: # else
.annotate 'line', 1128
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1130

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1104
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
.annotate 'line', 1135
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1136
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1137
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1138
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1139
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1138
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1140
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1143
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1144

.end # Predef_say


.sub 'Predef_cry'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1148
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1149
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1150
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1151
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1152
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1153

.end # Predef_cry


.sub 'Predef_print'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1157
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1158
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1159
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1160

.end # Predef_print


.sub 'Predef_invoke'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1166
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1167
    isa $I2, $P1, [ 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_1'
.annotate 'line', 1168
    $P2("invoke argument must be callable", __ARG_2)
  __label_1: # endif
.annotate 'line', 1169
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1170

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_17')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1174
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1175
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1176
.const 'Sub' $P3 = 'WSubId_16'
# predefined length
.annotate 'line', 1173
    length $I1, $S1
.annotate 'line', 1176
    .tailcall $P3(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1177

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_18')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1181
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1182
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1183
.const 'Sub' $P3 = 'WSubId_16'
# predefined bytelength
.annotate 'line', 1180
    bytelength $I1, $S1
.annotate 'line', 1183
    .tailcall $P3(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1184

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_20')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1188
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1189
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1190
.const 'Sub' $P3 = 'WSubId_16'
# predefined ord
.annotate 'line', 1187
    ord $I1, $S1
.annotate 'line', 1190
    .tailcall $P3(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1191

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_21')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1195
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1196
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1197
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1198
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1199
.const 'Sub' $P4 = 'WSubId_16'
# predefined ord
.annotate 'line', 1194
    ord $I2, $S1, $I1
.annotate 'line', 1199
    .tailcall $P4(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1200

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_19')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1204
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1206
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1207
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1209
# var t: $P2
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1210
    new $P4, [ 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1211

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_22')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1215
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1216
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1217
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1218
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1220
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1221
    new $P5, [ 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1222

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1226
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1227
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1228
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1229
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1230
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1231
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1233
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1234
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1235

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1239
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1240
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1241
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1242
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1243
.const 'Sub' $P4 = 'WSubId_16'
# predefined indexof
.annotate 'line', 1238
    index $I1, $S1, $S2
.annotate 'line', 1243
    .tailcall $P4(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1244

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1248
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1249
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1250
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1251
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1252
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1253
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1254
.const 'Sub' $P5 = 'WSubId_16'
# predefined indexof
.annotate 'line', 1247
    index $I2, $S1, $S2, $I1
.annotate 'line', 1254
    .tailcall $P5(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1255

.end # predefeval_indexof_pos


.sub 'getpredefs' :subid('WSubId_26')
# Body
# {
.const 'Sub' $P2 = "WSubId_17"
.const 'Sub' $P3 = "WSubId_18"
.const 'Sub' $P4 = "WSubId_19"
.const 'Sub' $P5 = "WSubId_20"
.const 'Sub' $P6 = "WSubId_21"
.const 'Sub' $P7 = "WSubId_22"
.const 'Sub' $P8 = "WSubId_23"
.const 'Sub' $P9 = "WSubId_24"
.const 'Sub' $P10 = "WSubId_25"
.annotate 'line', 1268
.const 'Sub' $P11 = 'Predef_print'
.const 'Sub' $P12 = 'Predef_say'
.const 'Sub' $P13 = 'Predef_cry'
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1270
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1271
    new $P17, [ 'PredefFunction' ]
.annotate 'line', 1272
    new $P19, [ 'Predef_typecast' ]
    $P19.'Predef_typecast'('I')
    set $P18, $P19
    $P17.'PredefFunction'('int', $P18, 'I', '!')
    set $P16, $P17
.annotate 'line', 1270
    push $P1, $P16
.annotate 'line', 1275
    new $P21, [ 'PredefFunction' ]
.annotate 'line', 1276
    new $P23, [ 'Predef_typecast' ]
    $P23.'Predef_typecast'('N')
    set $P22, $P23
    $P21.'PredefFunction'('float', $P22, 'N', '!')
    set $P20, $P21
.annotate 'line', 1270
    push $P1, $P20
.annotate 'line', 1279
    new $P25, [ 'PredefFunction' ]
.annotate 'line', 1280
    new $P27, [ 'Predef_typecast' ]
    $P27.'Predef_typecast'('S')
    set $P26, $P27
    $P25.'PredefFunction'('string', $P26, 'S', '!')
    set $P24, $P25
.annotate 'line', 1270
    push $P1, $P24
.annotate 'line', 1283
    new $P29, [ 'PredefFunction' ]
    $P29.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P28, $P29
.annotate 'line', 1270
    push $P1, $P28
.annotate 'line', 1287
    new $P31, [ 'PredefFunction' ]
    $P31.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P30, $P31
.annotate 'line', 1270
    push $P1, $P30
.annotate 'line', 1291
    new $P33, [ 'PredefFunction' ]
    $P33.'PredefFunction'('time', 'time %0', 'I')
    set $P32, $P33
.annotate 'line', 1270
    push $P1, $P32
.annotate 'line', 1295
    new $P35, [ 'PredefFunction' ]
    $P35.'PredefFunction'('floattime', 'time %0', 'N')
    set $P34, $P35
.annotate 'line', 1270
    push $P1, $P34
.annotate 'line', 1299
    new $P37, [ 'PredefFunction' ]
    $P37.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P36, $P37
.annotate 'line', 1270
    push $P1, $P36
.annotate 'line', 1303
    new $P39, [ 'PredefFunction' ]
    $P39.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P38, $P39
.annotate 'line', 1270
    push $P1, $P38
.annotate 'line', 1307
    new $P41, [ 'PredefFunction' ]
    $P41.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P40, $P41
.annotate 'line', 1270
    push $P1, $P40
.annotate 'line', 1311
    new $P43, [ 'PredefFunction' ]
    $P43.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P42, $P43
.annotate 'line', 1270
    push $P1, $P42
.annotate 'line', 1315
    new $P45, [ 'PredefFunction' ]
    $P45.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P44, $P45
.annotate 'line', 1270
    push $P1, $P44
.annotate 'line', 1322
    new $P47, [ 'PredefFunction' ]
    $P47.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P46, $P47
.annotate 'line', 1270
    push $P1, $P46
.annotate 'line', 1329
    new $P49, [ 'PredefFunction' ]
    $P49.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P48, $P49
.annotate 'line', 1270
    push $P1, $P48
.annotate 'line', 1336
    new $P51, [ 'PredefFunction' ]
    $P51.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P50, $P51
.annotate 'line', 1270
    push $P1, $P50
.annotate 'line', 1344
    new $P53, [ 'PredefFunction' ]
    $P53.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P52, $P53
.annotate 'line', 1270
    push $P1, $P52
.annotate 'line', 1353
    new $P55, [ 'PredefFunction' ]
    $P55.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P54, $P55
.annotate 'line', 1270
    push $P1, $P54
.annotate 'line', 1357
    new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1358
    $P57.'PredefFunctionEval'('length', $P2, 'length %0, %1', 'I', 'S')
    set $P56, $P57
.annotate 'line', 1270
    push $P1, $P56
.annotate 'line', 1362
    new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1363
    $P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength %0, %1', 'I', 'S')
    set $P58, $P59
.annotate 'line', 1270
    push $P1, $P58
.annotate 'line', 1367
    new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1368
    $P61.'PredefFunctionEval'('chr', $P4, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P60, $P61
.annotate 'line', 1270
    push $P1, $P60
.annotate 'line', 1376
    new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1377
    $P63.'PredefFunctionEval'('ord', $P5, 'ord %0, %1', 'I', 'S')
    set $P62, $P63
.annotate 'line', 1270
    push $P1, $P62
.annotate 'line', 1381
    new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1382
    $P65.'PredefFunctionEval'('ord', $P6, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P64, $P65
.annotate 'line', 1270
    push $P1, $P64
.annotate 'line', 1386
    new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1387
    $P67.'PredefFunctionEval'('substr', $P7, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P66, $P67
.annotate 'line', 1270
    push $P1, $P66
.annotate 'line', 1391
    new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1392
    $P69.'PredefFunctionEval'('substr', $P8, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P68, $P69
.annotate 'line', 1270
    push $P1, $P68
.annotate 'line', 1396
    new $P71, [ 'PredefFunction' ]
    $P71.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P70, $P71
.annotate 'line', 1270
    push $P1, $P70
.annotate 'line', 1400
    new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1401
    $P73.'PredefFunctionEval'('indexof', $P9, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P72, $P73
.annotate 'line', 1270
    push $P1, $P72
.annotate 'line', 1405
    new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1406
    $P75.'PredefFunctionEval'('indexof', $P10, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P74, $P75
.annotate 'line', 1270
    push $P1, $P74
.annotate 'line', 1410
    new $P77, [ 'PredefFunction' ]
    $P77.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P76, $P77
.annotate 'line', 1270
    push $P1, $P76
.annotate 'line', 1414
    new $P79, [ 'PredefFunction' ]
    $P79.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P78, $P79
.annotate 'line', 1270
    push $P1, $P78
.annotate 'line', 1418
    new $P81, [ 'PredefFunction' ]
    $P81.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P80, $P81
.annotate 'line', 1270
    push $P1, $P80
.annotate 'line', 1422
    new $P83, [ 'PredefFunction' ]
    $P83.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P82, $P83
.annotate 'line', 1270
    push $P1, $P82
.annotate 'line', 1426
    new $P85, [ 'PredefFunction' ]
    $P85.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P84, $P85
.annotate 'line', 1270
    push $P1, $P84
.annotate 'line', 1430
    new $P87, [ 'PredefFunction' ]
    $P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P86, $P87
.annotate 'line', 1270
    push $P1, $P86
.annotate 'line', 1437
    new $P89, [ 'PredefFunction' ]
    $P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P88, $P89
.annotate 'line', 1270
    push $P1, $P88
.annotate 'line', 1444
    new $P91, [ 'PredefFunction' ]
    $P91.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P90, $P91
.annotate 'line', 1270
    push $P1, $P90
.annotate 'line', 1448
    new $P93, [ 'PredefFunction' ]
    $P93.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P92, $P93
.annotate 'line', 1270
    push $P1, $P92
.annotate 'line', 1452
    new $P95, [ 'PredefFunction' ]
    $P95.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P94, $P95
.annotate 'line', 1270
    push $P1, $P94
.annotate 'line', 1456
    new $P97, [ 'PredefFunction' ]
    $P97.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P96, $P97
.annotate 'line', 1270
    push $P1, $P96
.annotate 'line', 1460
    new $P99, [ 'PredefFunction' ]
    $P99.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P98, $P99
.annotate 'line', 1270
    push $P1, $P98
.annotate 'line', 1464
    new $P101, [ 'PredefFunction' ]
    $P101.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P100, $P101
.annotate 'line', 1270
    push $P1, $P100
.annotate 'line', 1468
    new $P103, [ 'PredefFunction' ]
    $P103.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P102, $P103
.annotate 'line', 1270
    push $P1, $P102
.annotate 'line', 1472
    new $P105, [ 'PredefFunction' ]
    $P105.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P104, $P105
.annotate 'line', 1270
    push $P1, $P104
.annotate 'line', 1476
    new $P107, [ 'PredefFunction' ]
    $P107.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P106, $P107
.annotate 'line', 1270
    push $P1, $P106
.annotate 'line', 1480
    new $P109, [ 'PredefFunction' ]
    $P109.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P108, $P109
.annotate 'line', 1270
    push $P1, $P108
.annotate 'line', 1484
    new $P111, [ 'PredefFunction' ]
    $P111.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P110, $P111
.annotate 'line', 1270
    push $P1, $P110
.annotate 'line', 1488
    new $P113, [ 'PredefFunction' ]
    $P113.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P112, $P113
.annotate 'line', 1270
    push $P1, $P112
.annotate 'line', 1492
    new $P115, [ 'PredefFunction' ]
    $P115.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P114, $P115
.annotate 'line', 1270
    push $P1, $P114
.annotate 'line', 1496
    new $P117, [ 'PredefFunction' ]
    $P117.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P116, $P117
.annotate 'line', 1270
    push $P1, $P116
.annotate 'line', 1500
    new $P119, [ 'PredefFunction' ]
    $P119.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P118, $P119
.annotate 'line', 1270
    push $P1, $P118
.annotate 'line', 1504
    new $P121, [ 'PredefFunction' ]
    $P121.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P120, $P121
.annotate 'line', 1270
    push $P1, $P120
.annotate 'line', 1508
    new $P123, [ 'PredefFunction' ]
    $P123.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P122, $P123
.annotate 'line', 1270
    push $P1, $P122
.annotate 'line', 1512
    new $P125, [ 'PredefFunction' ]
    $P125.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P124, $P125
.annotate 'line', 1270
    push $P1, $P124
.annotate 'line', 1516
    new $P127, [ 'PredefFunction' ]
    $P127.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P126, $P127
.annotate 'line', 1270
    push $P1, $P126
.annotate 'line', 1520
    new $P129, [ 'PredefFunction' ]
    $P129.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P128, $P129
.annotate 'line', 1270
    push $P1, $P128
.annotate 'line', 1524
    new $P131, [ 'PredefFunction' ]
    $P131.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P130, $P131
.annotate 'line', 1270
    push $P1, $P130
.annotate 'line', 1528
    new $P133, [ 'PredefFunction' ]
    $P133.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P132, $P133
.annotate 'line', 1270
    push $P1, $P132
.annotate 'line', 1535
    new $P135, [ 'PredefFunction' ]
    $P135.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P134, $P135
.annotate 'line', 1270
    push $P1, $P134
.annotate 'line', 1542
    new $P137, [ 'PredefFunction' ]
    $P137.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P136, $P137
.annotate 'line', 1270
    push $P1, $P136
.annotate 'line', 1546
    new $P139, [ 'PredefFunction' ]
    $P139.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P138, $P139
.annotate 'line', 1270
    push $P1, $P138
.annotate 'line', 1550
    new $P141, [ 'PredefFunction' ]
    $P141.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P140, $P141
.annotate 'line', 1270
    push $P1, $P140
.annotate 'line', 1554
    new $P143, [ 'PredefFunction' ]
    $P143.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P142, $P143
.annotate 'line', 1270
    push $P1, $P142
.annotate 'line', 1558
    new $P145, [ 'PredefFunction' ]
    $P145.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P144, $P145
.annotate 'line', 1270
    push $P1, $P144
.annotate 'line', 1562
    new $P147, [ 'PredefFunction' ]
.annotate 'line', 1563
    $P147.'PredefFunction'('print', $P11, 'v', '*')
    set $P146, $P147
.annotate 'line', 1270
    push $P1, $P146
.annotate 'line', 1566
    new $P149, [ 'PredefFunction' ]
.annotate 'line', 1567
    $P149.'PredefFunction'('say', $P12, 'v', '*')
    set $P148, $P149
.annotate 'line', 1270
    push $P1, $P148
.annotate 'line', 1570
    new $P151, [ 'PredefFunction' ]
.annotate 'line', 1571
    $P151.'PredefFunction'('cry', $P13, 'v', '*')
    set $P150, $P151
.annotate 'line', 1270
    push $P1, $P150
.annotate 'line', 1574
    new $P153, [ 'PredefFunction' ]
.annotate 'line', 1575
    $P153.'PredefFunction'('invoke', $P14, 'P', '!')
    set $P152, $P153
.annotate 'line', 1270
    push $P1, $P152
  __label_2: # Infinite loop
.annotate 'line', 1580
    .yield($P1)
    goto __label_2
  __label_1: # Infinite loop end
# }
.annotate 'line', 1581

.end # getpredefs


.sub 'findpredef' :subid('WSubId_52')
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 1585
.const 'Sub' $P3 = 'WSubId_26'
    $P2 = $P3()
    iter $P4, $P2
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 1586
    getattribute $P5, $P1, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1587
# pargs: $I1
    getattribute $P6, $P1, 'nparams'
    set $I1, $P6
.annotate 'line', 1588
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_6
.annotate 'line', 1589
    iseq $I2, $I1, -1
  __label_6:
    if $I2 goto __label_5
.annotate 'line', 1590
    iseq $I2, $I1, -2
    unless $I2 goto __label_7
    iseq $I2, __ARG_2, 1
  __label_7:
  __label_5:
    unless $I2 goto __label_4
.annotate 'line', 1591
    .return($P1)
  __label_4: # endif
# }
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1593
    .return($P2)
# }
.annotate 'line', 1594

.end # findpredef


.sub 'optimize_array' :subid('WSubId_28')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1602
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1603
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1604
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1605
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1604
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1607

.end # optimize_array


.sub 'emit_array' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1611
    if_null __ARG_2, __label_1
# {
.annotate 'line', 1612
    iter $P2, __ARG_2
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $P1, $P2
.annotate 'line', 1613
    $P1.'emit'(__ARG_1)
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
# }
.annotate 'line', 1615

.end # emit_array


.sub 'parseDotted' :subid('WSubId_44')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1619
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1620
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1621
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1622
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1623
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1624
    $P2 = __ARG_1.'get'()
.annotate 'line', 1625
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1628
    __ARG_1.'unget'($P2)
.annotate 'line', 1629
    .return($P1)
# }
.annotate 'line', 1630

.end # parseDotted


.sub 'parseList' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
# Body
# {
.annotate 'line', 1638
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1639
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1640
# {
.annotate 'line', 1641
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1642
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1643
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1644
    unless_null __ARG_4, __label_4
.annotate 'line', 1645
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1647
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 1648
    $P5("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1649
    .return($P1)
# }
.annotate 'line', 1650

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1655
    $P1 = __ARG_1.'get'()
    .tailcall $P1.'getidentifier'()
# }
.annotate 'line', 1656

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_45')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1660
    new $P1, ['ResizableStringArray']
.annotate 'line', 1661
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1662
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1663
    .return($P1)
# }
.annotate 'line', 1664

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1677
    setattribute self, 'start', __ARG_1
.annotate 'line', 1678
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1679

.end # initbase


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1682
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1683

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1686
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1687

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1690
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1691

.end # generatesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1694
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1695

.end # addlocalfunction


.sub 'findns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1698
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findns'(__ARG_1)
# }
.annotate 'line', 1699

.end # findns


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1702
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1703

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1706
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1707

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1710
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1711

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1672
    addattribute $P0, 'start'
.annotate 'line', 1673
    addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1726
.const 'Sub' $P1 = 'parseExpr'
.annotate 'line', 1727
.const 'Sub' $P4 = 'WSubId_27'
    $P3 = $P4(__ARG_1, __ARG_2, $P1, __ARG_3)
    setattribute self, 'args', $P3
# }
.annotate 'line', 1728

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1732
    getattribute $P1, self, 'args'
# predefined elements
.annotate 'line', 1731
    elements $I1, $P1
.annotate 'line', 1732
    .return($I1)
# }
.annotate 'line', 1733

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1736
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1737
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1738

.end # getarg


.sub 'optimizeargs' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 1742
    getattribute $P2, self, 'args'
    $P1($P2)
# }
.annotate 'line', 1743

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1746
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1747
    getattribute $P3, self, 'args'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 1748
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1749
    .return($P1)
# }
.annotate 'line', 1750

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1753
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1754

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1722
    addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1766
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1769
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1770
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 1771
    .return($I1)
# }
.annotate 'line', 1772

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1775
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1776
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 1777
    $P3('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 1778
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1779

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1782
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1783
    if_null __ARG_2, __label_1
.annotate 'line', 1784
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 1785

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1788
    getattribute $P1, self, 'args'
    $P1.'optimizeargs'()
.annotate 'line', 1789
    .return(self)
# }
.annotate 'line', 1790

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Modifier' ]
.annotate 'line', 1763
    addattribute $P0, 'name'
.annotate 'line', 1764
    addattribute $P0, 'args'
.end
.namespace [ ]

.sub 'parseModifier'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1795
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1796
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1797
    $P1 = __ARG_1.'get'()
.annotate 'line', 1798
# var args: $P2
    null $P2
.annotate 'line', 1799
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1800
    new $P4, [ 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 1802
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 1803
    new $P4, [ 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1804

.end # parseModifier

.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1813
.const 'Sub' $P1 = 'parseModifier'
.annotate 'line', 1814
.const 'Sub' $P4 = 'WSubId_27'
    $P3 = $P4(__ARG_1, __ARG_2, $P1, ']')
    setattribute self, 'list', $P3
# }
.annotate 'line', 1815

.end # ModifierList


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 1818
    getattribute $P2, self, 'list'
    $P1($P2)
# }
.annotate 'line', 1819

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1820
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1823
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 1824
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 1825
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1827
    .return($P2)
# }
.annotate 'line', 1828

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1809
    addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey' :subid('WSubId_47')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1837
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1838
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1839

.end # getparrotkey


.sub 'getparrotnamespacekey' :subid('WSubId_86')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1843
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_1
.annotate 'line', 1844
    .return(".namespace [ ]")
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 1846
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1847
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_2: # endif
# }
.annotate 'line', 1849

.end # getparrotnamespacekey


.sub 'parseUsing' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1853
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 1855
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 1857
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 1859
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1856
    new $P3, [ 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 1858
    new $P5, [ 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 1860
    new $P7, [ 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 1862
    __ARG_2.'unget'($P1)
.annotate 'line', 1863
    new $P9, [ 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 1865

.end # parseUsing


.sub 'parseSig' :subid('WSubId_32')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1869
# var params: $P1
    new $P1, [ 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 1870
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 1871
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.const 'Sub' $P5 = 'WSubId_29'
.annotate 'line', 1872
    $P5("'='", $P2)
  __label_1: # endif
.annotate 'line', 1873
# var expr: $P3
.const 'Sub' $P6 = 'WSubId_30'
    $P3 = $P6(__ARG_2, __ARG_3)
.annotate 'line', 1874
    new $P7, [ 'MultiAssignStatement' ]
    $P7.'MultiAssignStatement'($P1, $P3)
    set $P4, $P7
    .return($P4)
# }
.annotate 'line', 1875

.end # parseSig


.sub 'parseStatement' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1879
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1880
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 1881
    new $P5, [ 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 1882
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 1883
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 1884
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 1885
    new $P6, [ 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 1886
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1887
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1888
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_5
.const 'Sub' $P7 = 'WSubId_31'
.annotate 'line', 1889
    $P7("':'", $P1)
  __label_5: # endif
.annotate 'line', 1890
.const 'Sub' $P8 = 'WSubId_32'
    .tailcall $P8($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 1893
    $P4 = $P1.'checkkeyword'()
    set $S1, $P4
    set $S2, 'using'
    if $S1 == $S2 goto __label_8
    set $S2, 'const'
    if $S1 == $S2 goto __label_9
    set $S2, 'volatile'
    if $S1 == $S2 goto __label_10
    set $S2, 'var'
    if $S1 == $S2 goto __label_11
    set $S2, 'string'
    if $S1 == $S2 goto __label_12
    set $S2, 'int'
    if $S1 == $S2 goto __label_13
    set $S2, 'float'
    if $S1 == $S2 goto __label_14
    set $S2, 'return'
    if $S1 == $S2 goto __label_15
    set $S2, 'yield'
    if $S1 == $S2 goto __label_16
    set $S2, 'goto'
    if $S1 == $S2 goto __label_17
    set $S2, 'if'
    if $S1 == $S2 goto __label_18
    set $S2, 'while'
    if $S1 == $S2 goto __label_19
    set $S2, 'do'
    if $S1 == $S2 goto __label_20
    set $S2, 'continue'
    if $S1 == $S2 goto __label_21
    set $S2, 'break'
    if $S1 == $S2 goto __label_22
    set $S2, 'switch'
    if $S1 == $S2 goto __label_23
    set $S2, 'for'
    if $S1 == $S2 goto __label_24
    set $S2, 'throw'
    if $S1 == $S2 goto __label_25
    set $S2, 'try'
    if $S1 == $S2 goto __label_26
    goto __label_7
  __label_8: # case
.annotate 'line', 1895
.const 'Sub' $P9 = 'WSubId_33'
    .tailcall $P9($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 1897
.const 'Sub' $P10 = 'WSubId_34'
    .tailcall $P10($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 1900
.const 'Sub' $P11 = 'WSubId_35'
    .tailcall $P11($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 1903
.const 'Sub' $P12 = 'WSubId_36'
    .tailcall $P12($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 1905
.const 'Sub' $P13 = 'WSubId_37'
    .tailcall $P13($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 1907
.const 'Sub' $P14 = 'WSubId_38'
    .tailcall $P14($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 1909
.const 'Sub' $P15 = 'WSubId_39'
    .tailcall $P15($P1, __ARG_1, __ARG_2)
  __label_15: # case
.annotate 'line', 1911
    new $P6, [ 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_16: # case
.annotate 'line', 1913
    new $P17, [ 'YieldStatement' ]
    $P17.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_17: # case
.annotate 'line', 1915
    new $P19, [ 'GotoStatement' ]
    $P19.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_18: # case
.annotate 'line', 1917
    new $P21, [ 'IfStatement' ]
    $P21.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_19: # case
.annotate 'line', 1919
    new $P23, [ 'WhileStatement' ]
    $P23.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_20: # case
.annotate 'line', 1921
    new $P25, [ 'DoStatement' ]
    $P25.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_21: # case
.annotate 'line', 1923
    new $P27, [ 'ContinueStatement' ]
    $P27.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_22: # case
.annotate 'line', 1925
    new $P29, [ 'BreakStatement' ]
    $P29.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_23: # case
.annotate 'line', 1927
.const 'Sub' $P30 = 'WSubId_40'
    .tailcall $P30($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 1929
.const 'Sub' $P31 = 'WSubId_41'
    .tailcall $P31($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 1931
    new $P33, [ 'ThrowStatement' ]
    $P33.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P32, $P33
    .return($P32)
  __label_26: # case
.annotate 'line', 1933
    new $P35, [ 'TryStatement' ]
    $P35.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P34, $P35
    .return($P34)
  __label_7: # default
.annotate 'line', 1935
    $P36 = $P1.'isidentifier'()
    if_null $P36, __label_27
    unless $P36 goto __label_27
# {
.annotate 'line', 1936
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 1937
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_28
    unless $P4 goto __label_28
.annotate 'line', 1938
    new $P6, [ 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_28: # endif
.annotate 'line', 1939
    __ARG_1.'unget'($P3)
# }
  __label_27: # endif
.annotate 'line', 1941
    __ARG_1.'unget'($P1)
.annotate 'line', 1942
    new $P5, [ 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_6: # switch end
.const 'Sub' $P37 = 'WSubId_6'
.annotate 'line', 1944
    $P37('parseStatement failure', $P1)
# }
.annotate 'line', 1945

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1955
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1956

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 1957
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1960
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1961

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1964
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1965

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 1968
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 1969

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 1972
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 1973

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1976
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1977

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1980
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1981

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 1984
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1985

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 1988
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1989

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1992
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1993

.end # createvarused


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1996
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1997

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2000
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2001

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2004
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2005

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2012
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2013

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2016
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2017

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2020
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2021

.end # getbreaklabel


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 2024
    getattribute $P2, self, 'start'
    $P1('**checking**', $P2)
.annotate 'line', 2026
    .return(self)
# }
.annotate 'line', 2027

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Statement' ]
.annotate 'line', 1951
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2032
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 2035
    $P1('Attempt to annotate empty statement')
# }
.annotate 'line', 2036

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2037
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 2030
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2050
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2051
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2052
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2053
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2054
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2055
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2056
    null $I2
  __label_4: # endif
.annotate 'line', 2057
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2053
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2059
    unless $I2 goto __label_6
.annotate 'line', 2060
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2062
    .return(self)
  __label_7: # endif
# }
.annotate 'line', 2063

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 2046
    addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2070
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2071
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2072

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2073
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2076
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2077
    .return(self)
# }
.annotate 'line', 2078

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_42'
.annotate 'line', 2081
    getattribute $P2, self, 'statements'
    $P1(__ARG_1, $P2)
# }
.annotate 'line', 2082

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 2066
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2087
    unless_null __ARG_1, __label_1
.annotate 'line', 2088
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2089
    isa $I1, __ARG_1, [ 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2090
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2092
    new $P2, [ 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2093

.end # addtomulti


.sub 'parsePiropArg'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2101
# var arg: $P1
    null $P1
.annotate 'line', 2102
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2103
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2104
    $P2 = __ARG_1.'get'()
.annotate 'line', 2105
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2106
    new $P3, [ 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2109
    __ARG_1.'unget'($P2)
.annotate 'line', 2110
.const 'Sub' $P4 = 'WSubId_30'
    $P1 = $P4(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2112
    .return($P1)
# }
.annotate 'line', 2113

.end # parsePiropArg

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2122
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2123
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2124
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2125
    unless $I1 goto __label_1
.annotate 'line', 2126
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2127
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2128
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2129
    $P1 = __ARG_2.'get'()
.annotate 'line', 2130
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2131
    __ARG_2.'unget'($P1)
.annotate 'line', 2132
.const 'Sub' $P3 = 'parsePiropArg'
.annotate 'line', 2133
.const 'Sub' $P5 = 'WSubId_27'
    $P4 = $P5(__ARG_2, __ARG_3, $P3, '}')
    setattribute self, 'args', $P4
# }
  __label_5: # endif
.const 'Sub' $P6 = 'WSubId_43'
.annotate 'line', 2135
    $P6(';', __ARG_2)
# }
.annotate 'line', 2136

.end # PiropStatement


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 2139
    getattribute $P2, self, 'args'
    $P1($P2)
.annotate 'line', 2140
    .return(self)
# }
.annotate 'line', 2141

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2144
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2145
    self.'annotate'(__ARG_1)
.annotate 'line', 2146
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2147
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2148
    __ARG_1.'print'('    ')
.annotate 'line', 2149
    unless_null $P1, __label_2
.annotate 'line', 2150
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2152
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2153
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2154
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2155
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2157

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 2115
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2117
    addattribute $P0, 'opname'
.annotate 'line', 2118
    addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2169
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2170
# var path: $P1
.const 'Sub' $P2 = 'WSubId_44'
    $P1 = $P2(__ARG_2)
.annotate 'line', 2171
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.const 'Sub' $P3 = 'WSubId_3'
.annotate 'line', 2172
    $P4 = __ARG_2.'get'()
    $P3($P4)
  __label_1: # endif
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 2173
    $P5(';', __ARG_2)
.annotate 'line', 2174
.const 'Sub' $P7 = 'WSubId_45'
    $P6 = $P7($P1)
    setattribute self, 'path', $P6
.annotate 'line', 2175
    .return(self)
# }
.annotate 'line', 2176

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2177
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2180
    self.'annotate'(__ARG_1)
.annotate 'line', 2181
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2182

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2164
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2166
    addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2194
    self.'Statement'(__ARG_1, __ARG_3)
.const 'Sub' $P1 = "WSubId_46"
.annotate 'line', 2196
.const 'Sub' $P4 = 'WSubId_27'
    null $P5
    $P3 = $P4(__ARG_2, $P5, $P1, ';')
    setattribute self, 'names', $P3
# }
.annotate 'line', 2197

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2198
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2201
    self.'annotate'(__ARG_1)
.annotate 'line', 2202
    getattribute $P2, self, 'names'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $S1, $P3
# {
.annotate 'line', 2203
# var v: $P1
    $P1 = self.'createvar'($S1, 'P')
.annotate 'line', 2204
    $P2 = $P1.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P2, " = '", $S1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2206

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2189
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2191
    addattribute $P0, 'names'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2220
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2221
# var path: $P1
.const 'Sub' $P2 = 'WSubId_44'
    $P1 = $P2(__ARG_2)
.annotate 'line', 2222
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.const 'Sub' $P3 = 'WSubId_3'
.annotate 'line', 2223
    $P4 = __ARG_2.'get'()
    $P3($P4)
  __label_1: # endif
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 2224
    $P5(';', __ARG_2)
.annotate 'line', 2225
.const 'Sub' $P7 = 'WSubId_45'
    $P6 = $P7($P1)
    setattribute self, 'path', $P6
# }
.annotate 'line', 2226

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2229
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2230
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2232
# var symbol: $P2
    $P2 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2234
    isnull $I1, $P2
    if $I1 goto __label_3
.annotate 'line', 2248
    isa $I1, $P2, [ 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2235
# predefined elements
    elements $I2, $P1
    le $I2, 0, __label_5
# {
.annotate 'line', 2236
# var p: $P3
# predefined clone
    clone $P3, $P1
.annotate 'line', 2237
    $P3.'pop'()
.annotate 'line', 2238
# var ns: $P4
    $P4 = self.'findns'($P3)
.annotate 'line', 2239
    if_null $P4, __label_6
# {
.annotate 'line', 2240
    $P2 = $P4.'getvar'($S1)
.annotate 'line', 2241
    if_null $P2, __label_7
# {
.annotate 'line', 2242
    self.'createvarused'($S1, $P2)
.annotate 'line', 2243
    new $P5, [ 'EmptyStatement' ]
    .return($P5)
# }
  __label_7: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 2249
# subid: $S2
    $P5 = $P2.'makesubid'()
    null $S2
    if_null $P5, __label_8
    set $S2, $P5
  __label_8:
.annotate 'line', 2250
    box $P6, $S2
    setattribute self, 'subid', $P6
    goto __label_1 # break
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2253
    self.'createvar'($S1, 'P')
.annotate 'line', 2254
    .return(self)
# }
.annotate 'line', 2255

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2258
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2259
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2260
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2261
    getattribute $P3, self, 'subid'
    if_null $P3, __label_1
# {
.annotate 'line', 2262
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2263
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2266
    self.'annotate'(__ARG_1)
.annotate 'line', 2267
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2268
    $P1.'pop'()
# switch
.annotate 'line', 2269
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 2271
    __ARG_1.'say'("'", $S1, "'")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 2274
.const 'Sub' $P5 = 'WSubId_47'
    $P3 = $P5($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
  __label_4: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2277

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2213
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2215
    addattribute $P0, 'path'
.annotate 'line', 2216
    addattribute $P0, 'subid'
.end
.namespace [ 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2288
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2289
# var nskey: $P1
.const 'Sub' $P3 = 'WSubId_44'
    $P1 = $P3(__ARG_2)
.annotate 'line', 2290
# nlems: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2291
    ge $I1, 1, __label_1
.const 'Sub' $P4 = 'WSubId_29'
.annotate 'line', 2292
    $P4('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2293
# var nssym: $P2
.const 'Sub' $P6 = 'WSubId_45'
    $P5 = $P6($P1)
    $P2 = __ARG_3.'findns'($P5)
.annotate 'line', 2295
    unless_null $P2, __label_2
.const 'Sub' $P7 = 'WSubId_1'
.annotate 'line', 2296
    $P7('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2297
    __ARG_3.'usenamespace'($P2)
.const 'Sub' $P8 = 'WSubId_43'
.annotate 'line', 2299
    $P8(';', __ARG_2)
# }
.annotate 'line', 2300

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2303
    .return(self)
# }
.annotate 'line', 2304

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingNamespaceStatement' ]
.annotate 'line', 2284
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2319
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2320
.const 'Sub' $P3 = 'WSubId_30'
    $P2 = $P3(__ARG_2, self)
    setattribute self, 'expr', $P2
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 2321
    $P4(';', __ARG_2)
# }
.annotate 'line', 2322

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2325
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2326
    .return(self)
# }
.annotate 'line', 2327

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2330
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2331

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2314
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2316
    addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
# Body
# {
.annotate 'line', 2348
    setattribute self, 'type', __ARG_1
.annotate 'line', 2349
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2350
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2351
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2352

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2355
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2356

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2357
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2358
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2359
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2360
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2361
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2362
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2363
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData' ]
.annotate 'line', 2340
    addattribute $P0, 'type'
.annotate 'line', 2341
    addattribute $P0, 'reg'
.annotate 'line', 2342
    addattribute $P0, 'scope'
.annotate 'line', 2343
    addattribute $P0, 'flags'
.annotate 'line', 2344
    addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2371
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2372

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 2375
    getattribute $P2, self, 'name'
    $P1('Attempt to use unexpanded constant!!!', $P2)
# }
.annotate 'line', 2376

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2368
    addattribute $P0, 'name'
.end
.namespace [ 'VarData_const' ]

.sub 'VarData_const' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 2385
    new $P2, [ 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2386

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2387
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2390
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 2391
    $P2('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2392
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2393

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData_const' ]
.annotate 'line', 2379
    get_class $P1, [ 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2381
    addattribute $P0, 'value'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2404
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2405

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2408
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2409
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2410
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2411
    if_null $P2, __label_2
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 2412
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    $P5($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2413
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2414
# var data: $P3
    new $P3, [ 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2415
    $P1[$S1] = $P3
.annotate 'line', 2416
    .return($P3)
# }
.annotate 'line', 2417

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2420
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2421
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2422
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2423
    if_null $P2, __label_2
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 2424
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    $P4($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2425
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2426

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2429
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2430
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2431
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2432
    if_null $P2, __label_2
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 2433
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    $P4($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2434
    new $P5, [ 'VarData' ]
    $P5.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P5
    $P1[$S1] = $P3
# }
.annotate 'line', 2435

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2438
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2439
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2440
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2441
    if_null $P2, __label_2
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 2442
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    $P5($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2443
# var data: $P3
    new $P3, [ 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2444
    $P1[$S1] = $P3
.annotate 'line', 2445
    .return($P3)
# }
.annotate 'line', 2446

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2449
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2448
    set $S1, __ARG_1
.annotate 'line', 2450
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2451

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2454
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 2455
    if_null $P1, __label_1
# {
.annotate 'line', 2456
# var sym: $P2
    null $P2
.annotate 'line', 2457
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 2458
    $P2 = $P3.'getlocalvar'(__ARG_1)
    if_null $P2, __label_4
.annotate 'line', 2459
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
    null $P5
.annotate 'line', 2462
    .return($P5)
# }
.annotate 'line', 2463

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2466
# var sym: $P1
    null $P1
.annotate 'line', 2467
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2468
    .return($P1)
  __label_1: # endif
.annotate 'line', 2469
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2470
    .return($P1)
  __label_2: # endif
.annotate 'line', 2471
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2472
    if_null $P2, __label_3
.annotate 'line', 2473
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2474
    .return($P3)
# }
.annotate 'line', 2475

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2478
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2479
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2480
    .return($S1)
# }
.annotate 'line', 2481

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2484
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2486
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2487
    .return('__WLEX_self')
# }
.annotate 'line', 2488

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2399
    addattribute $P0, 'locals'
.annotate 'line', 2400
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2497
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
.annotate 'line', 2509
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2510

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2511
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2512
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2513
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2514
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2515
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2516
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2517
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2518
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2519
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2522
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2523

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2527
    .return(self)
# }
.annotate 'line', 2528

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2529
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2532
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2533
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2534
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2535
    .return($S2)
# }
.annotate 'line', 2536

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2539
# reg: $S1
    null $S1
.annotate 'line', 2540
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2541
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2543
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2544
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2546
    .return($S1)
# }
.annotate 'line', 2547

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 2550
    getattribute $P2, self, 'start'
    $P1('Not a left-side expression', $P2)
# }
.annotate 'line', 2551

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Expr' ]
.annotate 'line', 2505
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2556
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2554
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
.annotate 'line', 2566
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2567
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2568
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.const 'Sub' $P3 = 'WSubId_29'
.annotate 'line', 2569
    $P3('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2570
    new $P5, [ 'LocalFunctionStatement' ]
    $P5.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P4, $P5
    setattribute self, 'fn', $P4
# }
.annotate 'line', 2571

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2572
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2575
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2576
    .return(self)
# }
.annotate 'line', 2577

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2580
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2581
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2582
    self.'annotate'(__ARG_1)
.annotate 'line', 2583
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2584
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 2585
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 2586

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2561
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2563
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
.annotate 'line', 2601
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2602
    .return(self)
# }
.annotate 'line', 2603

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2606
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2607

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2610
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2611
    .return(self)
# }
.annotate 'line', 2612

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2615
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2616
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2617
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2619
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2620
    ne $I1, 0, __label_5
.annotate 'line', 2621
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2623
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2626
    .return(0)
# }
.annotate 'line', 2627

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2630
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2632
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2633
    isa $I1, $P1, [ 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2634
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2636
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2637
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'S'
    if $S2 == $S3 goto __label_7
    set $S3, 'P'
    if $S2 == $S3 goto __label_8
    set $S3, 'I'
    if $S2 == $S3 goto __label_9
    set $S3, 'N'
    if $S2 == $S3 goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 2640
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2643
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2644
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 2646
    $P3('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2649

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 2652
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2654
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2655
    isa $I1, $P1, [ 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2656
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2658
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2659
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'S'
    if $S2 == $S3 goto __label_7
    set $S3, 'P'
    if $S2 == $S3 goto __label_8
    set $S3, 'I'
    if $S2 == $S3 goto __label_9
    set $S3, 'N'
    if $S2 == $S3 goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 2662
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2665
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2666
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 2668
    $P3('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2671

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Condition' ]
.annotate 'line', 2598
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2678
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2679
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Literal' ]
.annotate 'line', 2676
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2689
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2690
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2691

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2692
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2693
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2696
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2697
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2698
# typesinglequoted: $I1
    isa $I1, $P1, [ 'TokenSingleQuoted' ]
.annotate 'line', 2699
# need_unicode: $I2
    null $I2
.annotate 'line', 2700
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $I3, $P3
# {
.annotate 'line', 2701
    le $I3, 127, __label_4
# {
.annotate 'line', 2702
    set $I2, 1
    goto __label_3 # break
.annotate 'line', 2703
# }
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 2706
    unless $I2 goto __label_5
# {
.annotate 'line', 2707
    unless $I1 goto __label_6
# {
.annotate 'line', 2708
    null $I1
.annotate 'line', 2709
# saux: $S2
    set $S2, $S1
.annotate 'line', 2710
    set $S1, ''
.annotate 'line', 2711
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
  __label_7: # for iteration
    unless $P4 goto __label_8
    shift $S3, $P4
# {
.annotate 'line', 2712
    ne $S3, '\', __label_9
.annotate 'line', 2713
    set $S3, '\\'
  __label_9: # endif
.annotate 'line', 2714
    concat $S1, $S1, $S3
# }
    goto __label_7
  __label_8: # endfor
# }
  __label_6: # endif
.annotate 'line', 2717
# result: $S4
    set $S4, ''
.annotate 'line', 2718
    box $P2, $S1
    iter $P5, $P2
    set $P5, 0
  __label_10: # for iteration
    unless $P5 goto __label_11
    shift $S5, $P5
# {
.annotate 'line', 2719
# n: $I4
# predefined ord
    ord $I4, $S5
.annotate 'line', 2720
    le $I4, 127, __label_12
# {
.annotate 'line', 2721
# h: $S6
    box $P6, $I4
    $P2 = $P6.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
  __label_14:
.annotate 'line', 2722
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 2725
    concat $S4, $S4, $S5
  __label_13: # endif
# }
    goto __label_10
  __label_11: # endfor
.annotate 'line', 2727
    set $S1, $S4
# }
  __label_5: # endif
.annotate 'line', 2729
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
  __label_16:
    set $S7, '"'
  __label_15:
.annotate 'line', 2730
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2731
    unless $I2 goto __label_17
.annotate 'line', 2732
    concat $S0, 'unicode:', $S1
    set $S1, $S0
  __label_17: # endif
.annotate 'line', 2733
    .return($S1)
# }
.annotate 'line', 2734

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2737
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2738
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2739
    isa $I1, $P1, [ 'TokenQuoted' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 2740
# var s: $P2
    box $P2, $S1
.annotate 'line', 2741
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
  __label_2: # endif
.annotate 'line', 2743
    .return($S1)
# }
.annotate 'line', 2744

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2747
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2748
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2749

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2752
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2753

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2684
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2686
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
.annotate 'line', 2765
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2766
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2767
# n: $I1
    null $I1
.annotate 'line', 2768
    unless __ARG_4 goto __label_1
.annotate 'line', 2769
    set $I1, __ARG_3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2771
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 2772
    set $I1, $S1
# }
  __label_2: # endif
.annotate 'line', 2774
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2775

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2776
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2777
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2780
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
# predefined int
.annotate 'line', 2779
    set $I1, $S1
.annotate 'line', 2781
    .return($I1)
# }
.annotate 'line', 2782

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2785
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2786
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2787
    ne $I1, 0, __label_2
.annotate 'line', 2788
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2790
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2792

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2795
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2796

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2758
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2760
    addattribute $P0, 'pos'
.annotate 'line', 2761
    addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2806
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2807
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2808

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2809
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2810
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2813
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2814
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2815
    assign $P1, $S1
.annotate 'line', 2816
    .return($P1)
# }
.annotate 'line', 2817

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2820
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2821
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2822
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
  __label_1: # endif
# }
.annotate 'line', 2824

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2829
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2830
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_2
.annotate 'line', 2831
    concat $S1, $S1, '.0'
  __label_2: # endif
.annotate 'line', 2832
    .return($S1)
# }
.annotate 'line', 2833

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2801
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2803
    addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2841
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2844
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2845
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2846

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2849
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2850

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2853
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2854
    if_null $P1, __label_1
.annotate 'line', 2855
    .tailcall $P1.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 2857
    getattribute $P2, self, 'name'
    set $S1, $P2
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 2860
    .return('P')
  __label_4: # default
.annotate 'line', 2862
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2865

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2868
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2869
    .return($S1)
# }
.annotate 'line', 2870

.end # getName


.sub 'checkIdentifier' :method
# Body
# {
.annotate 'line', 2873
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2874
    unless_null $P1, __label_1
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 2875
    $P3('Bad thing')
  __label_1: # endif
.annotate 'line', 2876
# var desc: $P2
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'($P1)
.annotate 'line', 2877
# s: $S1
    null $S1
.annotate 'line', 2878
    unless_null $P2, __label_2
# {
.annotate 'line', 2879
# sname: $S2
    set $P4, $P1
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
# switch
.annotate 'line', 2880
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_7
    set $S4, 'null'
    if $S3 == $S4 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 2882
    set $S1, 'self'
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 2884
    set $S1, 'null'
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2886
    set $S1, ''
  __label_5: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 2890
    $P4 = $P2.'getreg'()
    set $S1, $P4
  __label_3: # endif
.annotate 'line', 2891
    .return($S1)
# }
.annotate 'line', 2892

.end # checkIdentifier


.sub 'getIdentifier' :method
# Body
# {
.annotate 'line', 2895
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2896
    set $S2, $P1
    ne $S2, '', __label_1
# {
.annotate 'line', 2897
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 2898
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    getattribute $P2, self, 'name'
    $P3($S2, $P2)
# }
  __label_1: # endif
.annotate 'line', 2900
    .return($P1)
# }
.annotate 'line', 2901

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2904
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2905
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2906
    if_null $P2, __label_1
# {
.annotate 'line', 2907
    $P3 = $P2.'isconst'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2908
    .tailcall $P2.'getvalue'()
  __label_2: # endif
.annotate 'line', 2909
# flags: $I1
    $P3 = $P2.'getflags'()
    set $I1, $P3
.annotate 'line', 2910
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2911
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 2912
    new $P4, [ 'LexicalVolatileExpr' ]
    $P4.'LexicalVolatileExpr'(self, $P2)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 2915
    .return(self)
# }
.annotate 'line', 2916

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2919
# id: $S1
    $P2 = self.'getIdentifier'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2920
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2921
# flags: $I1
    unless_null $P1, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = $P1.'getflags'()
  __label_2:
.annotate 'line', 2922
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 2923
    band $I3, $I1, 2
    unless $I3 goto __label_5
# {
.annotate 'line', 2924
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_6
    set $S2, $P2
  __label_6:
.annotate 'line', 2925
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_8
    isne $I2, $S2, ''
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 2926
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_7: # endif
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 2929
    .return($S1)
# }
.annotate 'line', 2930

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2933
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2934
    self.'annotate'(__ARG_1)
.annotate 'line', 2935
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2936
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 2938

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2941
    self.'annotate'(__ARG_1)
.annotate 'line', 2942
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 2943

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2946
    self.'annotate'(__ARG_1)
.annotate 'line', 2947
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# predefined die
.annotate 'line', 2948
    die "NO"
  __label_1: # endif
.annotate 'line', 2949
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2950
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 2951
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 2952
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 2955
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 2956
.const 'Sub' $P2 = 'WSubId_1'
.annotate 'line', 2958
    getattribute $P3, self, 'start'
    $P2("Can't assign null to that type", $P3)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 2961
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 2962
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 2964
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 2965
    ne $S3, 'v', __label_13
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 2966
    getattribute $P1, self, 'start'
    $P4("Can't assign from void expression", $P1)
  __label_13: # endif
.annotate 'line', 2967
    ne $S1, $S3, __label_14
# {
.annotate 'line', 2968
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 2971
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 2972
    self.'annotate'(__ARG_1)
.annotate 'line', 2973
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 2974
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 2976
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 2979
    .return($S2)
# }
.annotate 'line', 2980

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2838
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2840
    addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2990
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 2991
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2992

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2993
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2996
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2997
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2998
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 2999
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3000
    .return($S2)
# }
.annotate 'line', 3001

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3004
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3005
    self.'annotate'(__ARG_1)
.annotate 'line', 3006
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3007
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3009

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3012
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
# switch-case
.annotate 'line', 3014
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_4
.annotate 'line', 3017
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3015
    __ARG_1.'emitnull'($S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3018
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3021
# typeright: $S2
    $P2 = __ARG_2.'checkresult'()
    null $S2
    if_null $P2, __label_6
    set $S2, $P2
  __label_6:
.annotate 'line', 3022
    ne 'P', $S2, __label_7
.annotate 'line', 3023
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3025
# rreg: $S3
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_9
    set $S3, $P3
  __label_9:
.annotate 'line', 3026
    self.'annotate'(__ARG_1)
.annotate 'line', 3027
    __ARG_1.'emitbox'($S1, $S3)
# }
  __label_8: # endif
  __label_2: # switch end
.annotate 'line', 3031
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3032
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
.annotate 'line', 3033
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 3034

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2985
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2987
    addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3043
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3044

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExpr' ]
.annotate 'line', 3039
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
.annotate 'line', 3055
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3056
.const 'Sub' $P3 = 'WSubId_48'
    $P2 = $P3(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3057

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3058
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3061
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3064
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3065
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3066
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3067
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3068
    __ARG_1.'say'()
# }
.annotate 'line', 3069

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 3049
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3051
    addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3079
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3080
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3081

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3084
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3085

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3088
    self.'optimizearg'()
.annotate 'line', 3089
    .return(self)
# }
.annotate 'line', 3090

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 3074
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3076
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
.annotate 'line', 3101
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3102
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3103
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3104

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3107
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3108
    .return(self)
# }
.annotate 'line', 3109

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3112
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3113

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3116
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3117
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3118

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3121
    self.'optimizearg'()
.annotate 'line', 3122
    .return(self)
# }
.annotate 'line', 3123

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3126
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3127

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3130
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3131

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 3095
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3097
    addattribute $P0, 'lexpr'
.annotate 'line', 3098
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3140
    .return('I')
# }
.annotate 'line', 3141

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3144
    self.'optimizearg'()
.annotate 'line', 3145
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3146
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3147
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3148
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3149
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3150
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    $P6 = self.'do_op'($I1, $I2)
    .tailcall $P4($P3, $P5, $P6)
# }
  __label_1: # endif
.annotate 'line', 3152
    .return(self)
# }
.annotate 'line', 3153

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 3136
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3162
    .return('I')
# }
.annotate 'line', 3163

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 3158
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
.annotate 'line', 3171
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3172

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3175
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3176
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3177
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3178
    self.'annotate'(__ARG_1)
.annotate 'line', 3179
    __ARG_1.'print'('    delete ')
.annotate 'line', 3180
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3181
    __ARG_1.'say'()
.annotate 'line', 3182
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3183
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 3186
    getattribute $P2, self, 'start'
    $P3("delete with invalid operator", $P2)
  __label_2: # endif
# }
.annotate 'line', 3187

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3167
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
.annotate 'line', 3194
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3195

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3198
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3199
# reg: $S1
    set $S2, __ARG_2
    eq $S2, '', __label_2
    set $P2, __ARG_2
    goto __label_1
  __label_2:
    $P2 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 3200
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3201
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3202
    self.'annotate'(__ARG_1)
.annotate 'line', 3203
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3204
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3205
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 3208
    getattribute $P2, self, 'start'
    $P3("exists with invalid operator", $P2)
  __label_5: # endif
# }
.annotate 'line', 3209

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3190
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
.annotate 'line', 3218
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3219

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3222
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3223

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3226
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3227
    .return(self)
# }
.annotate 'line', 3228

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3231
    self.'optimizearg'()
.annotate 'line', 3232
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3233
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3234
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3235
.const 'Sub' $P6 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $I2, $I1
    .tailcall $P6($P3, $P4, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3238
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 3239
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3240
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3241
.const 'Sub' $P7 = 'WSubId_49'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $N2, $N1
    .tailcall $P7($P3, $P4, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3244
    .return(self)
# }
.annotate 'line', 3245

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3248
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3249
    self.'annotate'(__ARG_1)
.annotate 'line', 3250
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3251

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3214
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
.annotate 'line', 3260
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3261

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3262
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3265
    .return('I')
# }
.annotate 'line', 3266

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3269
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3270
    .return(self)
# }
.annotate 'line', 3271

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3274
    self.'optimizearg'()
.annotate 'line', 3275
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3276
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3277
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3278
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3279
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, $P1, 'start'
    not $I2, $I1
    .tailcall $P4($P3, $P5, $I2)
# }
  __label_1: # endif
.annotate 'line', 3281
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 3282
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3283
    .return(self)
# }
.annotate 'line', 3284

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3287
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3288

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3291
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3292
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3293
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3294
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3296
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3299
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3302
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3304

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3256
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3313
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3314

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpIncDec' ]
.annotate 'line', 3309
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3323
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3324
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3325
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3326

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncDec' ]
.annotate 'line', 3319
    get_class $P1, [ 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3333
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3334

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3337
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3338
    self.'annotate'(__ARG_1)
.annotate 'line', 3339
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3340
    .return($S1)
# }
.annotate 'line', 3341

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3329
    get_class $P1, [ 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3348
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3349

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3352
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3353
    self.'annotate'(__ARG_1)
.annotate 'line', 3354
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3355
    .return($S1)
# }
.annotate 'line', 3356

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3344
    get_class $P1, [ 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3365
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3366

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3369
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3370
    self.'annotate'(__ARG_1)
.annotate 'line', 3371
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3372
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3373
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3374
    .return($S1)
# }
.annotate 'line', 3375

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3361
    get_class $P1, [ 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3382
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3383

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3386
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3387
    self.'annotate'(__ARG_1)
.annotate 'line', 3388
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3389
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3390
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3391
    .return($S1)
# }
.annotate 'line', 3392

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3378
    get_class $P1, [ 'OpIncDec' ]
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
.annotate 'line', 3403
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3404
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3405
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3406
    .return(self)
# }
.annotate 'line', 3407

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3410
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3411

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3414
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3415
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3416
    .return(self)
# }
.annotate 'line', 3417

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3420
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3421

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3424
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3425
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3426
    self.'annotate'(__ARG_1)
.annotate 'line', 3427
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3429

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3397
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3399
    addattribute $P0, 'lexpr'
.annotate 'line', 3400
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3438
    self.'annotate'(__ARG_1)
.annotate 'line', 3439
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3440
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3441

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3434
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3450
    self.'annotate'(__ARG_1)
.annotate 'line', 3451
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3452
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3453
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3454

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3457
    self.'annotate'(__ARG_1)
.annotate 'line', 3458
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3459
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3460
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3461
    .return($S1)
# }
.annotate 'line', 3462

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3446
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3471
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3472
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3473
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3474
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3475
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3476
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3477
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3479
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3480
# aux: $S5
    null $S5
.annotate 'line', 3481
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3482
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3484
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3485
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3486
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3487
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3489
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3493
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3494
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3495
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3496
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3498
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3501
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3504
    .return($S3)
# }
.annotate 'line', 3505

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3467
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3514
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3515
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3516
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3517
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3518
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3519
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3520
# aux: $S5
    null $S5
.annotate 'line', 3521
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3522
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 3524
    getattribute $P3, self, 'start'
    $P4("-= can't be applied to string", $P3)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3527
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3528
    $P5 = self.'tempreg'($S1)
    set $S5, $P5
.annotate 'line', 3529
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3530
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3532
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3535
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3537
    .return($S3)
# }
.annotate 'line', 3538

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3510
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3547
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3548
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3549
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3550
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3551
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3553
    ne $S2, 'I', __label_7
.annotate 'line', 3554
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3556
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3557
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3559
    self.'annotate'(__ARG_1)
.annotate 'line', 3560
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3563
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3564
    self.'annotate'(__ARG_1)
.annotate 'line', 3565
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3567
    .return($S3)
# }
.annotate 'line', 3568

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3543
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3577
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3578
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3579
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3580
    self.'annotate'(__ARG_1)
.annotate 'line', 3581
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3582
    .return($S2)
# }
.annotate 'line', 3583

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3573
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3592
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3593
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3594
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3595
    self.'annotate'(__ARG_1)
.annotate 'line', 3596
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3597
    .return($S2)
# }
.annotate 'line', 3598

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3588
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3605
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3608
    self.'optimizearg'()
.annotate 'line', 3609
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3610
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3611
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3612
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3613
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3614
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    $P6 = self.'int_op'($I1, $I2)
    .tailcall $P4($P3, $P5, $P6)
# }
  __label_1: # endif
.annotate 'line', 3616
    .return(self)
# }
.annotate 'line', 3617

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3620
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3621
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3622
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3623
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3624
    self.'annotate'(__ARG_1)
.annotate 'line', 3625
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3627
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3632
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3637
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3642
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 3647
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 3652
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3628
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3629
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3630
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3633
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3634
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3635
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3638
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3639
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3640
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3643
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3644
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3645
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 3648
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3649
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3650
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 3653
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3654
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3655
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 3656
# switch
.annotate 'line', 3659
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 3661
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 3664
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 3667
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 3668
# }
.annotate 'line', 3670

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3673
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3674

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3677
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3678

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3681
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3682

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3603
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
.annotate 'line', 3697
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3698
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3699
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3700

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3701
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3702
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3705
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3706
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3707
    .return(self)
# }
.annotate 'line', 3708

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3711
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3712
    self.'annotate'(__ARG_1)
.annotate 'line', 3713
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3714
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 3715
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 3716

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3719
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3720
    self.'annotate'(__ARG_1)
.annotate 'line', 3721
    getattribute $P1, self, 'checknull'
    if_null $P1, __label_3
    unless $P1 goto __label_3
    set $S2, 'unless'
    goto __label_2
  __label_3:
    set $S2, 'if'
  __label_2:
    __ARG_1.'say'('    ', $S2, '_null ', $S1, ', ', __ARG_2)
# }
.annotate 'line', 3722

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3690
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3692
    addattribute $P0, 'expr'
.annotate 'line', 3693
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3729
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3732
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3733

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3736
    self.'optimizearg'()
.annotate 'line', 3737
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3738
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3739
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3740
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3741
    unless $I1 goto __label_1
# {
.annotate 'line', 3742
    unless $I2 goto __label_2
.annotate 'line', 3743
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    .tailcall $P4($P3, $P5, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3745
    new $P7, [ 'NullCheckerExpr' ]
    getattribute $P8, self, 'rexpr'
    $P7.'NullCheckerExpr'(self, $P8, 1)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3747
    unless $I2 goto __label_4
.annotate 'line', 3748
    new $P5, [ 'NullCheckerExpr' ]
    getattribute $P6, self, 'lexpr'
    $P5.'NullCheckerExpr'(self, $P6, 1)
    set $P3, $P5
    .return($P3)
  __label_4: # endif
.annotate 'line', 3749
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3750
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3751
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3752
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3753
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3755
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3756
# ri: $I4
# predefined int
    getattribute $P5, $P2, 'numval'
    set $I4, $P5
.annotate 'line', 3757
.const 'Sub' $P9 = 'WSubId_16'
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall $P9($P6, $P7, $I5)
  __label_13: # case
.annotate 'line', 3759
# ls: $S3
    getattribute $P10, $P1, 'strval'
    getattribute $P8, $P10, 'str'
    null $S3
    if_null $P8, __label_14
    set $S3, $P8
  __label_14:
.annotate 'line', 3760
# rs: $S4
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_15
    set $S4, $P11
  __label_15:
.annotate 'line', 3761
.const 'Sub' $P13 = 'WSubId_16'
    getattribute $P14, self, 'owner'
    getattribute $P15, self, 'start'
    iseq $I6, $S3, $S4
    .tailcall $P13($P14, $P15, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_5: # endif
.annotate 'line', 3765
    .return(self)
# }
.annotate 'line', 3766

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3769
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3770

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3773
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3774

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3777
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3778

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3781
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3782

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3727
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3789
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3792
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3793

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3796
    self.'optimizearg'()
.annotate 'line', 3797
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3798
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3799
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3800
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3801
    unless $I1 goto __label_1
# {
.annotate 'line', 3802
    unless $I2 goto __label_2
.annotate 'line', 3803
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    .tailcall $P4($P3, $P5, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 3805
    new $P7, [ 'NullCheckerExpr' ]
    getattribute $P8, self, 'rexpr'
    $P7.'NullCheckerExpr'(self, $P8, 0)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3807
    unless $I2 goto __label_4
.annotate 'line', 3808
    new $P5, [ 'NullCheckerExpr' ]
    getattribute $P6, self, 'lexpr'
    $P5.'NullCheckerExpr'(self, $P6, 0)
    set $P3, $P5
    .return($P3)
  __label_4: # endif
.annotate 'line', 3809
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3810
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3811
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3812
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3813
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3815
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3816
# ri: $I4
# predefined int
    getattribute $P5, $P2, 'numval'
    set $I4, $P5
.annotate 'line', 3817
.const 'Sub' $P9 = 'WSubId_16'
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    isne $I5, $I3, $I4
    .tailcall $P9($P6, $P7, $I5)
  __label_13: # case
.annotate 'line', 3819
# ls: $S3
    getattribute $P10, $P1, 'strval'
    getattribute $P8, $P10, 'str'
    null $S3
    if_null $P8, __label_14
    set $S3, $P8
  __label_14:
.annotate 'line', 3820
# rs: $S4
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_15
    set $S4, $P11
  __label_15:
.annotate 'line', 3821
.const 'Sub' $P13 = 'WSubId_16'
    getattribute $P14, self, 'owner'
    getattribute $P15, self, 'start'
    isne $I6, $S3, $S4
    .tailcall $P13($P14, $P15, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_5: # endif
.annotate 'line', 3825
    .return(self)
# }
.annotate 'line', 3826

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3829
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3830

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3833
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3834

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3837
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3838

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3841
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3842

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3787
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
.annotate 'line', 3852
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3853
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3854

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3855
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3858
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3859
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
.annotate 'line', 3860

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3863
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    iseq $I1, __ARG_1, __ARG_2
    goto __label_1
  __label_2:
    isne $I1, __ARG_1, __ARG_2
  __label_1:
    .return($I1)
# }
.annotate 'line', 3864

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3867
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3868
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 3869
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3870

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3873
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3874

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3877
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3878
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 3879
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3880

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3883
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3884
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 3885
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3886

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3847
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3849
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3893
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3896
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3897

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3900
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3901

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3904
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3905

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3908
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3909

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3912
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3913

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3891
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3920
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3923
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3924

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3927
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3928

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3931
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3932

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3935
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3936

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3939
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3940

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3918
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3947
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3950
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3951

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3954
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3955

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3958
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3959

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3962
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3963

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3966
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3967

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3945
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3974
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3977
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3978

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3981
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3982

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3985
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3986

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3989
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3990

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3993
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3994

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3972
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4003
    .return('I')
# }
.annotate 'line', 4004

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3999
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
.annotate 'line', 4013
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4014

.end # OpBoolAndExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4017
    self.'optimizearg'()
.annotate 'line', 4018
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4019
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4020
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4021
    eq $I1, 0, __label_2
.annotate 'line', 4022
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4024
.const 'Sub' $P5 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall $P5($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4026
    .return(self)
# }
.annotate 'line', 4027

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4030
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4031
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4032
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4033
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4034
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4037
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4038
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4039
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4040
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4041
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4043

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 4009
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
.annotate 'line', 4052
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4053

.end # OpBoolOrExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4056
    self.'optimizearg'()
.annotate 'line', 4057
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4058
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4059
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4060
    ne $I1, 0, __label_2
.annotate 'line', 4061
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4063
.const 'Sub' $P5 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall $P5($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4065
    .return(self)
# }
.annotate 'line', 4066

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4069
# res: $S1
    null $S1
.annotate 'line', 4070
    if_null __ARG_2, __label_1
.annotate 'line', 4071
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4073
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4074
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4075
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4076
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4077
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4080
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4081
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4082
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4083
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4084
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4086

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 4048
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 4091
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
.annotate 'line', 4101
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4102

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4105
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4106
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4107
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4108
    self.'annotate'(__ARG_1)
.annotate 'line', 4109
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4110

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4113
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4114

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 4097
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
.annotate 'line', 4123
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4124

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4127
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4128
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4129
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4130
    self.'annotate'(__ARG_1)
.annotate 'line', 4131
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4132

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4135
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4136

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 4119
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
.annotate 'line', 4145
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4146

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4149
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4150
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4151
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4152
    self.'annotate'(__ARG_1)
.annotate 'line', 4153
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4154

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4157
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4158

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 4141
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
.annotate 'line', 4168
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4170
    isa $I1, __ARG_3, [ 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4177
    isa $I1, __ARG_4, [ 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4171
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4172
    isa $I2, __ARG_4, [ 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4173
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4175
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4178
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4179
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4182
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4184

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4185
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4188
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4189
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4190
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4191
# i: $I2
    null $I2
# for loop
.annotate 'line', 4192
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4193
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4192
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4194
    .return($P2)
# }
.annotate 'line', 4195

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4198
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4199
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4200
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4201
    self.'annotate'(__ARG_1)
.annotate 'line', 4202
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4203
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4204
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_1: # for iteration
.annotate 'line', 4203
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4205
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4206

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4209
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4210
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4211
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4212
    self.'annotate'(__ARG_1)
.annotate 'line', 4213
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4214
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4215
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4214
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4216
    .return($S1)
# }
.annotate 'line', 4217

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4220
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4221
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4222
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4223
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4224
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4223
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4225

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4228
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4229
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4230
    self.'annotate'(__ARG_1)
.annotate 'line', 4231
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4232
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4233
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4232
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4234

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 4163
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4165
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
.annotate 'line', 4243
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4244

.end # OpAddExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4247
    self.'optimizearg'()
.annotate 'line', 4248
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4249
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4250
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 4251
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_2
    set $S2, $P10
  __label_2:
.annotate 'line', 4252
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4253
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4258
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4259
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4260
# var t: $P5
    isa $I3, $P3, [ 'TokenSingleQuoted' ]
    unless $I3 goto __label_9
.annotate 'line', 4261
    isa $I3, $P4, [ 'TokenSingleQuoted' ]
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4263
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4264
    getattribute $P13, $P3, 'str'
.annotate 'line', 4260
    set $S3, $P13
# predefined string
.annotate 'line', 4264
    getattribute $P14, $P4, 'str'
.annotate 'line', 4260
    set $S4, $P14
.annotate 'line', 4264
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_7
  __label_8:
.annotate 'line', 4266
    new $P15, [ 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4267
    $P18 = $P3.'getasquoted'()
.annotate 'line', 4260
    set $S6, $P18
# predefined string
.annotate 'line', 4267
    $P19 = $P4.'getasquoted'()
.annotate 'line', 4260
    set $S7, $P19
.annotate 'line', 4267
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
  __label_7:
.annotate 'line', 4268
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
  __label_5: # endif
.annotate 'line', 4270
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4271
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4272
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4273
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4274
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4275
.const 'Sub' $P20 = 'WSubId_16'
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall $P20($P10, $P11, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4278
.const 'Sub' $P21 = 'WSubId_50'
    $P10 = $P21($S1, $S2)
    if_null $P10, __label_12
    unless $P10 goto __label_12
# {
.annotate 'line', 4279
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4280
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4281
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4282
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4283
.const 'Sub' $P22 = 'WSubId_49'
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall $P22($P10, $P11, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4287
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4288
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
  __label_13: # endif
.annotate 'line', 4290
    .return(self)
# }
.annotate 'line', 4291

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4294
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4295
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4296
    ne $S1, $S2, __label_3
.annotate 'line', 4297
    .return($S1)
  __label_3: # endif
.annotate 'line', 4298
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4299
    .return('S')
  __label_4: # endif
.annotate 'line', 4300
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4301
    .return('S')
  __label_6: # endif
.annotate 'line', 4302
.const 'Sub' $P3 = 'WSubId_50'
    $P1 = $P3($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4303
    .return('N')
  __label_8: # endif
.annotate 'line', 4304
    .return('I')
# }
.annotate 'line', 4305

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4308
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4309
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4310
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4311
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4312
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4314
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4315
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4316
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4317
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4318
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4319
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4320
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4321
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4324
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4325
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4328
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4331
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4332
# l: $S7
    null $S7
.annotate 'line', 4333
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4335
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4336
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4338
# r: $S8
    null $S8
.annotate 'line', 4339
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4341
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4342
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4344
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4347
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4349

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4239
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
.annotate 'line', 4358
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4359

.end # OpSubExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4362
    self.'optimizearg'()
.annotate 'line', 4363
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4364
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4365
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4366
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4367
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4368
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4369
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4370
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4371
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4372
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4373
.const 'Sub' $P6 = 'WSubId_16'
    getattribute $P5, self, 'owner'
    getattribute $P7, self, 'start'
    sub $I3, $I1, $I2
    .tailcall $P6($P5, $P7, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4376
    .return(self)
# }
.annotate 'line', 4377

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4380
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4381
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4382
    ne $S1, $S2, __label_3
.annotate 'line', 4383
    .return($S1)
  __label_3: # endif
.annotate 'line', 4384
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4385
    .return('N')
  __label_4: # endif
.annotate 'line', 4386
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4387
    .return('N')
  __label_6: # endif
.annotate 'line', 4388
    .return('I')
# }
.annotate 'line', 4389

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4392
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4393
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4394
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4395

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4354
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
.annotate 'line', 4404
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4405

.end # OpMulExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4408
    self.'optimizearg'()
.annotate 'line', 4409
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4410
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4411
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4412
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 4413
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_4
    set $S2, $P7
  __label_4:
.annotate 'line', 4414
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4415
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4416
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4417
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4418
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4419
.const 'Sub' $P8 = 'WSubId_16'
    getattribute $P7, self, 'owner'
    getattribute $P9, self, 'start'
    mul $I3, $I1, $I2
    .tailcall $P8($P7, $P9, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4422
.const 'Sub' $P10 = 'WSubId_50'
    $P7 = $P10($S1, $S2)
    if_null $P7, __label_7
    unless $P7 goto __label_7
# {
.annotate 'line', 4423
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4424
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4425
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4426
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4427
.const 'Sub' $P11 = 'WSubId_49'
    getattribute $P7, self, 'owner'
    getattribute $P9, self, 'start'
    mul $N3, $N1, $N2
    .tailcall $P11($P7, $P9, $N3)
# }
  __label_7: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4431
    .return(self)
# }
.annotate 'line', 4432

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4435
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4436
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4437
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4438
    ne $S1, $S2, __label_3
.annotate 'line', 4439
    .return($S1)
  __label_3: # endif
.annotate 'line', 4440
    ne $S1, 'S', __label_4
.annotate 'line', 4441
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4443
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4444

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4447
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4448
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4449
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4450
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4451
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4452
    ne $S1, 'S', __label_3
# {
.annotate 'line', 4453
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4454
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4455
# rval: $S5
    null $S5
# switch
.annotate 'line', 4456
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 4458
    set $S5, $S4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 4461
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4462
    __ARG_1.'emitset'($S5, $S4)
  __label_4: # switch end
.annotate 'line', 4464
    self.'annotate'(__ARG_1)
.annotate 'line', 4465
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4466
    .return()
# }
  __label_3: # endif
.annotate 'line', 4468
    iseq $I3, $S1, $S2
    unless $I3 goto __label_8
    iseq $I3, $S1, 'I'
    if $I3 goto __label_10
    iseq $I3, $S1, 'N'
  __label_10:
    if $I3 goto __label_9
    iseq $I3, $S1, 'P'
  __label_9:
  __label_8:
    unless $I3 goto __label_7
# {
.annotate 'line', 4469
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4470
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4471
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4472
    .return()
# }
  __label_7: # endif
.annotate 'line', 4477
    ne $S1, 'N', __label_11
# {
.annotate 'line', 4478
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4479
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4480
# rval: $S6
    null $S6
# switch
.annotate 'line', 4481
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_14
    set $S8, 'N'
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 4483
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4484
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4485
    set $S6, $S4
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4488
    set $S6, $S4
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 4491
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4492
    __ARG_1.'emitset'($S6, $S4)
  __label_12: # switch end
.annotate 'line', 4494
    set $S7, __ARG_2
    eq $S7, '', __label_16
# {
.annotate 'line', 4495
    self.'annotate'(__ARG_1)
.annotate 'line', 4496
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
  __label_16: # endif
.annotate 'line', 4498
    .return()
# }
  __label_11: # endif
.annotate 'line', 4501
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4502
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_19
    $I3 = $P1.'isidentifier'()
  __label_19:
    unless $I3 goto __label_17
# {
.annotate 'line', 4503
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4504
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4507
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4508
    set $S3, $I1
# }
  __label_18: # endif
.annotate 'line', 4510
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_22
    $I3 = $P2.'isidentifier'()
  __label_22:
    unless $I3 goto __label_20
# {
.annotate 'line', 4511
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4512
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_21
  __label_20: # else
# {
# switch
.annotate 'line', 4515
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_25
    set $S8, 'N'
    if $S7 == $S8 goto __label_26
    set $S8, 'I'
    if $S7 == $S8 goto __label_27
    goto __label_24
  __label_25: # case
.annotate 'line', 4517
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4518
    $P2.'emit'(__ARG_1, $S4)
    goto __label_23 # break
  __label_26: # case
.annotate 'line', 4521
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_23 # break
  __label_27: # case
  __label_24: # default
.annotate 'line', 4525
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4526
    set $S4, $I2
    goto __label_23 # break
  __label_23: # switch end
.annotate 'line', 4527
# }
  __label_21: # endif
.annotate 'line', 4530
    self.'annotate'(__ARG_1)
.annotate 'line', 4531
    set $S7, __ARG_2
    ne $S7, '', __label_28
.annotate 'line', 4532
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_28: # endif
.annotate 'line', 4533
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4534

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4400
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
.annotate 'line', 4543
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4544

.end # OpDivExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4547
    self.'optimizearg'()
.annotate 'line', 4548
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4549
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4550
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4551
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4552
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4553
# var lval: $P3
    null $P3
.annotate 'line', 4554
# var rval: $P4
    null $P4
.annotate 'line', 4555
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4556
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4557
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4558
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4559
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4560
    eq $I2, 0, __label_7
.annotate 'line', 4561
.const 'Sub' $P6 = 'WSubId_16'
    getattribute $P5, self, 'owner'
    getattribute $P7, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall $P6($P5, $P7, $N3)
  __label_7: # endif
# }
  __label_5: # endif
# {
.annotate 'line', 4564
.const 'Sub' $P8 = 'WSubId_50'
    $P5 = $P8($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4565
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4566
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4567
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4568
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4569
    set $N3, 0
    eq $N2, $N3, __label_9
.annotate 'line', 4570
.const 'Sub' $P9 = 'WSubId_49'
    getattribute $P5, self, 'owner'
    getattribute $P7, self, 'start'
    div $N4, $N1, $N2
    .tailcall $P9($P5, $P7, $N4)
  __label_9: # endif
# }
  __label_8: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4574
    .return(self)
# }
.annotate 'line', 4575

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4578
    .return('N')
# }
.annotate 'line', 4579

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4582
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4583
# var aux: $P2
    null $P2
.annotate 'line', 4584
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4585
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4586
    $P2 = self.'tempreg'('N')
.annotate 'line', 4587
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4588
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4590
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4591
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4592
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4593
    $P2 = self.'tempreg'('N')
.annotate 'line', 4594
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4595
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4597
    self.'annotate'(__ARG_1)
.annotate 'line', 4598
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4599

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4539
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
.annotate 'line', 4608
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4609

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4612
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4613
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4614
    self.'annotate'(__ARG_1)
.annotate 'line', 4615
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4616

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4619
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4620

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4604
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
.annotate 'line', 4629
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4630

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4633
    .return('I')
# }
.annotate 'line', 4634

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4637
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4638
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4639
    self.'annotate'(__ARG_1)
.annotate 'line', 4644
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4645

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4625
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
.annotate 'line', 4654
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4655

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4658
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4659
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4660
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4661
    self.'annotate'(__ARG_1)
.annotate 'line', 4662
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4663

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4666
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4667

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4650
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
.annotate 'line', 4676
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4677

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4680
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4681
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4682
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4683
    self.'annotate'(__ARG_1)
.annotate 'line', 4684
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4685

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4688
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4689

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4672
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4698
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4699

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4702
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4703
# setname: $S1
    set $S1, ''
.annotate 'line', 4704
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 4705
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 4707
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 4710
    set $I2, 1
# switch
.annotate 'line', 4711
    $P6 = $P1.'numargs'()
    set $I3, $P6
    null $I4
    if $I3 == $I4 goto __label_9
    set $I4, 1
    if $I3 == $I4 goto __label_10
    goto __label_8
  __label_9: # case
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 4715
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4716
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.const 'Sub' $P8 = 'WSubId_1'
.annotate 'line', 4717
    getattribute $P9, self, 'start'
    $P8('Invalid modifier', $P9)
  __label_11: # endif
.annotate 'line', 4718
    $P10 = $P2.'getPirString'()
    set $S1, $P10
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 4719
.const 'Sub' $P11 = 'WSubId_1'
.annotate 'line', 4721
    getattribute $P12, self, 'start'
    $P11('Invalid modifier', $P12)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 4726
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 4729
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 4732
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 4727
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4730
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 4733
    __ARG_1.'print'(' :named')
.annotate 'line', 4734
    eq $S1, '', __label_17
.annotate 'line', 4735
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 4736
# }
.annotate 'line', 4738

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentModifierList' ]
.annotate 'line', 4694
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4747
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4748
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4749

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4752
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4753
    .return(self)
# }
.annotate 'line', 4754

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4757
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4758

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4743
    addattribute $P0, 'arg'
.annotate 'line', 4744
    addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'parseArgument'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4763
# var modifier: $P1
    null $P1
.annotate 'line', 4764
# var expr: $P2
.const 'Sub' $P4 = 'WSubId_30'
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4765
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4766
    $P5 = $P3.'isop'(':')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 4767
    $P3 = __ARG_1.'get'()
.annotate 'line', 4768
    $P5 = $P3.'isop'('[')
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 4769
    new $P6, [ 'ArgumentModifierList' ]
    $P6.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P6
# }
    goto __label_4
  __label_3: # else
.const 'Sub' $P7 = 'WSubId_29'
.annotate 'line', 4772
    $P7('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 4775
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 4776
    new $P6, [ 'Argument' ]
    $P6.'Argument'($P2, $P1)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 4777

.end # parseArgument

.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4788
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4789
    setattribute self, 'start', __ARG_2
.annotate 'line', 4790
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 4791
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 4792
    __ARG_3.'unget'($P1)
.annotate 'line', 4793
.const 'Sub' $P3 = 'parseArgument'
.annotate 'line', 4794
.const 'Sub' $P5 = 'WSubId_27'
    $P4 = $P5(__ARG_3, __ARG_1, $P3, __ARG_4)
    setattribute self, 'args', $P4
# }
  __label_1: # endif
# }
.annotate 'line', 4796

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4799
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4800
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
.annotate 'line', 4798
    elements $I1, $P1
  __label_1:
.annotate 'line', 4800
    .return($I1)
# }
.annotate 'line', 4801

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4804
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4805

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4808
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4809
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4810

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4813
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4814
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 4815

.end # getfreearg


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 4818
    getattribute $P2, self, 'args'
    $P1($P2)
.annotate 'line', 4819
    .return(self)
# }
.annotate 'line', 4820

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4823
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4824
    unless_null $P1, __label_1
# {
.annotate 'line', 4825
    new $P2, ['ResizableStringArray']
.annotate 'line', 4826
# pnull: $S1
    set $S1, ''
.annotate 'line', 4827
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4828
    if_null $P3, __label_2
# {
.annotate 'line', 4829
    iter $P6, $P3
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P4, $P6
# {
.annotate 'line', 4830
# var arg: $P5
    getattribute $P5, $P4, 'arg'
.annotate 'line', 4831
# reg: $S2
    null $S2
.annotate 'line', 4832
    $P7 = $P5.'isnull'()
    if_null $P7, __label_5
    unless $P7 goto __label_5
# {
.annotate 'line', 4833
    ne $S1, '', __label_7
# {
.annotate 'line', 4834
    getattribute $P9, self, 'owner'
    $P8 = $P9.'tempreg'('P')
    set $S1, $P8
.annotate 'line', 4835
    __ARG_1.'emitnull'($S1)
# }
  __label_7: # endif
.annotate 'line', 4837
    set $S2, $S1
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 4840
    $P7 = $P5.'emit_get'(__ARG_1)
    set $S2, $P7
  __label_6: # endif
.annotate 'line', 4841
# predefined push
    push $P2, $S2
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
.annotate 'line', 4844
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 4846
    .return($P1)
# }
.annotate 'line', 4847

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4850
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4851
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4853
# sep: $S1
    set $S1, ''
.annotate 'line', 4854
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 4855
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4856
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 4857
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 4858
    if_null $P3, __label_4
.annotate 'line', 4859
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 4860
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 4855
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4862

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4781
    addattribute $P0, 'owner'
.annotate 'line', 4782
    addattribute $P0, 'start'
.annotate 'line', 4783
    addattribute $P0, 'args'
.annotate 'line', 4784
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue' :subid('WSubId_51')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4867
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 4868
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 4869
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 4870
    .return(1)
# }
.annotate 'line', 4871

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4882
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4883
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4884
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4885

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4888
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4889

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4892
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4893
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4894
    new $P3, ['ResizableStringArray']
.annotate 'line', 4895
# var arg: $P4
    null $P4
.annotate 'line', 4896
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 4897
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4899
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 4900
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 4902
    ne $S2, 'null', __label_8
# {
.annotate 'line', 4903
    ne $S1, '', __label_9
# {
.annotate 'line', 4904
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4905
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 4907
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 4909
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4913
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4914
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 4915
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 4916
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4917
    .return()
  __label_2: # default
.annotate 'line', 4919
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 4920
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 4921
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4922
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 4923
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 4924
# argr: $S5
    null $S5
.annotate 'line', 4925
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 4926
    set $S7, $S4
    set $S8, 'I'
    if $S7 == $S8 goto __label_21
    set $S8, 'N'
    if $S7 == $S8 goto __label_22
    set $S8, 'S'
    if $S7 == $S8 goto __label_23
    goto __label_20
  __label_21: # case
  __label_22: # case
  __label_23: # case
.annotate 'line', 4930
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4931
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 4934
    ne $S1, '', __label_24
# {
.annotate 'line', 4935
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 4936
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 4938
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4942
    iseq $I3, $S3, $S4
    if $I3 goto __label_27
    iseq $I3, $S4, '?'
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 4943
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 4945
# aux: $S6
    null $S6
.annotate 'line', 4946
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 4947
    set $S7, $S4
    set $S8, 'P'
    if $S7 == $S8 goto __label_30
    set $S8, 'I'
    if $S7 == $S8 goto __label_31
    set $S8, 'N'
    if $S7 == $S8 goto __label_32
    set $S8, 'S'
    if $S7 == $S8 goto __label_33
    goto __label_29
  __label_30: # case
# switch
.annotate 'line', 4949
    set $S9, $S3
    set $S10, 'I'
    if $S9 == $S10 goto __label_36
    set $S10, 'N'
    if $S9 == $S10 goto __label_37
    set $S10, 'S'
    if $S9 == $S10 goto __label_38
    goto __label_35
  __label_36: # case
  __label_37: # case
  __label_38: # case
.annotate 'line', 4953
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4954
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_34 # break
  __label_35: # default
.annotate 'line', 4957
    $P4.'emit'(__ARG_1, $S5)
  __label_34: # switch end
    goto __label_28 # break
  __label_31: # case
  __label_32: # case
  __label_33: # case
.annotate 'line', 4963
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4964
    __ARG_1.'emitset'($S5, $S6)
    goto __label_28 # break
  __label_29: # default
.annotate 'line', 4967
    $P4.'emit'(__ARG_1, $S5)
  __label_28: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 4971
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 4920
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 4974
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4975

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4875
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4877
    addattribute $P0, 'predef'
.annotate 'line', 4878
    addattribute $P0, 'args'
.end
.namespace [ ]

.sub 'genpredefcallexpr' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 4982
# callname: $S1
    $P3 = __ARG_2.'name'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4983
    __ARG_1.'use_predef'($S1)
.annotate 'line', 4984
# nargs: $I1
    unless_null __ARG_3, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_3.'numargs'()
  __label_2:
.annotate 'line', 4985
# var rawargs: $P1
    ne $I1, 0, __label_5
    root_new $P3, ['parrot';'ResizablePMCArray']
    set $P1, $P3
    goto __label_4
  __label_5:
    $P1 = __ARG_3.'getrawargs'()
  __label_4:
.annotate 'line', 4988
    isa $I2, __ARG_2, [ 'PredefFunctionEval' ]
    unless $I2 goto __label_6
# {
.annotate 'line', 4989
.const 'Sub' $P5 = 'WSubId_51'
    $P3 = $P5($P1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 4990
# var evalfun: $P2
    getattribute $P2, __ARG_2, 'evalfun'
.annotate 'line', 4991
    getattribute $P3, __ARG_1, 'owner'
    getattribute $P4, __ARG_1, 'start'
    .tailcall $P2($P3, $P4, $P1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 4995
    new $P4, [ 'CallPredefExpr' ]
    getattribute $P6, __ARG_1, 'owner'
    getattribute $P7, __ARG_1, 'start'
    $P4.'CallPredefExpr'($P6, $P7, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 4996

.end # genpredefcallexpr

.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5006
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5007
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5008
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5009
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5010
    __ARG_1.'unget'($P1)
.annotate 'line', 5011
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5013

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5014
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5017
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 5018
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5019
# nargs: $I1
    null $I1
.annotate 'line', 5020
    if_null $P2, __label_1
# {
.annotate 'line', 5021
    $P2 = $P2.'optimize'()
.annotate 'line', 5022
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
  __label_1: # endif
.annotate 'line', 5025
    isa $I2, $P1, [ 'MemberExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 5026
    new $P7, [ 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 5027
    isa $I2, $P1, [ 'MemberRefExpr' ]
    unless $I2 goto __label_3
.annotate 'line', 5028
    new $P7, [ 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 5031
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 5032
# callname: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_5
    set $S1, $P7
  __label_5:
.annotate 'line', 5033
# var predef: $P3
.const 'Sub' $P8 = 'WSubId_52'
    $P3 = $P8($S1, $I1)
.annotate 'line', 5034
    if_null $P3, __label_6
.annotate 'line', 5035
.const 'Sub' $P9 = 'WSubId_53'
    getattribute $P6, self, 'owner'
    .tailcall $P9($P6, $P3, $P2)
  __label_6: # endif
.annotate 'line', 5036
# call: $S2
    $P6 = $P1.'checkIdentifier'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5037
    ne $S2, '', __label_8
# {
.annotate 'line', 5038
    new $P4, ['ResizableStringArray']
    set $P4, 1
    set $S4, $S1
    $P4[0] = $S4
.annotate 'line', 5039
# var sym: $P5
    $P5 = self.'findsymbol'($P4)
.annotate 'line', 5040
    if_null $P5, __label_9
# {
.annotate 'line', 5041
# id: $S3
    $P6 = $P5.'makesubid'()
    null $S3
    if_null $P6, __label_10
    set $S3, $P6
  __label_10:
.annotate 'line', 5042
    box $P6, $S3
    setattribute self, 'subid', $P6
# }
  __label_9: # endif
# }
  __label_8: # endif
# }
  __label_4: # endif
.annotate 'line', 5047
    setattribute self, 'funref', $P1
.annotate 'line', 5048
    setattribute self, 'args', $P2
.annotate 'line', 5049
    .return(self)
# }
.annotate 'line', 5050

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5053
    .return(1)
# }
.annotate 'line', 5054

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5057
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 5058
# reg: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'createreg'('P')
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5059
# predefined string
    getattribute $P2, self, 'subid'
    set $S3, $P2
    concat $S4, ".const 'Sub' ", $S1
    concat $S4, $S4, " = '"
    concat $S4, $S4, $S3
    concat $S4, $S4, "'"
    __ARG_1.'say'($S4)
.annotate 'line', 5060
    .return($S1)
# }
  __label_1: # endif
.annotate 'line', 5062
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5063
# call: $S2
    null $S2
.annotate 'line', 5064
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
# {
.annotate 'line', 5065
    $P3 = $P1.'checkIdentifier'()
    set $S2, $P3
.annotate 'line', 5066
    ne $S2, '', __label_5
.annotate 'line', 5067
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "'"
    push $P2, $P3
    $P4 = $P1.'getName'()
    push $P2, $P4
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S2, "", $P2
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 5070
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S2, $P2
  __label_4: # endif
.annotate 'line', 5071
    .return($S2)
# }
.annotate 'line', 5072

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5075
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5076
    if_null $P1, __label_1
.annotate 'line', 5077
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5078

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5081
    __ARG_1.'print'('(')
.annotate 'line', 5082
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5083
    if_null $P1, __label_1
.annotate 'line', 5084
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5085
    __ARG_1.'say'(')')
# }
.annotate 'line', 5086

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5089
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5090
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5092
    self.'annotate'(__ARG_1)
.annotate 'line', 5094
    __ARG_1.'print'('    ')
.annotate 'line', 5095
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5096
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5097
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5099
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5102
    __ARG_1.'print'($S1)
.annotate 'line', 5103
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5104

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4998
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5000
    addattribute $P0, 'funref'
.annotate 'line', 5001
    addattribute $P0, 'args'
.annotate 'line', 5002
    addattribute $P0, 'subid'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5116
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    self.'Expr'($P5, $P6)
.annotate 'line', 5117
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5118
    setattribute self, 'args', __ARG_3
.annotate 'line', 5123
# var first: $P1
    getattribute $P1, __ARG_2, 'left'
  __label_2: # while
.annotate 'line', 5124
    isa $I1, $P1, [ 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5125
    getattribute $P1, $P1, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 5126
    isa $I1, $P1, [ 'IdentifierExpr' ]
    unless $I1 goto __label_3
# {
.annotate 'line', 5127
# var idfirst: $P2
    $P2 = $P1.'checkIdentifier'()
.annotate 'line', 5128
    isnull $I1, $P2
    if $I1 goto __label_5
    set $S1, $P2
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
# {
.annotate 'line', 5129
# var key: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5130
    __ARG_2.'buildkey'($P3)
.annotate 'line', 5131
# var sym: $P4
    $P4 = self.'findsymbol'($P3)
.annotate 'line', 5132
    if_null $P4, __label_6
.annotate 'line', 5133
    $P6 = $P4.'makesubid'()
    setattribute self, 'subid', $P6
  __label_6: # endif
# }
  __label_4: # endif
# }
  __label_3: # endif
# }
.annotate 'line', 5136

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5139
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
# {
.annotate 'line', 5140
# reg: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'createreg'('P')
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5141
# predefined string
    getattribute $P2, self, 'subid'
    set $S2, $P2
    concat $S3, ".const 'Sub' ", $S1
    concat $S3, $S3, " = '"
    concat $S3, $S3, $S2
    concat $S3, $S3, "'"
    __ARG_1.'say'($S3)
.annotate 'line', 5142
    .return($S1)
# }
  __label_1: # endif
.annotate 'line', 5144
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5145
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 5146
    $P5 = $P1.'get_member'()
.annotate 'line', 5145
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
.annotate 'line', 5138
    join $S2, "", $P2
.annotate 'line', 5145
    .return($S2)
# }
.annotate 'line', 5147

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 5112
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
.annotate 'line', 5157
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5158
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5159
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5160

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5163
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5164
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5165
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5166
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 5167
    getattribute $P5, $P1, 'start'
    $P4("Invalid expression type in '.*'", $P5)
  __label_1: # endif
.annotate 'line', 5170
# lreg: $S1
    $P5 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 5171
# rreg: $S2
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5172
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5173

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 5153
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
.annotate 'line', 5183
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5184
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5185

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5188
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5189
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5190
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5191
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5192
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5193
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5194
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5196
    .return($S2)
# }
.annotate 'line', 5197

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 5178
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5180
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
.annotate 'line', 5206
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5207
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5208

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5209
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5212
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5213
    .return(self)
# }
.annotate 'line', 5214

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5217
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5218
    isa $I1, $P1, [ 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5219
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5221
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5222
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5223

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5226
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5227

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5230
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5231
    self.'annotate'(__ARG_1)
.annotate 'line', 5232
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5233

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5236
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5237
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5238
    .return($S1)
# }
.annotate 'line', 5239

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5242
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5243
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5244
    self.'annotate'(__ARG_1)
.annotate 'line', 5245
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5246

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5249
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5250

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5253
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5254
# value: $S2
    null $S2
.annotate 'line', 5255
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5257
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5258
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5259
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5261
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5264
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5265
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5267
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5268

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5271
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5272
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5273
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5274
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5276
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5277
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5278
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5280
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5282
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5283
    .return($S2)
# }
.annotate 'line', 5284

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 5200
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5202
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
.annotate 'line', 5294
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5295
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5296

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5297
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5300
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5301
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5302
    .return(self)
# }
.annotate 'line', 5303

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 5307
    getattribute $P2, self, 'start'
.annotate 'line', 5306
    $P1('Member reference can be used only for method calls', $P2)
# }
.annotate 'line', 5308

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 5289
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5291
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
.annotate 'line', 5322
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5323
    setattribute self, 'left', __ARG_4
.annotate 'line', 5324
    new $P3, [ 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5325

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5328
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5329
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5331
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5332

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5335
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5336
    setattribute self, 'left', $P1
.annotate 'line', 5337
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5338
    $P2.'optimizeargs'()
.annotate 'line', 5342
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5343
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5344
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5345
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5346
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5347
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5348
# predefined substr
.annotate 'line', 5347
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5349
    new $P6, [ 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5352
    .return(self)
# }
.annotate 'line', 5353

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5356
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.const 'Sub' $P4 = 'WSubId_6'
.annotate 'line', 5357
    getattribute $P5, self, 'start'
    $P4('wrong call to IndexExpr.emit_args', $P5)
  __label_1: # endif
.annotate 'line', 5358
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5359
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 5360
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5361
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5359
    setattribute self, 'regleft', $P3
.annotate 'line', 5362
    getattribute $P5, self, 'args'
    $P3 = $P5.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5363

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5366
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5367
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5368
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 5369
    getattribute $P4, self, 'start'
    $P3('wrong call to IndexExpr.emit_aux', $P4)
  __label_1: # endif
.annotate 'line', 5370
    getattribute $P4, self, 'regleft'
    __ARG_1.'print'($P4, '[')
.annotate 'line', 5371
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5372
    __ARG_1.'print'(']')
# }
.annotate 'line', 5373

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5376
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5377
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5378
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5379
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5380
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5381
    eq $I1, 1, __label_4
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 5382
    getattribute $P2, self, 'start'
    $P3('Bad string index', $P2)
  __label_4: # endif
.annotate 'line', 5383
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5384
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5385
    getattribute $P2, self, 'regleft'
    $P4 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P4, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5388
    self.'annotate'(__ARG_1)
.annotate 'line', 5389
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5390
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5391
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5393

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5396
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5397
    self.'annotate'(__ARG_1)
.annotate 'line', 5398
    __ARG_1.'print'('    ')
.annotate 'line', 5399
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5400
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5401

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5404
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5405
# rreg: $S1
    null $S1
.annotate 'line', 5406
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5407
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5408
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5411
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5412
    self.'annotate'(__ARG_1)
.annotate 'line', 5413
    __ARG_1.'print'('    ')
.annotate 'line', 5414
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5415
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5416
    .return($S1)
# }
.annotate 'line', 5417

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 5313
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5315
    addattribute $P0, 'left'
.annotate 'line', 5316
    addattribute $P0, 'regleft'
.annotate 'line', 5317
    addattribute $P0, 'args'
.annotate 'line', 5318
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5428
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5429
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5430
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5431
    __ARG_1.'unget'($P1)
.annotate 'line', 5432
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5433
.const 'Sub' $P5 = 'WSubId_27'
    $P4 = $P5(__ARG_1, __ARG_2, $P3, ']')
    setattribute self, 'values', $P4
# }
  __label_1: # endif
# }
.annotate 'line', 5435

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5436
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 5439
    getattribute $P2, self, 'values'
    $P1($P2)
.annotate 'line', 5440
    .return(self)
# }
.annotate 'line', 5441

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5444
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5445
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5446
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5452
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5454

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5457
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5458
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5459
    .return($S1)
# }
.annotate 'line', 5460

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5463
    self.'annotate'(__ARG_1)
.annotate 'line', 5464
# itemreg: $S1
    null $S1
.annotate 'line', 5465
# it_p: $S2
    null $S2
.annotate 'line', 5466
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5467
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5468
    $P3 = self.'tempreg'('P')
    set $S2, $P3
# }
  __label_1: # endif
.annotate 'line', 5470
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 5471
    if_null $P1, __label_2
# {
.annotate 'line', 5472
    iter $P4, $P1
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P2, $P4
# {
# switch
.annotate 'line', 5473
    $P3 = $P2.'checkresult'()
    set $S4, $P3
    set $S5, 'I'
    if $S4 == $S5 goto __label_7
    set $S5, 'N'
    if $S4 == $S5 goto __label_8
    set $S5, 'S'
    if $S4 == $S5 goto __label_9
    goto __label_6
  __label_7: # case
  __label_8: # case
  __label_9: # case
.annotate 'line', 5475
# aux: $S3
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_10
    set $S3, $P5
  __label_10:
.annotate 'line', 5476
    eq __ARG_2, '', __label_11
# {
.annotate 'line', 5477
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5478
    set $S1, $S2
# }
  __label_11: # endif
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 5482
    $P3 = $P2.'isnull'()
    if_null $P3, __label_12
    unless $P3 goto __label_12
# {
.annotate 'line', 5483
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5484
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5485
    __ARG_1.'emitnull'($S1)
# }
  __label_14: # endif
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 5489
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_13: # endif
  __label_5: # switch end
.annotate 'line', 5491
    eq __ARG_2, '', __label_15
# {
.annotate 'line', 5492
    self.'annotate'(__ARG_1)
.annotate 'line', 5493
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_15: # endif
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
# }
.annotate 'line', 5497

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5422
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5424
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5509
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5510
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5511
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5512
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5513
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5514
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5515
# {
.annotate 'line', 5516
# var key: $P4
.const 'Sub' $P7 = 'WSubId_30'
    $P4 = $P7(__ARG_1, __ARG_2)
.const 'Sub' $P8 = 'WSubId_43'
.annotate 'line', 5517
    $P8(':', __ARG_1)
.annotate 'line', 5518
# var value: $P5
.const 'Sub' $P9 = 'WSubId_30'
    $P5 = $P9(__ARG_1, __ARG_2)
.annotate 'line', 5519
# predefined push
    push $P2, $P4
.annotate 'line', 5520
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5522
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5523
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.const 'Sub' $P10 = 'WSubId_29'
.annotate 'line', 5524
    $P10("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5526
    setattribute self, 'keys', $P2
.annotate 'line', 5527
    setattribute self, 'values', $P3
# }
.annotate 'line', 5528

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5529
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 5532
    getattribute $P2, self, 'keys'
    $P1($P2)
.const 'Sub' $P3 = 'WSubId_28'
.annotate 'line', 5533
    getattribute $P2, self, 'values'
    $P3($P2)
.annotate 'line', 5534
    .return(self)
# }
.annotate 'line', 5535

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5538
    self.'annotate'(__ARG_1)
.annotate 'line', 5543
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 5544
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 5546
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5547
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5548
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5549
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 5550
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5551
# item: $S1
    null $S1
.annotate 'line', 5552
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 5553
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5554
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5555
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 5558
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 5560
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5561
# itemreg: $S3
    null $S3
# switch-case
.annotate 'line', 5563
    $I3 = $P4.'isnull'()
    if $I3 goto __label_10
.annotate 'line', 5569
    $I3 = $P4.'isidentifier'()
    if $I3 goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 5564
    set $S6, __ARG_2
    eq $S6, '', __label_12
# {
.annotate 'line', 5565
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5566
    __ARG_1.'emitnull'($S3)
# }
  __label_12: # endif
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 5570
# s: $S4
    $P5 = $P4.'checkIdentifier'()
    null $S4
    if_null $P5, __label_13
    set $S4, $P5
  __label_13:
.annotate 'line', 5571
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_16
    isne $I3, $S4, ''
  __label_16:
    unless $I3 goto __label_14
.annotate 'line', 5572
    set $S3, $S4
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 5574
# id: $S5
    $P6 = $P4.'getName'()
    null $S5
    if_null $P6, __label_17
    set $S5, $P6
  __label_17:
.annotate 'line', 5575
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_18
# {
.annotate 'line', 5576
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5577
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_19
  __label_18: # else
.annotate 'line', 5580
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_19: # endif
# }
  __label_15: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5584
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_8: # switch end
.annotate 'line', 5586
    set $S6, __ARG_2
    eq $S6, '', __label_20
.annotate 'line', 5587
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_20: # endif
# }
  __label_2: # for iteration
.annotate 'line', 5549
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 5589

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5592
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5593
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5594
    .return($S1)
# }
.annotate 'line', 5595

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5502
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5504
    addattribute $P0, 'keys'
.annotate 'line', 5505
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5608
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5613
    new $P3, [ 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5614

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5617
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5618
    if_null $P1, __label_1
.annotate 'line', 5619
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 5620

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5623
    self.'optimize_initializer'()
.annotate 'line', 5624
    .return(self)
# }
.annotate 'line', 5625

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5628
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5629
    if_null $P1, __label_1
.annotate 'line', 5630
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5631
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5632
    if_null $P1, __label_2
.annotate 'line', 5633
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5634
    __ARG_1.'say'(")")
# }
.annotate 'line', 5635

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5600
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5602
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
.annotate 'line', 5646
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5648
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_1'
.annotate 'line', 5649
    $P2("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 5650
    setattribute self, 'value', __ARG_4
.annotate 'line', 5651
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5653
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5654
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 5656
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 5657

.end # NewExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5660
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5661
    isa $I1, $P1, [ 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 5664
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 5665
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 5666
    $P1 = $P2.'getvalue'()
.annotate 'line', 5667
    isa $I2, $P1, [ 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 5668
    $P5('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 5669
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5672
    self.'optimize_initializer'()
.annotate 'line', 5673
    .return(self)
# }
.annotate 'line', 5674

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 5677
    self.'annotate'(__ARG_1)
.annotate 'line', 5679
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5680
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5683
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 5684
    getattribute $P9, self, 'value'
    $P8 = $P9.'isidentifier'()
    if_null $P8, __label_6
    unless $P8 goto __label_6
    set $I2, 1
    goto __label_5
  __label_6:
    set $I2, -1
  __label_5:
  __label_3:
.annotate 'line', 5686
# reginit: $S1
    set $S1, ''
.annotate 'line', 5687
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5688
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5689
    set $I3, $I1
    set $I4, -1
    if $I3 == $I4 goto __label_10
    null $I4
    if $I3 == $I4 goto __label_11
    set $I4, 1
    if $I3 == $I4 goto __label_12
    goto __label_9
  __label_10: # case
  __label_11: # case
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 5694
    ne $I2, 1, __label_13
# {
.annotate 'line', 5695
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 5696
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5699
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5700
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5701
    concat $S0, ', ', $S1
    set $S1, $S0
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5705
    eq $I2, 1, __label_16
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 5706
    getattribute $P6, self, 'start'
    $P10('Multiple init arguments not allowed here', $P6)
  __label_16: # endif
.annotate 'line', 5707
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 5708
    $P7 = self.'tempreg'('P')
    set $S2, $P7
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 5711
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 5714
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 5715
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5716
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.const 'Sub' $P11 = 'WSubId_54'
.annotate 'line', 5717
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    $P11($S5, $P8)
  __label_23: # endif
.annotate 'line', 5721
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5722
    le $I1, 1, __label_25
# {
.annotate 'line', 5723
    getattribute $P12, self, 'value'
    __ARG_1.'say'($S2, ".'", $P12, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5727
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5728
    unless_null $P4, __label_26
# {
.annotate 'line', 5730
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5731
    if_null $P5, __label_28
# {
.annotate 'line', 5732
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 5735
    $P6 = self.'dowarnings'()
    if_null $P6, __label_30
    unless $P6 goto __label_30
.const 'Sub' $P13 = 'WSubId_54'
.annotate 'line', 5736
    $P13('Checking: new unknown type')
  __label_30: # endif
.annotate 'line', 5737
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_29: # endif
.annotate 'line', 5739
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 5743
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 5745
.const 'Sub' $P14 = 'WSubId_6'
.annotate 'line', 5747
    $P14('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 5749
    isgt $I3, $I1, 1
    if $I3 goto __label_32
    isge $I3, $I1, 0
    unless $I3 goto __label_33
    iseq $I3, $I2, 1
  __label_33:
  __label_32:
    unless $I3 goto __label_31
# {
.annotate 'line', 5750
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5751
    not $I3, __ARG_3
    unless $I3 goto __label_34
.annotate 'line', 5752
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_34: # endif
# }
  __label_31: # endif
# }
.annotate 'line', 5754

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5757
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5758

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5640
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5642
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5769
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5770
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5771
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5772
    setattribute self, 'nskey', $P1
.annotate 'line', 5773
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5774
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5775
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5777
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5778

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5781
# reginit: $S1
    null $S1
.annotate 'line', 5782
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5783
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 5784
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5788
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5789
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 5790
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 5792
    getattribute $P6, self, 'start'
    $P5('Multiple init arguments not allowed here', $P6)
  __label_3: # switch end
.annotate 'line', 5794
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5795
    __ARG_1.'print'('    ')
.annotate 'line', 5796
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 5797
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 5798
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5799
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5800
    if_null $S1, __label_8
.annotate 'line', 5801
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 5802
    __ARG_1.'say'()
# }
.annotate 'line', 5803

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5763
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5765
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5814
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5815
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5816
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5817
    setattribute self, 'nskey', $P1
.annotate 'line', 5818
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5819
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5820
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5822
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5823

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5826
# reginit: $S1
    null $S1
.annotate 'line', 5827
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5829
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 5830
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5831
    le $I1, 0, __label_4
.annotate 'line', 5832
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 5833
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5834
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5835
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5836
    __ARG_1.'say'()
.annotate 'line', 5838
    lt $I1, 0, __label_5
# {
.annotate 'line', 5839
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5840
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5841
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 5843

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5808
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5810
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew' :subid('WSubId_55')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5850
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 5853
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 5857
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 5860
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 5855
    new $P4, [ 'CallExpr' ]
.annotate 'line', 5856
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 5855
    .return($P3)
  __label_4: # case
.annotate 'line', 5859
    new $P8, [ 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 5863
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5864
    __ARG_1.'unget'($P2)
.annotate 'line', 5865
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 5867
    new $P11, [ 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 5872
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 5874

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5885
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5886
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5887
.const 'Sub' $P3 = 'WSubId_48'
    $P2 = $P3(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5888

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5891
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5892
    .return(self)
# }
.annotate 'line', 5893

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5894
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5897
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5898
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5899
    eq $S1, 'P', __label_2
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 5900
    getattribute $P3, $P1, 'start'
    $P4('Invalid instanceof left operand', $P3)
  __label_2: # endif
.annotate 'line', 5901
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 5903
# r: $S2
    set $S4, __ARG_2
    ne $S4, '', __label_4
    $P3 = self.'tempreg'('I')
    goto __label_3
  __label_4:
    set $P3, __ARG_2
  __label_3:
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 5904
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5905
    self.'annotate'(__ARG_1)
.annotate 'line', 5906
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 5907
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5908
    __ARG_1.'say'()
# }
.annotate 'line', 5909

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5878
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5880
    addattribute $P0, 'lexpr'
.annotate 'line', 5881
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
.annotate 'line', 5926
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5927
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5928
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5929
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5930
    .return(self)
# }
.annotate 'line', 5931

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5934
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 5935
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5937
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 5939
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 5941
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5942
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5943
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 5945

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5948
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 5949
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 5950
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 5952
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 5953

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5956
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5957
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5958
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5959
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 5960
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5961
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 5962
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 5964
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 5965
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5966
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5967
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 5968
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 5969
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 5971
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5972
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 5973
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 5974
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 5977
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 5979
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5980

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5914
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5920
    addattribute $P0, 'condition'
.annotate 'line', 5921
    addattribute $P0, 'etrue'
.annotate 'line', 5922
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

.sub 'getOpCode_2' :subid('WSubId_57')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6024
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '('
    if $S1 == $S2 goto __label_3
    set $S2, '['
    if $S1 == $S2 goto __label_4
    set $S2, '.'
    if $S1 == $S2 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6025
    .return(1)
  __label_4: # case
.annotate 'line', 6026
    .return(2)
  __label_5: # case
.annotate 'line', 6027
    .return(3)
  __label_2: # default
.annotate 'line', 6028
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6030

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_59')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6034
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '-'
    if $S1 == $S2 goto __label_3
    set $S2, '!'
    if $S1 == $S2 goto __label_4
    set $S2, '++'
    if $S1 == $S2 goto __label_5
    set $S2, '--'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6035
    .return(8)
  __label_4: # case
.annotate 'line', 6036
    .return(11)
  __label_5: # case
.annotate 'line', 6037
    .return(9)
  __label_6: # case
.annotate 'line', 6038
    .return(10)
  __label_2: # default
.annotate 'line', 6040
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6041
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6042
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6044

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_62')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6048
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '*'
    if $S1 == $S2 goto __label_3
    set $S2, '/'
    if $S1 == $S2 goto __label_4
    set $S2, '%'
    if $S1 == $S2 goto __label_5
    set $S2, '%%'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6049
    .return(19)
  __label_4: # case
.annotate 'line', 6050
    .return(20)
  __label_5: # case
.annotate 'line', 6051
    .return(21)
  __label_6: # case
.annotate 'line', 6052
    .return(22)
  __label_2: # default
.annotate 'line', 6053
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6055

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_65')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6059
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6060
    .return(28)
  __label_4: # case
.annotate 'line', 6061
    .return(29)
  __label_2: # default
.annotate 'line', 6062
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6064

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_67')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6068
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<'
    if $S1 == $S2 goto __label_3
    set $S2, '>'
    if $S1 == $S2 goto __label_4
    set $S2, '<='
    if $S1 == $S2 goto __label_5
    set $S2, '>='
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6069
    .return(14)
  __label_4: # case
.annotate 'line', 6070
    .return(16)
  __label_5: # case
.annotate 'line', 6071
    .return(15)
  __label_6: # case
.annotate 'line', 6072
    .return(17)
  __label_2: # default
.annotate 'line', 6074
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6075
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6077

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_69')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6081
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '=='
    if $S1 == $S2 goto __label_3
    set $S2, '!='
    if $S1 == $S2 goto __label_4
    set $S2, '==='
    if $S1 == $S2 goto __label_5
    set $S2, '!=='
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6082
    .return(12)
  __label_4: # case
.annotate 'line', 6083
    .return(13)
  __label_5: # case
.annotate 'line', 6084
    .return(25)
  __label_6: # case
.annotate 'line', 6085
    .return(26)
  __label_2: # default
.annotate 'line', 6086
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6088

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_78')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6092
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '='
    if $S1 == $S2 goto __label_3
    set $S2, '=:'
    if $S1 == $S2 goto __label_4
    set $S2, '+='
    if $S1 == $S2 goto __label_5
    set $S2, '-='
    if $S1 == $S2 goto __label_6
    set $S2, '*='
    if $S1 == $S2 goto __label_7
    set $S2, '/='
    if $S1 == $S2 goto __label_8
    set $S2, '%='
    if $S1 == $S2 goto __label_9
    goto __label_2
  __label_3: # case
.annotate 'line', 6093
    .return(4)
  __label_4: # case
.annotate 'line', 6094
    .return(5)
  __label_5: # case
.annotate 'line', 6095
    .return(6)
  __label_6: # case
.annotate 'line', 6096
    .return(18)
  __label_7: # case
.annotate 'line', 6097
    .return(23)
  __label_8: # case
.annotate 'line', 6098
    .return(24)
  __label_9: # case
.annotate 'line', 6099
    .return(30)
  __label_2: # default
.annotate 'line', 6100
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6102

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6106
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 6108
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6109
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6112
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6116
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6118
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6120
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6122
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6124
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6126
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6128
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6130
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6132
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_12
    goto __label_2
  __label_3: # case
.annotate 'line', 6113
.const 'Sub' $P4 = 'WSubId_30'
    $P2 = $P4(__ARG_1, __ARG_2)
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 6114
    $P5(')', __ARG_1)
.annotate 'line', 6115
    .return($P2)
  __label_4: # case
.annotate 'line', 6117
    new $P7, [ 'ArrayExpr' ]
    $P7.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P6, $P7
    .return($P6)
  __label_5: # case
.annotate 'line', 6119
    new $P9, [ 'HashExpr' ]
    $P9.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P8, $P9
    .return($P8)
  __label_6: # case
.annotate 'line', 6121
    new $P11, [ 'StringLiteral' ]
    $P11.'StringLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_7: # case
.annotate 'line', 6123
    new $P13, [ 'IntegerLiteral' ]
    $P13.'IntegerLiteral'(__ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_8: # case
.annotate 'line', 6125
    new $P15, [ 'FloatLiteral' ]
    $P15.'FloatLiteral'(__ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_9: # case
.annotate 'line', 6127
.const 'Sub' $P16 = 'WSubId_55'
    .tailcall $P16(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6129
    new $P18, [ 'FunctionExpr' ]
    $P18.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P17, $P18
    .return($P17)
  __label_11: # case
.annotate 'line', 6131
    new $P20, [ 'OpClassExpr' ]
    $P20.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P19, $P20
    .return($P19)
  __label_12: # case
.annotate 'line', 6133
    new $P22, [ 'IdentifierExpr' ]
    $P22.'IdentifierExpr'(__ARG_2, $P1)
    set $P21, $P22
    .return($P21)
  __label_2: # default
.const 'Sub' $P23 = 'WSubId_29'
.annotate 'line', 6135
    $P23('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6137

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_58')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6141
.const 'Sub' $P5 = 'parseExpr_0'
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 6143
# var subexp: $P1
.const 'Sub' $P7 = 'WSubId_56'
    $P1 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6144
# var t: $P2
    null $P2
.annotate 'line', 6145
# var start: $P3
    null $P3
.annotate 'line', 6146
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6147
.const 'Sub' $P9 = 'WSubId_57'
    $P2 = __ARG_1.'get'()
    $P8 = $P9($P2)
    set $I1, $P8
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6148
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6150
    new $P10, [ 'CallExpr' ]
    $P10.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P10
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6153
    new $P11, [ 'IndexExpr' ]
    $P11.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P11
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6156
    set $P3, $P2
.annotate 'line', 6157
    $P2 = __ARG_1.'get'()
.annotate 'line', 6158
    $P12 = $P2.'isop'('*')
    if_null $P12, __label_8
    unless $P12 goto __label_8
# {
.annotate 'line', 6159
# var right: $P4
.const 'Sub' $P13 = 'WSubId_56'
    $P4 = $P13(__ARG_1, __ARG_2)
.annotate 'line', 6160
    new $P8, [ 'MemberRefExpr' ]
    $P8.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P8
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6163
    new $P8, [ 'MemberExpr' ]
    $P8.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P8
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6164
.const 'Sub' $P14 = 'WSubId_6'
.annotate 'line', 6166
    $P14('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6169
    __ARG_1.'unget'($P2)
.annotate 'line', 6170
    .return($P1)
# }
.annotate 'line', 6171

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6175
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 6177
# var subexp: $P1
.const 'Sub' $P4 = 'WSubId_58'
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6178
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6180
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6182
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6181
    new $P6, [ 'OpPostIncExpr' ]
    $P6.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_4: # case
.annotate 'line', 6183
    new $P8, [ 'OpPostDecExpr' ]
    $P8.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P7, $P8
    .return($P7)
  __label_2: # default
.annotate 'line', 6185
    __ARG_1.'unget'($P2)
.annotate 'line', 6186
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6188

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6192
.const 'Sub' $P3 = 'parseExpr_4'
.const 'Sub' $P4 = 'parseExpr_3'
.const 'Sub' $P5 = 'getOpCode_4'
.annotate 'line', 6194
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6195
# code: $I1
.const 'Sub' $P7 = 'WSubId_59'
    $P6 = $P7($P1)
    set $I1, $P6
.annotate 'line', 6196
    eq $I1, 0, __label_1
# {
.annotate 'line', 6197
# var subexpr: $P2
.const 'Sub' $P8 = 'WSubId_60'
    $P2 = $P8(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6198
    set $I2, $I1
    set $I3, 8
    if $I2 == $I3 goto __label_5
    set $I3, 11
    if $I2 == $I3 goto __label_6
    set $I3, 9
    if $I2 == $I3 goto __label_7
    set $I3, 10
    if $I2 == $I3 goto __label_8
    set $I3, 31
    if $I2 == $I3 goto __label_9
    set $I3, 32
    if $I2 == $I3 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 6200
    new $P9, [ 'OpUnaryMinusExpr' ]
    $P9.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P6, $P9
    .return($P6)
  __label_6: # case
.annotate 'line', 6202
    new $P11, [ 'OpNotExpr' ]
    $P11.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P10, $P11
    .return($P10)
  __label_7: # case
.annotate 'line', 6204
    new $P13, [ 'OpPreIncExpr' ]
    $P13.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P12, $P13
    .return($P12)
  __label_8: # case
.annotate 'line', 6206
    new $P15, [ 'OpPreDecExpr' ]
    $P15.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P14, $P15
    .return($P14)
  __label_9: # case
.annotate 'line', 6208
    new $P17, [ 'OpDeleteExpr' ]
    $P17.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P16, $P17
    .return($P16)
  __label_10: # case
.annotate 'line', 6210
    new $P19, [ 'OpExistsExpr' ]
    $P19.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P18, $P19
    .return($P18)
  __label_4: # default
.const 'Sub' $P20 = 'WSubId_6'
.annotate 'line', 6212
    $P20('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6216
    __ARG_1.'unget'($P1)
.annotate 'line', 6217
.const 'Sub' $P21 = 'WSubId_61'
    .tailcall $P21(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6219

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6223
.const 'Sub' $P4 = 'parseExpr_4'
.const 'Sub' $P5 = 'getOpCode_5'
.annotate 'line', 6225
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_60'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6226
# var t: $P2
    null $P2
.annotate 'line', 6227
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6228
.const 'Sub' $P8 = 'WSubId_62'
    $P2 = __ARG_1.'get'()
    $P7 = $P8($P2)
    set $I1, $P7
    eq $I1, 0, __label_1
# {
.annotate 'line', 6229
# var rexpr: $P3
.const 'Sub' $P9 = 'WSubId_60'
    $P3 = $P9(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6230
    set $I2, $I1
    set $I3, 19
    if $I2 == $I3 goto __label_5
    set $I3, 20
    if $I2 == $I3 goto __label_6
    set $I3, 21
    if $I2 == $I3 goto __label_7
    set $I3, 22
    if $I2 == $I3 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 6232
    new $P7, [ 'OpMulExpr' ]
    $P7.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6235
    new $P10, [ 'OpDivExpr' ]
    $P10.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P10
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6238
    new $P11, [ 'OpModExpr' ]
    $P11.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P11
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6241
    new $P12, [ 'OpCModExpr' ]
    $P12.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P12
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6242
.const 'Sub' $P13 = 'WSubId_6'
.annotate 'line', 6244
    $P13('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6247
    __ARG_1.'unget'($P2)
.annotate 'line', 6248
    .return($P1)
# }
.annotate 'line', 6249

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_64')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6253
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 6255
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_63'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6256
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6257
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6258
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_63'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6259
# var expr: $P4
    null $P4
.annotate 'line', 6260
    $P8 = $P2.'isop'('+')
    if_null $P8, __label_4
    unless $P8 goto __label_4
.annotate 'line', 6261
    new $P9, [ 'OpAddExpr' ]
    $P9.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P9
    goto __label_5
  __label_4: # else
.annotate 'line', 6263
    new $P10, [ 'OpSubExpr' ]
    $P10.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P10
  __label_5: # endif
.annotate 'line', 6264
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6266
    __ARG_1.'unget'($P2)
.annotate 'line', 6267
    .return($P1)
# }
.annotate 'line', 6268

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6272
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 6274
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_64'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6275
# var rexpr: $P2
    null $P2
.annotate 'line', 6276
# var t: $P3
    null $P3
.annotate 'line', 6277
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6278
.const 'Sub' $P7 = 'WSubId_65'
    $P3 = __ARG_1.'get'()
    $P6 = $P7($P3)
    set $I1, $P6
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6279
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6281
.const 'Sub' $P8 = 'WSubId_64'
    $P2 = $P8(__ARG_1, __ARG_2)
.annotate 'line', 6282
    new $P9, [ 'OpShiftleftExpr' ]
    $P9.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6285
.const 'Sub' $P10 = 'WSubId_64'
    $P2 = $P10(__ARG_1, __ARG_2)
.annotate 'line', 6286
    new $P11, [ 'OpShiftrightExpr' ]
    $P11.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P11
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6287
.const 'Sub' $P12 = 'WSubId_6'
.annotate 'line', 6289
    $P12('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6292
    __ARG_1.'unget'($P3)
.annotate 'line', 6293
    .return($P1)
# }
.annotate 'line', 6294

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6298
.const 'Sub' $P4 = 'parseExpr_7'
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 6300
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_66'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6301
# var rexpr: $P2
    null $P2
.annotate 'line', 6302
# var t: $P3
    null $P3
.annotate 'line', 6303
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6304
.const 'Sub' $P8 = 'WSubId_67'
    $P3 = __ARG_1.'get'()
    $P7 = $P8($P3)
    set $I1, $P7
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6305
    set $I2, $I1
    set $I3, 14
    if $I2 == $I3 goto __label_5
    set $I3, 16
    if $I2 == $I3 goto __label_6
    set $I3, 15
    if $I2 == $I3 goto __label_7
    set $I3, 17
    if $I2 == $I3 goto __label_8
    set $I3, 27
    if $I2 == $I3 goto __label_9
    goto __label_4
  __label_5: # case
.annotate 'line', 6307
.const 'Sub' $P9 = 'WSubId_66'
    $P2 = $P9(__ARG_1, __ARG_2)
.annotate 'line', 6308
    new $P10, [ 'OpLessExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6311
.const 'Sub' $P11 = 'WSubId_66'
    $P2 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6312
    new $P12, [ 'OpGreaterExpr' ]
    $P1 = $P12.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6315
.const 'Sub' $P13 = 'WSubId_66'
    $P2 = $P13(__ARG_1, __ARG_2)
.annotate 'line', 6316
    new $P14, [ 'OpLessEqualExpr' ]
    $P1 = $P14.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6319
.const 'Sub' $P15 = 'WSubId_66'
    $P2 = $P15(__ARG_1, __ARG_2)
.annotate 'line', 6320
    new $P16, [ 'OpGreaterEqualExpr' ]
    $P1 = $P16.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6323
    new $P17, [ 'OpInstanceOfExpr' ]
    $P17.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P17
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6324
.const 'Sub' $P18 = 'WSubId_6'
.annotate 'line', 6326
    $P18('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6329
    __ARG_1.'unget'($P3)
.annotate 'line', 6330
    .return($P1)
# }
.annotate 'line', 6331

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_70')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6335
.const 'Sub' $P4 = 'parseExpr_8'
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6337
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_68'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6338
# var rexpr: $P2
    null $P2
.annotate 'line', 6339
# var t: $P3
    null $P3
.annotate 'line', 6340
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6341
.const 'Sub' $P8 = 'WSubId_69'
    $P3 = __ARG_1.'get'()
    $P7 = $P8($P3)
    set $I1, $P7
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6342
    set $I2, $I1
    set $I3, 12
    if $I2 == $I3 goto __label_5
    set $I3, 13
    if $I2 == $I3 goto __label_6
    set $I3, 25
    if $I2 == $I3 goto __label_7
    set $I3, 26
    if $I2 == $I3 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 6344
.const 'Sub' $P9 = 'WSubId_68'
    $P2 = $P9(__ARG_1, __ARG_2)
.annotate 'line', 6345
    new $P10, [ 'OpEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6348
.const 'Sub' $P11 = 'WSubId_68'
    $P2 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6349
    new $P12, [ 'OpNotEqualExpr' ]
    $P1 = $P12.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6352
.const 'Sub' $P13 = 'WSubId_68'
    $P2 = $P13(__ARG_1, __ARG_2)
.annotate 'line', 6353
    new $P14, [ 'OpSameExpr' ]
    $P14.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P14
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6356
.const 'Sub' $P15 = 'WSubId_68'
    $P2 = $P15(__ARG_1, __ARG_2)
.annotate 'line', 6357
    new $P16, [ 'OpSameExpr' ]
    $P16.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P16
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6358
.const 'Sub' $P17 = 'WSubId_6'
.annotate 'line', 6360
    $P17('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6363
    __ARG_1.'unget'($P3)
.annotate 'line', 6364
    .return($P1)
# }
.annotate 'line', 6365

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6369
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6371
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_70'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6372
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6373
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('&')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6374
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_70'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6375
    new $P6, [ 'OpBinAndExpr' ]
    $P6.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6377
    __ARG_1.'unget'($P2)
.annotate 'line', 6378
    .return($P1)
# }
.annotate 'line', 6379

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_72')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6383
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6385
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_71'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6386
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6387
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('^')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6388
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_71'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6389
    new $P6, [ 'OpBinXorExpr' ]
    $P6.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6391
    __ARG_1.'unget'($P2)
.annotate 'line', 6392
    .return($P1)
# }
.annotate 'line', 6393

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6397
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6399
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_72'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6400
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6401
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('|')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6402
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_72'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6403
    new $P6, [ 'OpBinOrExpr' ]
    $P6.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6405
    __ARG_1.'unget'($P2)
.annotate 'line', 6406
    .return($P1)
# }
.annotate 'line', 6407

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6411
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6413
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_73'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6414
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6415
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('&&')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6416
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_73'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6417
    new $P6, [ 'OpBoolAndExpr' ]
    $P6.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6419
    __ARG_1.'unget'($P2)
.annotate 'line', 6420
    .return($P1)
# }
.annotate 'line', 6421

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_75')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6425
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6427
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_74'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6428
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6429
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('||')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6430
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_73'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6431
    new $P6, [ 'OpBoolOrExpr' ]
    $P6.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6433
    __ARG_1.'unget'($P2)
.annotate 'line', 6434
    .return($P1)
# }
.annotate 'line', 6435

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6439
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6441
# var econd: $P1
.const 'Sub' $P7 = 'WSubId_75'
    $P1 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6442
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6443
    $P8 = $P2.'isop'('?')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 6444
# var etrue: $P3
.const 'Sub' $P9 = 'WSubId_76'
    $P3 = $P9(__ARG_1, __ARG_2)
.const 'Sub' $P10 = 'WSubId_43'
.annotate 'line', 6445
    $P10(':', __ARG_1)
.annotate 'line', 6446
# var efalse: $P4
.const 'Sub' $P11 = 'WSubId_76'
    $P4 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6447
    new $P12, [ 'OpConditionalExpr' ]
    $P12.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P8, $P12
    .return($P8)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6450
    __ARG_1.'unget'($P2)
.annotate 'line', 6451
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6453

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6457
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_15'
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6459
# var lexpr: $P1
.const 'Sub' $P8 = 'WSubId_77'
    $P1 = $P8(__ARG_1, __ARG_2)
.annotate 'line', 6460
# var t: $P2
    null $P2
.annotate 'line', 6461
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6462
.const 'Sub' $P10 = 'WSubId_78'
    $P2 = __ARG_1.'get'()
    $P9 = $P10($P2)
    set $I1, $P9
    eq $I1, 0, __label_1
# {
.annotate 'line', 6463
# var rexpr: $P3
.const 'Sub' $P11 = 'WSubId_76'
    $P3 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6464
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6465
    set $I2, $I1
    set $I3, 4
    if $I2 == $I3 goto __label_5
    set $I3, 5
    if $I2 == $I3 goto __label_6
    set $I3, 6
    if $I2 == $I3 goto __label_7
    set $I3, 18
    if $I2 == $I3 goto __label_8
    set $I3, 23
    if $I2 == $I3 goto __label_9
    set $I3, 24
    if $I2 == $I3 goto __label_10
    set $I3, 30
    if $I2 == $I3 goto __label_11
    goto __label_4
  __label_5: # case
.annotate 'line', 6467
    new $P4, [ 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6470
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6473
    new $P4, [ 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6476
    new $P4, [ 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6479
    new $P4, [ 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6482
    new $P4, [ 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6485
    new $P4, [ 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6486
.const 'Sub' $P12 = 'WSubId_6'
.annotate 'line', 6488
    $P12('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6490
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6491
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6493
    __ARG_1.'unget'($P2)
.annotate 'line', 6494
    .return($P1)
# }
.annotate 'line', 6495

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6499
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6501
.const 'Sub' $P2 = 'WSubId_76'
    .tailcall $P2(__ARG_1, __ARG_2)
# }
.annotate 'line', 6502

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method
# Body
# {
.annotate 'line', 6517
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6518
    $P2('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6519
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6520
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6521
    .return($S1)
# }
.annotate 'line', 6522

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6525
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6526
    unless_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6527
    $P2('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6528
    .return($P1)
# }
.annotate 'line', 6529

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6513
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method
# Body
# {
.annotate 'line', 6538
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6539
    $P2('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6540
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6541
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6542
    .return($S1)
# }
.annotate 'line', 6543

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6546
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6547
    unless_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6548
    $P2('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6549
    .return($P1)
# }
.annotate 'line', 6550

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6532
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6534
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6566
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6567
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6568
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6569
    __ARG_2.'unget'($P1)
.annotate 'line', 6570
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6572

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6575
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6576
    if_null $P1, __label_1
.annotate 'line', 6577
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 6578
    .return(self)
# }
.annotate 'line', 6579

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6583
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6584
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 6587
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6588
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6589
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 6590
    self.'annotate'(__ARG_1)
.annotate 'line', 6591
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 6595
    le $I1, 0, __label_6
.annotate 'line', 6596
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6598
    self.'annotate'(__ARG_1)
.annotate 'line', 6599
    self.'emitret'(__ARG_1)
.annotate 'line', 6600
    le $I1, 0, __label_7
.annotate 'line', 6601
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 6602
    __ARG_1.'say'(')')
# }
.annotate 'line', 6603

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6560
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6562
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6610
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6611

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6614
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6615

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6606
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
.annotate 'line', 6622
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6623

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6626
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6627

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6618
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6640
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6641
    setattribute self, 'name', __ARG_1
.annotate 'line', 6642
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 6643

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6644
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6647
    self.'annotate'(__ARG_1)
.annotate 'line', 6648
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6649

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6634
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6636
    addattribute $P0, 'name'
.annotate 'line', 6637
    addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6663
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6664
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6665

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6666
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6669
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6670
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6671
    .return($S2)
# }
.annotate 'line', 6672

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6658
    addattribute $P0, 'owner'
.annotate 'line', 6659
    addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6685
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6686
# var t: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P2 = 'WSubId_79'
.annotate 'line', 6687
    $P2($P1)
.annotate 'line', 6688
    setattribute self, 'label', $P1
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 6689
    $P4(';', __ARG_2)
# }
.annotate 'line', 6690

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6691
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6694
    self.'annotate'(__ARG_1)
.annotate 'line', 6695
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6696
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6697
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6698

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6679
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6681
    addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6709
.const 'Sub' $P2 = 'WSubId_30'
    $P1 = $P2(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6710

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_43'
.annotate 'line', 6713
    $P1('(', __ARG_1)
.annotate 'line', 6714
.const 'Sub' $P3 = 'WSubId_30'
    $P2 = $P3(__ARG_1, self)
    self.'set'($P2)
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 6715
    $P4(')', __ARG_1)
# }
.annotate 'line', 6716

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6705
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
.annotate 'line', 6729
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6730
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6731
.const 'Sub' $P4 = 'WSubId_80'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6732
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6733
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6734
.const 'Sub' $P6 = 'WSubId_80'
    $P5 = $P6(__ARG_2, self)
    setattribute self, 'falsebranch', $P5
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6736
    new $P8, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P8
.annotate 'line', 6737
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6739

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6742
    self.'optimize_condition'()
.annotate 'line', 6743
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6744
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6745
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6747
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 6749
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6751
    .return(self)
# }
.annotate 'line', 6752

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6755
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6756
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6757
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6758
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6759
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6760
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 6761
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 6762
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6763
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 6764
    self.'annotate'(__ARG_1)
.annotate 'line', 6765
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6766
    $P1.'emit'(__ARG_1)
.annotate 'line', 6768
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 6769
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6770
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6771
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 6773
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6774

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6723
    get_class $P1, [ 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6725
    addattribute $P0, 'truebranch'
.annotate 'line', 6726
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6786
.const 'Sub' $P3 = 'WSubId_80'
    $P2 = $P3(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6787

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6790
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6791
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6793
    self.'annotate'(__ARG_1)
.annotate 'line', 6794
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6795
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6796
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6797
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6798

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6781
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6783
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6809
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6810
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6811
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6812

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6815
    self.'optimize_condition'()
.annotate 'line', 6816
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6817
    .return(self)
# }
.annotate 'line', 6818

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6821
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6823
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6826
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6829
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 6830
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 6832
    self.'annotate'(__ARG_1)
.annotate 'line', 6833
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6834
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6835
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6836
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6837
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 6839

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6805
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
.annotate 'line', 6850
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6851
    self.'parsebody'(__ARG_2)
.const 'Sub' $P1 = 'WSubId_81'
.annotate 'line', 6852
    $P1('while', __ARG_2)
.annotate 'line', 6853
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6854

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6857
    self.'optimize_condition'()
.annotate 'line', 6858
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6859
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6860
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 6861
    setattribute self, 'body', $P1
.annotate 'line', 6862
    .return(self)
# }
.annotate 'line', 6863

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6866
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6867
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 6868
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 6870
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6873
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 6874
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 6875
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 6877
    self.'annotate'(__ARG_1)
.annotate 'line', 6878
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6880
    $P1.'emit'(__ARG_1)
.annotate 'line', 6881
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6882
    eq $I1, 2, __label_7
.annotate 'line', 6883
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 6884
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 6886

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6846
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
.annotate 'line', 6897
    self.'Statement'(__ARG_1, __ARG_3)
.const 'Sub' $P1 = 'WSubId_43'
.annotate 'line', 6898
    $P1(';', __ARG_2)
# }
.annotate 'line', 6899

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6900
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6903
    self.'annotate'(__ARG_1)
.annotate 'line', 6904
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6905
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6906

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6893
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
.annotate 'line', 6917
    self.'Statement'(__ARG_1, __ARG_3)
.const 'Sub' $P1 = 'WSubId_43'
.annotate 'line', 6918
    $P1(';', __ARG_2)
# }
.annotate 'line', 6919

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6920
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6923
    self.'annotate'(__ARG_1)
.annotate 'line', 6924
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6925
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6926

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6913
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6941
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6942
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 6943
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 6944
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 6945

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6948
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 6949
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6950
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6951
    getattribute $P4, self, 'case_value'
.const 'Sub' $P6 = 'WSubId_30'
    $P5 = $P6(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6952
    $P1 = __ARG_1.'get'()
.annotate 'line', 6953
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.const 'Sub' $P7 = 'WSubId_29'
.annotate 'line', 6954
    $P7("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 6955
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 6956
    $P1 = __ARG_1.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_10
    $I2 = $P1.'iskeyword'('case')
  __label_10:
    if $I2 goto __label_9
    $I2 = $P1.'iskeyword'('default')
  __label_9:
    not $I1, $I2
    unless $I1 goto __label_7
# {
.annotate 'line', 6957
    __ARG_1.'unget'($P1)
.annotate 'line', 6958
.const 'Sub' $P8 = 'WSubId_80'
    $P3 = $P8(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 6960
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6961
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 6964
    $P1 = __ARG_1.'get'()
.annotate 'line', 6965
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.const 'Sub' $P9 = 'WSubId_29'
.annotate 'line', 6966
    $P9("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 6967
    $P1 = __ARG_1.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_15
    $I2 = $P1.'iskeyword'('case')
  __label_15:
    if $I2 goto __label_14
    $I2 = $P1.'iskeyword'('default')
  __label_14:
    not $I1, $I2
    unless $I1 goto __label_12
# {
.annotate 'line', 6968
    __ARG_1.'unget'($P1)
.annotate 'line', 6969
    getattribute $P3, self, 'default_st'
.const 'Sub' $P10 = 'WSubId_80'
    $P4 = $P10(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 6971
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6974
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.const 'Sub' $P11 = 'WSubId_29'
.annotate 'line', 6975
    $P11("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 6976

.end # parse_cases


.sub 'optimize_cases' :method
# Body
# {
.const 'Sub' $P2 = 'WSubId_28'
.annotate 'line', 6979
    getattribute $P3, self, 'case_value'
    $P2($P3)
.annotate 'line', 6980
    getattribute $P3, self, 'case_st'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.const 'Sub' $P5 = 'WSubId_28'
.annotate 'line', 6981
    $P5($P1)
    goto __label_1
  __label_2: # endfor
.const 'Sub' $P6 = 'WSubId_28'
.annotate 'line', 6982
    getattribute $P3, self, 'default_st'
    $P6($P3)
# }
.annotate 'line', 6983

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchBaseStatement' ]
.annotate 'line', 6933
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6935
    addattribute $P0, 'case_value'
.annotate 'line', 6936
    addattribute $P0, 'case_st'
.annotate 'line', 6937
    addattribute $P0, 'default_st'
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6996
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 6997
.const 'Sub' $P4 = 'WSubId_30'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 6998
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6999
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.const 'Sub' $P5 = 'WSubId_29'
.annotate 'line', 7000
    $P5("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7001
    $P1 = __ARG_2.'get'()
.annotate 'line', 7002
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.const 'Sub' $P6 = 'WSubId_29'
.annotate 'line', 7003
    $P6("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7004
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7005

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7008
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7009
    self.'optimize_cases'()
.annotate 'line', 7010
    .return(self)
# }
.annotate 'line', 7011

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7015
# type: $S1
    set $S1, ''
.annotate 'line', 7016
    getattribute $P7, self, 'case_value'
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7017
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7018
    ne $S2, 'N', __label_4
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 7019
    getattribute $P7, self, 'start'
    $P10("Invalid type in case", $P7)
  __label_4: # endif
.annotate 'line', 7020
    ne $S1, '', __label_5
.annotate 'line', 7021
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7022
    eq $S1, $S2, __label_7
.annotate 'line', 7023
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7026
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7027
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7031
    ne $S1, '', __label_8
.annotate 'line', 7032
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7034
    __ARG_1.'comment'('switch')
.annotate 'line', 7035
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7036
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7037
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7039
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7040
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7044
    self.'genbreaklabel'()
.annotate 'line', 7045
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7046
    new $P4, ['ResizableStringArray']
.annotate 'line', 7047
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7048
    getattribute $P7, self, 'case_value'
    iter $P11, $P7
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $P5, $P11
# {
.annotate 'line', 7049
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7050
# predefined push
    push $P4, $S7
.annotate 'line', 7051
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7052
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7054
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7057
    self.'annotate'(__ARG_1)
.annotate 'line', 7058
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7059
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7060
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7061
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.const 'Sub' $P12 = 'WSubId_42'
.annotate 'line', 7062
    $P7 = $P6[$I2]
    $P12(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7060
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7065
    __ARG_1.'emitlabel'($S5, 'default')
.const 'Sub' $P13 = 'WSubId_42'
.annotate 'line', 7066
    getattribute $P7, self, 'default_st'
    $P13(__ARG_1, $P7)
.annotate 'line', 7068
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7069

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6990
    get_class $P1, [ 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 6992
    addattribute $P0, 'condition'
.end
.namespace [ 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7081
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7082
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7083

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7086
    self.'optimize_cases'()
.annotate 'line', 7087
    .return(self)
# }
.annotate 'line', 7088

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7092
    self.'genbreaklabel'()
.annotate 'line', 7093
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7094
    new $P1, ['ResizableStringArray']
.annotate 'line', 7096
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7097
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7098
    getattribute $P4, self, 'case_value'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7099
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7100
# predefined push
    push $P1, $S3
.annotate 'line', 7101
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7102
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7104
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7107
    self.'annotate'(__ARG_1)
.annotate 'line', 7108
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7109
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7110
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7111
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.const 'Sub' $P7 = 'WSubId_42'
.annotate 'line', 7112
    $P4 = $P3[$I2]
    $P7(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7110
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7115
    __ARG_1.'emitlabel'($S1, 'default')
.const 'Sub' $P8 = 'WSubId_42'
.annotate 'line', 7116
    getattribute $P4, self, 'default_st'
    $P8(__ARG_1, $P4)
.annotate 'line', 7118
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7119

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchCaseStatement' ]
.annotate 'line', 7076
    get_class $P1, [ 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'parseSwitch' :subid('WSubId_40')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7126
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7127
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7128
    new $P4, [ 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7129
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7130
    new $P4, [ 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.const 'Sub' $P5 = 'WSubId_29'
.annotate 'line', 7131
    $P5("'(' in switch", $P1)
# }
.annotate 'line', 7132

.end # parseSwitch

.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7145
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7146
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7147
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7148
    __ARG_2.'unget'($P1)
.annotate 'line', 7149
.const 'Sub' $P4 = 'WSubId_80'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7151
    $P1 = __ARG_2.'get'()
.annotate 'line', 7152
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7153
    __ARG_2.'unget'($P1)
.annotate 'line', 7154
    self.'parseconditionshort'(__ARG_2)
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 7155
    $P5(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7157
    $P1 = __ARG_2.'get'()
.annotate 'line', 7158
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7159
    __ARG_2.'unget'($P1)
.annotate 'line', 7160
.const 'Sub' $P6 = 'WSubId_30'
    $P3 = $P6(__ARG_2, self)
    setattribute self, 'iteration', $P3
.const 'Sub' $P7 = 'WSubId_43'
.annotate 'line', 7161
    $P7(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7163
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7164

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7167
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_1
.annotate 'line', 7168
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 7169
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_2
.annotate 'line', 7170
    self.'optimize_condition'()
  __label_2: # endif
.annotate 'line', 7171
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_3
.annotate 'line', 7172
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
  __label_3: # endif
.annotate 'line', 7173
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7174
    .return(self)
# }
.annotate 'line', 7175

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7178
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7179
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7180
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7181
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7182
    .return()
# }
  __label_1: # endif
.annotate 'line', 7184
    __ARG_1.'comment'('for loop')
.annotate 'line', 7185
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7186
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7187
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7188
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7189
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7191
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7192
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7193
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7195
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7196
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7197
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7198
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7199
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7201
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7202

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 7138
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7140
    addattribute $P0, 'initializer'
.annotate 'line', 7141
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
.annotate 'line', 7217
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7218
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7219
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7220
# deftype: $S2
.const 'Sub' $P2 = 'WSubId_82'
    $P1 = $P2(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7221
    self.'createvar'($S1, $S2)
.annotate 'line', 7222
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7224
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7225
.const 'Sub' $P4 = 'WSubId_30'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'container', $P3
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 7226
    $P5(')', __ARG_2)
.annotate 'line', 7227
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7228

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7231
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7232
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7233
    .return(self)
# }
.annotate 'line', 7234

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7237
    self.'annotate'(__ARG_1)
.annotate 'line', 7238
# regcont: $S1
    null $S1
.annotate 'line', 7239
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7240
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7241
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7242
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7245
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7246
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7247
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 7248
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_5
    set $S4, $P2
  __label_5:
.annotate 'line', 7249
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_6
    set $S5, $P2
  __label_6:
.annotate 'line', 7250
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7251
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7252
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7253
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7254
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7255
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7256
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7257
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7258

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 7209
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7211
    addattribute $P0, 'deftype'
.annotate 'line', 7212
    addattribute $P0, 'varname'
.annotate 'line', 7213
    addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor' :subid('WSubId_41')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 7265
    $P4('(', __ARG_2)
.annotate 'line', 7266
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7267
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7268
    $P5 = $P2.'iskeyword'('in')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7269
    new $P7, [ 'ForeachStatement' ]
    $P7.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P6, $P7
    .return($P6)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7271
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7272
    $P5 = $P3.'iskeyword'('in')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 7273
    new $P7, [ 'ForeachStatement' ]
    $P7.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 7274
    __ARG_2.'unget'($P3)
.annotate 'line', 7275
    __ARG_2.'unget'($P2)
.annotate 'line', 7276
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7278
    new $P6, [ 'ForStatement' ]
    $P6.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 7279

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7291
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7292
.const 'Sub' $P3 = 'WSubId_30'
    $P2 = $P3(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7293

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7296
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7297
    .return(self)
# }
.annotate 'line', 7298

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7301
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7302
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7303
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7304
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7306
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7309
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7310
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7312
    getattribute $P4, self, 'start'
    $P3("Invalid throw argument", $P4)
  __label_2: # switch end
# }
.annotate 'line', 7314

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 7285
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7287
    addattribute $P0, 'excep'
.end
.namespace [ 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7326
    setattribute self, 'start', __ARG_1
.annotate 'line', 7327
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7328

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7331
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7332
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7333
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7334
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7335
    set $S3, $S1
    set $S4, 'min_severity'
    if $S3 == $S4 goto __label_6
    set $S4, 'max_severity'
    if $S3 == $S4 goto __label_7
    set $S4, 'handle_types'
    if $S3 == $S4 goto __label_8
    set $S4, 'handle_types_except'
    if $S3 == $S4 goto __label_9
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 7338
    eq $I1, 1, __label_10
.const 'Sub' $P8 = 'WSubId_1'
.annotate 'line', 7339
    getattribute $P7, self, 'start'
    $P8('Wrong modifier args', $P7)
  __label_10: # endif
.annotate 'line', 7340
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7341
# argreg: $S2
    $P9 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P9, __label_11
    set $S2, $P9
  __label_11:
.annotate 'line', 7342
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7346
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7347
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7348
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7349
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7347
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7352
# predefined join
.annotate 'line', 7351
    join $S3, ', ', $P4
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7353
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 7355
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    getattribute $P7, self, 'start'
    $P10($S4, $P7)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7358

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryModifierList' ]
.annotate 'line', 7321
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7323
    addattribute $P0, 'start'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7370
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7371
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7372
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7373
    new $P5, [ 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7375
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7377
.const 'Sub' $P6 = 'WSubId_80'
    $P3 = $P6(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7378
    $P1 = __ARG_2.'get'()
.annotate 'line', 7379
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.const 'Sub' $P7 = 'WSubId_2'
.annotate 'line', 7380
    $P7('catch', $P1)
  __label_3: # endif
.annotate 'line', 7381
    $P1 = __ARG_2.'get'()
.annotate 'line', 7382
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.const 'Sub' $P8 = 'WSubId_29'
.annotate 'line', 7383
    $P8("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7384
    $P1 = __ARG_2.'get'()
.annotate 'line', 7385
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7386
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7387
    setattribute self, 'exname', $P1
.annotate 'line', 7388
    self.'createvar'($S1, 'P')
.annotate 'line', 7389
    $P1 = __ARG_2.'get'()
.annotate 'line', 7390
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.const 'Sub' $P9 = 'WSubId_29'
.annotate 'line', 7391
    $P9("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7393
.const 'Sub' $P10 = 'WSubId_80'
    $P3 = $P10(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7394

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7397
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7398
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7399
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7400
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
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
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7406
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7407
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7408
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7409
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7410
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7412
    self.'annotate'(__ARG_1)
.annotate 'line', 7413
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7415
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7416
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7418
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7419
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7421
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7422
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7423
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7424
    __ARG_1.'comment'('try: end')
.annotate 'line', 7425
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7427
    self.'annotate'(__ARG_1)
.annotate 'line', 7428
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7430
    __ARG_1.'comment'('catch')
.annotate 'line', 7431
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7432
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7433
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7434
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7435
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7437
    __ARG_1.'comment'('catch end')
.annotate 'line', 7438
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7439

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 7361
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7363
    addattribute $P0, 'stry'
.annotate 'line', 7364
    addattribute $P0, 'modifiers'
.annotate 'line', 7365
    addattribute $P0, 'exname'
.annotate 'line', 7366
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
.annotate 'line', 7452
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7453
    setattribute self, 'name', __ARG_3
.annotate 'line', 7454
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7455
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7456

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7446
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7448
    addattribute $P0, 'name'
.annotate 'line', 7449
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
.annotate 'line', 7471
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7472
    setattribute self, 'name', __ARG_3
.annotate 'line', 7473
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7474

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7463
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7465
    addattribute $P0, 'name'
.annotate 'line', 7466
    addattribute $P0, 'basetype'
.annotate 'line', 7467
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
.annotate 'line', 7485
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7486
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7487
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7488
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7489
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7491
.const 'Sub' $P6 = 'WSubId_30'
    $P5 = $P6(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7494
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7495

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7498
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7499
    if_null $P1, __label_1
.annotate 'line', 7500
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7501
    .return(self)
# }
.annotate 'line', 7502

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7505
    self.'annotate'(__ARG_1)
.annotate 'line', 7506
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7507
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7508
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7509
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7510
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7512
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7513
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7515
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7516
    ne $S4, $S3, __label_8
# {
.annotate 'line', 7517
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_12
    isa $I1, $P1, [ 'ConcatString' ]
  __label_12:
    unless $I1 goto __label_10
.annotate 'line', 7518
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 7520
    $P1.'emit'(__ARG_1, $S2)
  __label_11: # endif
# }
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7523
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_13
# {
.annotate 'line', 7525
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 7528
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7529
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_17
    set $S8, ''
    if $S7 == $S8 goto __label_18
    goto __label_16
  __label_17: # case
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7531
    getattribute $P2, self, 'start'
    $P3('Invalid initialization from void value', $P2)
  __label_18: # case
.annotate 'line', 7533
    $P4 = $P1.'emit_get'(__ARG_1)
    set $S5, $P4
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 7536
    $P5 = self.'tempreg'($S4)
    set $S5, $P5
.annotate 'line', 7537
    $P1.'emit'(__ARG_1, $S5)
  __label_15: # switch end
.annotate 'line', 7539
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_21
    iseq $I1, $S4, 'P'
  __label_21:
    unless $I1 goto __label_19
# {
.annotate 'line', 7540
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_22
    set $S6, $P2
  __label_22:
.annotate 'line', 7541
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7542
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7543
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7544
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_20
  __label_19: # else
.annotate 'line', 7547
    __ARG_1.'emitset'($S2, $S5)
  __label_20: # endif
# }
  __label_14: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 7551

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7479
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7481
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
.annotate 'line', 7566
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7567
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7568
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7569
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7570
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7571
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7573
    __ARG_6.'unget'($P2)
.annotate 'line', 7574
.const 'Sub' $P5 = 'WSubId_30'
    $P4 = $P5(__ARG_6, self)
    setattribute self, 'size', $P4
.const 'Sub' $P6 = 'WSubId_43'
.annotate 'line', 7575
    $P6(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 7577
    $P2 = __ARG_6.'get'()
.annotate 'line', 7578
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 7579
    $P2 = __ARG_6.'get'()
.annotate 'line', 7580
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.const 'Sub' $P7 = 'WSubId_29'
.annotate 'line', 7581
    $P7("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 7582
    $P2 = __ARG_6.'get'()
.annotate 'line', 7583
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 7584
    __ARG_6.'unget'($P2)
.annotate 'line', 7585
.const 'Sub' $P8 = 'parseExpr'
.annotate 'line', 7586
.const 'Sub' $P9 = 'WSubId_27'
    $P4 = $P9(__ARG_6, self, $P8, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 7590
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 7591

.end # DeclareArrayStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7594
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 7595
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.const 'Sub' $P5 = 'WSubId_28'
.annotate 'line', 7596
    getattribute $P1, self, 'initarray'
    $P5($P1)
.annotate 'line', 7597
    .return(self)
# }
.annotate 'line', 7598

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7601
    self.'annotate'(__ARG_1)
.annotate 'line', 7603
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7604
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7605
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7606
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7607
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7608
    if_null $P2, __label_1
# {
.annotate 'line', 7610
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 7611
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7615
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 7617
    if_null $P3, __label_4
# {
.annotate 'line', 7618
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7619
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7620
    unless_null $P2, __label_6
# {
.annotate 'line', 7621
    le $I1, 0, __label_7
# {
.annotate 'line', 7623
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 7626
# i: $I2
    null $I2
.annotate 'line', 7627
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 7628
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7629
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7630
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 7633

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7556
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7558
    addattribute $P0, 'size'
.annotate 'line', 7559
    addattribute $P0, 'initarray'
.annotate 'line', 7560
    addattribute $P0, 'arraytype'
.end
.namespace [ ]

.sub 'parseDeclareHelper' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7640
# var next: $P1
    null $P1
.annotate 'line', 7641
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 7642
# {
.annotate 'line', 7643
# var name: $P3
    $P3 = __ARG_4.'get'()
.const 'Sub' $P6 = 'WSubId_79'
.annotate 'line', 7644
    $P6($P3)
.annotate 'line', 7645
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7646
# var item: $P5
    null $P5
.annotate 'line', 7647
    $P7 = $P4.'isop'('[')
    if_null $P7, __label_4
    unless $P7 goto __label_4
.annotate 'line', 7648
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7650
    __ARG_4.'unget'($P4)
.annotate 'line', 7651
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 7653
.const 'Sub' $P8 = 'WSubId_83'
    $P2 = $P8($P2, $P5)
.annotate 'line', 7654
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 7655
    $P7 = $P1.'isop'(',')
    if_null $P7, __label_2
    if $P7 goto __label_1
  __label_2: # enddo
.const 'Sub' $P9 = 'WSubId_4'
.annotate 'line', 7656
    $P9(';', $P1)
.annotate 'line', 7657
    .return($P2)
# }
.annotate 'line', 7658

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7666
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7667

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7662
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
.annotate 'line', 7674
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7675

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7670
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
.annotate 'line', 7681
    new $P2, [ 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7682

.end # newIntSingle


.sub 'newIntArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7686
    new $P2, [ 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7687

.end # newIntArray


.sub 'parseInt' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7691
.const 'Sub' $P1 = 'newIntSingle'
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7692
.const 'Sub' $P3 = 'WSubId_84'
    .tailcall $P3($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7693

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7701
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7702

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7697
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
.annotate 'line', 7709
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7710

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7705
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
.annotate 'line', 7716
    new $P2, [ 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7717

.end # newFloatSingle


.sub 'newFloatArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7721
    new $P2, [ 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7722

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7726
.const 'Sub' $P1 = 'newFloatSingle'
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7727
.const 'Sub' $P3 = 'WSubId_84'
    .tailcall $P3($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7728

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7736
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7737

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7732
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
.annotate 'line', 7744
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7745

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7740
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
.annotate 'line', 7751
    new $P2, [ 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7752

.end # newStringSingle


.sub 'newStringArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7756
    new $P2, [ 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7757

.end # newStringArray


.sub 'parseString' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7761
.const 'Sub' $P1 = 'newStringSingle'
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7762
.const 'Sub' $P3 = 'WSubId_84'
    .tailcall $P3($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7763

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
.annotate 'line', 7779
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7780
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7781
    setattribute self, 'name', __ARG_4
.annotate 'line', 7782
    setattribute self, 'value', __ARG_5
.annotate 'line', 7783
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 7784

.end # ConstStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7787
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7788
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7789
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7790
    $P1 = $P1.'optimize'()
.annotate 'line', 7791
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 7793
    getattribute $P5, self, 'start'
.annotate 'line', 7792
    $P4('Value for const is not evaluable at compile time', $P5)
# }
  __label_2: # endif
.annotate 'line', 7795
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 7796
    .return(self)
# }
.annotate 'line', 7797

.end # optimize


.sub 'checkresult' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 7800
    getattribute $P2, self, 'start'
    $P1('Direct use of const', $P2)
# }
.annotate 'line', 7801

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7804
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7805

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7769
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7771
    addattribute $P0, 'type'
.annotate 'line', 7772
    addattribute $P0, 'name'
.annotate 'line', 7773
    addattribute $P0, 'data'
.annotate 'line', 7774
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7810
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7811
# type: $S1
.const 'Sub' $P6 = 'WSubId_82'
    $P5 = $P6($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7812
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.const 'Sub' $P7 = 'WSubId_1'
.annotate 'line', 7813
    $P7('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 7815
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 7816
# {
.annotate 'line', 7817
    $P1 = __ARG_2.'get'()
.annotate 'line', 7818
# var name: $P3
    set $P3, $P1
.const 'Sub' $P8 = 'WSubId_43'
.annotate 'line', 7819
    $P8('=', __ARG_2)
.annotate 'line', 7820
# var value: $P4
.const 'Sub' $P9 = 'WSubId_30'
    $P4 = $P9(__ARG_2, __ARG_3)
.annotate 'line', 7821
.const 'Sub' $P10 = 'WSubId_83'
.annotate 'line', 7822
    new $P11, [ 'ConstStatement' ]
    $P11.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P11
.annotate 'line', 7821
    $P2 = $P10($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 7823
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 7824
    .return($P2)
# }
.annotate 'line', 7825

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
.annotate 'line', 7836
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7837
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7838
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 7839
.const 'Sub' $P5 = 'WSubId_30'
    $P4 = $P5(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7840
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.const 'Sub' $P6 = 'WSubId_4'
.annotate 'line', 7842
    $P6(';', $P1)
# }
.annotate 'line', 7843

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7846
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 7847
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7848
    .return(self)
# }
.annotate 'line', 7849

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7852
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7853

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7856
    self.'annotate'(__ARG_1)
.annotate 'line', 7857
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7858
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7859
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7860
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7861
    if_null $P1, __label_3
.annotate 'line', 7862
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 7863
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 7864
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 7865
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    set $S5, 'P'
    if $S4 == $S5 goto __label_9
    set $S5, 'S'
    if $S4 == $S5 goto __label_10
    set $S5, 'I'
    if $S4 == $S5 goto __label_11
    set $S5, 'N'
    if $S4 == $S5 goto __label_12
    set $S5, 'v'
    if $S4 == $S5 goto __label_13
    goto __label_8
  __label_9: # case
.annotate 'line', 7867
    isa $I1, $P1, [ 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7868
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 7870
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 7875
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 7876
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 7877
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 7879
    getattribute $P5, self, 'name'
    $P4("Can't use void function as initializer", $P5)
  __label_8: # default
.const 'Sub' $P6 = 'WSubId_1'
.annotate 'line', 7881
    getattribute $P7, self, 'name'
    $P6("Invalid var initializer", $P7)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 7885
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 7886

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7831
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7833
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
.annotate 'line', 7893
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.const 'Sub' $P1 = 'WSubId_43'
.annotate 'line', 7894
    $P1(';', __ARG_2)
# }
.annotate 'line', 7895

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7898
    self.'annotate'(__ARG_1)
.annotate 'line', 7899
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7900
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 7901
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7902

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7889
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
.annotate 'line', 7911
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7912
.const 'Sub' $P3 = 'WSubId_30'
    $P2 = $P3(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 7913
    $P4(']', __ARG_2)
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 7914
    $P5(';', __ARG_2)
# }
.annotate 'line', 7915

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7918
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7919
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7920

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7923
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7924
    self.'annotate'(__ARG_1)
.annotate 'line', 7925
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7926
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7927
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7928

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7905
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7907
    addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7933
# var name: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P3 = 'WSubId_79'
.annotate 'line', 7934
    $P3($P1)
.annotate 'line', 7935
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7936
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7937
    $P2 = __ARG_2.'get'()
.annotate 'line', 7938
    $P4 = $P2.'isop'(']')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7939
    new $P6, [ 'ResizableVarStatement' ]
    $P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P5, $P6
    .return($P5)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 7941
    __ARG_2.'unget'($P2)
.annotate 'line', 7942
    new $P5, [ 'FixedVarStatement' ]
    $P5.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
# }
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7946
    __ARG_2.'unget'($P2)
.annotate 'line', 7947
    new $P5, [ 'VarStatement' ]
    $P5.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P4, $P5
    .return($P4)
# }
  __label_2: # endif
# }
.annotate 'line', 7949

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_35')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7953
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7954
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7955
    $P3("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 7956
.const 'Sub' $P4 = 'WSubId_36'
    .tailcall $P4(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7957

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7970
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7971
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7972
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7973
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7974
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7975
    __ARG_2.'unget'($P1)
.annotate 'line', 7976
# var c: $P2
.const 'Sub' $P6 = 'WSubId_80'
    $P2 = $P6(__ARG_2, self)
.annotate 'line', 7977
    unless_null $P2, __label_3
.const 'Sub' $P7 = 'WSubId_6'
.annotate 'line', 7978
    $P7('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 7979
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7981
    setattribute self, 'end', $P1
# }
.annotate 'line', 7982

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7985
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7986
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7987
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7988
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7989
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 7990
    .return($S2)
# }
.annotate 'line', 7991

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7994
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7995
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7996
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7997
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7998
    $P3('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 7999
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8000
    $P1[$S1] = $S3
.annotate 'line', 8001
    .return($S3)
# }
.annotate 'line', 8002

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8003
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8006
    __ARG_1.'comment'('{')
.annotate 'line', 8007
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8008
    $P1.'emit'(__ARG_1)
.annotate 'line', 8009
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8011
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8012

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7963
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7965
    addattribute $P0, 'end'
.annotate 'line', 7966
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8027
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8029
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8030
    new $P1, ['ResizableStringArray']
.annotate 'line', 8031
    new $P2, ['ResizableStringArray']
.annotate 'line', 8032
    setattribute self, 'tempreg', $P1
.annotate 'line', 8033
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8034

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8037
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8038
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8039
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8040
    assign $P1, $I1
# predefined string
.annotate 'line', 8041
    getattribute $P2, self, 'type'
.annotate 'line', 8036
    set $S2, $P2
.annotate 'line', 8041
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8042

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8045
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8046
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8047
# reg: $S1
    null $S1
.annotate 'line', 8048
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_1
.annotate 'line', 8049
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8051
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8052
# predefined push
    push $P2, $S1
.annotate 'line', 8053
    .return($S1)
# }
.annotate 'line', 8054

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8057
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8058
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8059
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8060
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8061
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8062
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8060
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8064
    assign $P2, 0
# }
.annotate 'line', 8065

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 8021
    addattribute $P0, 'type'
.annotate 'line', 8022
    addattribute $P0, 'nreg'
.annotate 'line', 8023
    addattribute $P0, 'tempreg'
.annotate 'line', 8024
    addattribute $P0, 'freereg'
.end
.namespace [ 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8076
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8077

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 8080
# var named: $P1
    null $P1
.annotate 'line', 8081
# var slurpy: $P2
    null $P2
.annotate 'line', 8082
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8083
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8084
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8085
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8087
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8090
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8093
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8097
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8104
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8121
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8102
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8105
# setname: $S2
    null $S2
# switch
.annotate 'line', 8106
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8108
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8111
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8112
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.const 'Sub' $P9 = 'WSubId_1'
.annotate 'line', 8113
    $P9('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8114
    $P10 = $P5.'getPirString'()
    set $S2, $P10
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8115
.const 'Sub' $P11 = 'WSubId_1'
.annotate 'line', 8117
    $P11('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8119
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8122
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8123
# }
.annotate 'line', 8125

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ParameterModifierList' ]
.annotate 'line', 8072
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8135
    setattribute self, 'func', __ARG_1
.annotate 'line', 8136
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8137
# type: $S1
.const 'Sub' $P3 = 'WSubId_82'
    $P4 = $P1.'checkkeyword'()
    $P2 = $P3($P4)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8138
    eq $S1, '', __label_2
.annotate 'line', 8139
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8141
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8142
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8143
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8145
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8146
    $P1 = __ARG_2.'get'()
.annotate 'line', 8147
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8148
    new $P6, [ 'ParameterModifierList' ]
    $P6.'ParameterModifierList'(__ARG_2, self)
    set $P5, $P6
    setattribute self, 'modifiers', $P5
    goto __label_5
  __label_4: # else
.annotate 'line', 8150
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8151

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8154
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8155
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8156
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8157
# ptype: $S2
.const 'Sub' $P5 = 'WSubId_85'
    $P6 = $P2.'gettype'()
    $P4 = $P5($P6)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8158
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8159
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8160
    if_null $P3, __label_3
.annotate 'line', 8161
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8162
    __ARG_1.'say'('')
# }
.annotate 'line', 8163

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionParameter' ]
.annotate 'line', 8130
    addattribute $P0, 'func'
.annotate 'line', 8131
    addattribute $P0, 'name'
.annotate 'line', 8132
    addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'parseParameter'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8168
    new $P2, [ 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8169

.end # parseParameter

.namespace [ 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8179
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8180

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8183
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8184
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8185
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8186
    le $I1, 0, __label_3
# {
.annotate 'line', 8187
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8188
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8189
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8190
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.const 'Sub' $P6 = 'WSubId_1'
.annotate 'line', 8191
    getattribute $P5, $P2, 'start'
    $P6('Invalid modifier', $P5)
  __label_7: # endif
.annotate 'line', 8192
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_4: # for iteration
.annotate 'line', 8188
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8194
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8197

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionModifierList' ]
.annotate 'line', 8175
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8219
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8220
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8221
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8222
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8223
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8224
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8225

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8227
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8231
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8232
    unless_null $P1, __label_1
.annotate 'line', 8233
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8234
    .return($P1)
# }
.annotate 'line', 8235

.end # makesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8239
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8240
    .return($I1)
# }
.annotate 'line', 8241

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8244
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8245
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8246
    __ARG_1.'unget'($P1)
.annotate 'line', 8247
.const 'Sub' $P3 = 'parseParameter'
.annotate 'line', 8248
.const 'Sub' $P5 = 'WSubId_27'
    $P4 = $P5(__ARG_1, self, $P3, ')')
    setattribute self, 'params', $P4
# }
  __label_1: # endif
# }
.annotate 'line', 8250

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8254
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8255
    unless_null $P1, __label_1
.annotate 'line', 8256
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8258
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8259

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8262
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8263
    unless_null $P1, __label_1
# {
.annotate 'line', 8265
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8268
    iter $P6, $P1
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P2, $P6
.annotate 'line', 8269
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8270
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8271
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8273

.end # usenamespace


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8276
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8277
    if_null $P1, __label_1
# {
.annotate 'line', 8278
# var found: $P2
    null $P2
.annotate 'line', 8279
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 8280
    $P2 = $P3.'findsymbol'(__ARG_1)
.annotate 'line', 8281
    if_null $P2, __label_4
.annotate 'line', 8282
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8285
    getattribute $P5, self, 'owner'
    .tailcall $P5.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8286

.end # findsymbol


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8290
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8291
    if_null $P1, __label_1
# {
.annotate 'line', 8292
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 8293
    $P2.'fixnamespaces'()
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8295
    getattribute $P6, self, 'body'
    $P5 = $P6.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 8296
    .return(self)
# }
.annotate 'line', 8297

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8301
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8302
    unless_null $P1, __label_1
.annotate 'line', 8303
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8304
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8305

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8308
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8309
    unless_null $P1, __label_1
.annotate 'line', 8310
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8311
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8312

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8317
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8318
# lexname: $S1
    null $S1
.annotate 'line', 8319
    if_null $P1, __label_1
.annotate 'line', 8320
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8322
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8323
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8324
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8325
    self.'setlex'($S1, $S2)
.annotate 'line', 8326
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8328
    .return($S1)
# }
.annotate 'line', 8329

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8333
# var store: $P1
    null $P1
# switch
.annotate 'line', 8334
    set $S2, __ARG_1
    set $S3, 'I'
    if $S2 == $S3 goto __label_3
    set $S3, 'N'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    set $S3, 'P'
    if $S2 == $S3 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 8336
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8338
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8340
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8342
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 8344
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    $P2($S4)
  __label_1: # switch end
.annotate 'line', 8346
# reg: $S1
    $P3 = $P1.'createreg'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 8347
    .return($S1)
# }
.annotate 'line', 8348

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8351
# var store: $P1
    null $P1
# switch
.annotate 'line', 8352
    set $S2, __ARG_1
    set $S3, 'I'
    if $S2 == $S3 goto __label_3
    set $S3, 'N'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    set $S3, 'P'
    if $S2 == $S3 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 8354
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8356
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8358
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8360
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 8362
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    $P2($S4)
  __label_1: # switch end
.annotate 'line', 8364
# reg: $S1
    $P3 = $P1.'tempreg'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 8365
    .return($S1)
# }
.annotate 'line', 8366

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8369
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
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
.annotate 'line', 8370
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8371

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8374
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8373
    set $S1, $I1
.annotate 'line', 8375
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8376

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 8379
    $P1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8380

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 8383
    $P1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8384

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8388
# name: $S1
    getattribute $P9, self, 'name'
    null $S1
    if_null $P9, __label_1
    set $S1, $P9
  __label_1:
.annotate 'line', 8389
    __ARG_1.'say'()
.annotate 'line', 8390
    __ARG_1.'print'(".sub ")
.annotate 'line', 8391
    $P9 = self.'isanonymous'()
    if_null $P9, __label_2
    unless $P9 goto __label_2
.annotate 'line', 8392
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8394
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8395
    getattribute $P9, self, 'subid'
    if_null $P9, __label_4
.annotate 'line', 8396
    getattribute $P10, self, 'subid'
    __ARG_1.'print'(" :subid('", $P10, "')")
  __label_4: # endif
.annotate 'line', 8397
    getattribute $P9, self, 'outer'
    if_null $P9, __label_5
# {
.annotate 'line', 8398
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8399
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8400
    if_null $P2, __label_6
.annotate 'line', 8401
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8405
    $P9 = self.'ismethod'()
    if_null $P9, __label_7
    unless $P9 goto __label_7
.annotate 'line', 8406
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8407
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8408
    if_null $P3, __label_8
.annotate 'line', 8409
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8411
    ne $S1, 'main', __label_10
.annotate 'line', 8412
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8414
    __ARG_1.'say'()
.const 'Sub' $P11 = 'WSubId_42'
.annotate 'line', 8417
    getattribute $P9, self, 'params'
    $P11(__ARG_1, $P9)
.annotate 'line', 8419
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8420
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8421
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8422
    getattribute $P9, self, 'start'
    __ARG_1.'annotate'($P9)
.annotate 'line', 8424
    if_null $P4, __label_13
# {
.annotate 'line', 8425
    iter $P12, $P4
    set $P12, 0
  __label_14: # for iteration
    unless $P12 goto __label_15
    shift $S2, $P12
.annotate 'line', 8426
    $P9 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P9, "', ", $S2)
    goto __label_14
  __label_15: # endfor
# }
  __label_13: # endif
.annotate 'line', 8429
    if_null $P5, __label_16
# {
.annotate 'line', 8430
    iter $P13, $P5
    set $P13, 0
  __label_17: # for iteration
    unless $P13 goto __label_18
    shift $S3, $P13
.annotate 'line', 8431
    $P9 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P9)
    goto __label_17
  __label_18: # endfor
# }
  __label_16: # endif
# }
  __label_11: # endif
.annotate 'line', 8435
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 8436
    $P9 = $P6.'isempty'()
    if_null $P9, __label_19
    unless $P9 goto __label_19
.annotate 'line', 8437
    __ARG_1.'comment'('Empty body')
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 8439
    __ARG_1.'comment'('Body')
.annotate 'line', 8440
    $P6.'emit'(__ARG_1)
.annotate 'line', 8441
    $P9 = $P6.'getend'()
    __ARG_1.'annotate'($P9)
# }
  __label_20: # endif
.annotate 'line', 8443
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8446
# var localfun: $P7
    getattribute $P7, self, 'localfun'
.annotate 'line', 8447
    if_null $P7, __label_21
# {
.annotate 'line', 8448
    iter $P14, $P7
    set $P14, 0
  __label_22: # for iteration
    unless $P14 goto __label_23
    shift $P8, $P14
.annotate 'line', 8449
    $P8.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
  __label_21: # endif
# }
.annotate 'line', 8451

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 8200
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8202
    addattribute $P0, 'name'
.annotate 'line', 8203
    addattribute $P0, 'subid'
.annotate 'line', 8204
    addattribute $P0, 'modifiers'
.annotate 'line', 8205
    addattribute $P0, 'params'
.annotate 'line', 8206
    addattribute $P0, 'body'
.annotate 'line', 8207
    addattribute $P0, 'regstI'
.annotate 'line', 8208
    addattribute $P0, 'regstN'
.annotate 'line', 8209
    addattribute $P0, 'regstS'
.annotate 'line', 8210
    addattribute $P0, 'regstP'
.annotate 'line', 8211
    addattribute $P0, 'nlabel'
.annotate 'line', 8212
    addattribute $P0, 'localfun'
.annotate 'line', 8213
    addattribute $P0, 'lexicals'
.annotate 'line', 8214
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8215
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8465
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8466
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8467
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8468
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8469

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8471
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8475
    getattribute $P1, self, 'paramnum'
    inc $P1
.annotate 'line', 8473
    set $I1, $P1
.annotate 'line', 8475
    .return($I1)
# }
.annotate 'line', 8476

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8480
    getattribute $P1, self, 'lexnum'
    inc $P1
.annotate 'line', 8478
    set $I1, $P1
.annotate 'line', 8480
    .return($I1)
# }
.annotate 'line', 8481

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8482
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8486
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8487
    setattribute self, 'name', $P1
.annotate 'line', 8488
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8489
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 8490
    new $P8, [ 'FunctionModifierList' ]
    $P8.'FunctionModifierList'(__ARG_1, self)
    set $P7, $P8
    setattribute self, 'modifiers', $P7
.annotate 'line', 8491
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.const 'Sub' $P9 = 'WSubId_4'
.annotate 'line', 8493
    $P9('(', $P2)
.annotate 'line', 8494
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8496
# var fullname: $P3
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getpath'()
# predefined clone
    clone $P3, $P5
.annotate 'line', 8497
    $P5 = $P1.'getidentifier'()
# predefined push
    push $P3, $P5
.annotate 'line', 8498
# var cfunction: $P4
    $P4 = self.'createconst'('__FUNCTION__', 'S')
.annotate 'line', 8499
    new $P6, [ 'StringLiteral' ]
.annotate 'line', 8500
    new $P8, [ 'TokenQuoted' ]
    getattribute $P10, $P1, 'file'
    getattribute $P11, $P1, 'line'
.annotate 'line', 8501
# predefined join
.annotate 'line', 8499
    join $S1, '.', $P3
    $P8.'TokenQuoted'($P10, $P11, $S1)
    set $P7, $P8
    $P6.'StringLiteral'(self, $P7)
    set $P5, $P6
    $P4.'setvalue'($P5)
.annotate 'line', 8503
    $P2 = __ARG_1.'get'()
.annotate 'line', 8504
    $P5 = $P2.'isop'('{')
    isfalse $I1, $P5
    unless $I1 goto __label_2
.const 'Sub' $P12 = 'WSubId_2'
.annotate 'line', 8505
    $P12('{', $P2)
  __label_2: # endif
.annotate 'line', 8506
    new $P7, [ 'CompoundStatement' ]
    $P7.'CompoundStatement'($P2, __ARG_1, self)
    set $P6, $P7
    setattribute self, 'body', $P6
.annotate 'line', 8507
    .return(self)
# }
.annotate 'line', 8508

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8458
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8460
    addattribute $P0, 'paramnum'
.annotate 'line', 8461
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8519
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8520
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8521
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8522
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8523
    setattribute self, 'name', $P1
.annotate 'line', 8524
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8525
# var t: $P2
    $P2 = __ARG_2.'get'()
.const 'Sub' $P5 = 'WSubId_4'
.annotate 'line', 8526
    $P5('{', $P2)
.annotate 'line', 8527
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P6
    setattribute self, 'body', $P4
.annotate 'line', 8528
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8529

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8530
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8531
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8534
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8535

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8539
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8540

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8544
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8545

.end # getlexnum


.sub 'getvar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8548
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8549
    unless_null $P1, __label_1
.annotate 'line', 8550
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 8551
    unless_null $P1, __label_2
# {
.annotate 'line', 8554
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8555
    unless_null $P1, __label_3
# {
.annotate 'line', 8557
    ne __ARG_1, 'self', __label_5
# {
.annotate 'line', 8558
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8559
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
# {
.annotate 'line', 8560
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_7
    set $S1, $P8
  __label_7:
.annotate 'line', 8561
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8562
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_8
    set $S2, $P6
  __label_8:
.annotate 'line', 8563
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 8567
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_10
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 8568
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8569
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8570
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8571
    isa $I2, $P4, [ 'FunctionBase' ]
    unless $I2 goto __label_11
# {
.annotate 'line', 8572
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_12
    unless $P6 goto __label_12
# {
.annotate 'line', 8573
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
  __label_13:
.annotate 'line', 8574
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8575
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8576
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8577
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_14
    set $S4, $P6
  __label_14:
.annotate 'line', 8578
    self.'setusedlex'($S3, $S4)
# }
  __label_12: # endif
# }
  __label_11: # endif
# }
  __label_9: # endif
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 8583
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_16
    isa $I3, $P1, [ 'VarData' ]
    not $I2, $I3
  __label_16:
    unless $I2 goto __label_15
.const 'Sub' $P9 = 'WSubId_6'
.annotate 'line', 8584
    $P9('Incorrect data for variable in LocalFunction')
  __label_15: # endif
.annotate 'line', 8585
    .return($P1)
# }
.annotate 'line', 8586

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8515
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
.annotate 'line', 8597
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8598

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8599
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8593
    get_class $P1, [ 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8613
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8614
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.const 'Sub' $P5 = 'WSubId_3'
.annotate 'line', 8615
    $P5($P1)
  __label_1: # endif
.annotate 'line', 8616
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8617
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8618
# type: $S1
.const 'Sub' $P7 = 'WSubId_82'
    $P8 = $P1.'checkkeyword'()
    $P6 = $P7($P8)
    null $S1
    if_null $P6, __label_3
    set $S1, $P6
  __label_3:
.annotate 'line', 8619
    set $P1, $P2
.annotate 'line', 8620
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8621
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 8623
    setattribute self, 'name', $P1
.annotate 'line', 8624
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8625
    $P6 = $P3.'getreg'()
    setattribute self, 'reg', $P6
.annotate 'line', 8626
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8627
    new $P9, [ 'ParameterModifierList' ]
    $P9.'ParameterModifierList'(__ARG_1, self)
    set $P8, $P9
    setattribute self, 'modifiers', $P8
    goto __label_5
  __label_4: # else
.annotate 'line', 8629
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 8630

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8633
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8634
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8635
    if_null $P1, __label_1
# {
.annotate 'line', 8636
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8637
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 8639

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameter' ]
.annotate 'line', 8608
    addattribute $P0, 'name'
.annotate 'line', 8609
    addattribute $P0, 'modifiers'
.annotate 'line', 8610
    addattribute $P0, 'reg'
.end
.namespace [ ]

.sub 'parseSigParameter'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8644
    new $P2, [ 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8645

.end # parseSigParameter

.namespace [ 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8652
.const 'Sub' $P1 = 'parseSigParameter'
.annotate 'line', 8653
.const 'Sub' $P4 = 'WSubId_27'
    $P3 = $P4(__ARG_1, __ARG_2, $P1, ')')
    setattribute self, 'params', $P3
# }
.annotate 'line', 8654

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8657
    __ARG_1.'print'('(')
.annotate 'line', 8658
# sep: $S1
    set $S1, ''
.annotate 'line', 8659
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8660
    __ARG_1.'print'($S1)
.annotate 'line', 8661
    $P1.'emit'(__ARG_1)
.annotate 'line', 8662
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8664
    __ARG_1.'print'(')')
# }
.annotate 'line', 8665

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameterList' ]
.annotate 'line', 8649
    addattribute $P0, 'params'
.end
.namespace [ 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8674
    setattribute self, 'params', __ARG_1
.annotate 'line', 8675
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 8676

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8679
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8680
    .return(self)
# }
.annotate 'line', 8681

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8684
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8685
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8686
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 8687
    __ARG_1.'print'('    ')
.annotate 'line', 8688
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8689
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8690
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 8691
    __ARG_1.'say'()
# }
.annotate 'line', 8692

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiAssignStatement' ]
.annotate 'line', 8670
    addattribute $P0, 'params'
.annotate 'line', 8671
    addattribute $P0, 'expr'
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
.annotate 'line', 8709
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8710

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8711
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8715
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8716

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8705
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8724
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8725
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8726

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8727
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8731
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8732
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8733

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8719
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8721
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8742
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8743
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8744
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8745
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.const 'Sub' $P4 = 'WSubId_29'
.annotate 'line', 8746
    $P4('literal string', $P2)
  __label_1: # endif
.annotate 'line', 8747
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8748
    $P2 = __ARG_1.'get'()
.annotate 'line', 8749
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 8750
    $P5 = $P2.'checkop'()
    set $S1, $P5
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 8752
    box $P6, 1
    setattribute self, 'hll', $P6
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 8754
.const 'Sub' $P7 = 'WSubId_31'
.annotate 'line', 8756
    $P7('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 8758
# {
.annotate 'line', 8759
    $P2 = __ARG_1.'get'()
.annotate 'line', 8760
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.const 'Sub' $P8 = 'WSubId_29'
.annotate 'line', 8761
    $P8('literal string', $P2)
  __label_10: # endif
.annotate 'line', 8762
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 8763
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.const 'Sub' $P9 = 'WSubId_4'
.annotate 'line', 8764
    $P9(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 8766
    setattribute self, 'key', $P1
# }
.annotate 'line', 8767

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8768
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8771
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8772

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8776
.const 'Sub' $P2 = 'WSubId_47'
    getattribute $P3, self, 'key'
    $P1 = $P2($P3)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8777

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8736
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8738
    addattribute $P0, 'key'
.annotate 'line', 8739
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8785
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8786
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8787
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 8788
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8789
    $P2 = __ARG_1.'get'()
.annotate 'line', 8790
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8792
    __ARG_1.'unget'($P2)
.annotate 'line', 8793
    setattribute self, 'key', $P1
# }
.annotate 'line', 8794

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8795
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8799
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8800
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8801

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8805
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8806
    unless_null $P1, __label_1
# {
.annotate 'line', 8807
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.const 'Sub' $P3 = 'WSubId_54'
.annotate 'line', 8808
    getattribute $P4, self, 'key'
# predefined join
    join $S1, ".", $P4
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    $P3($S2)
  __label_3: # endif
.annotate 'line', 8809
.const 'Sub' $P5 = 'WSubId_47'
    getattribute $P4, self, 'key'
    $P2 = $P5($P4)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8811
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 8812

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8780
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8782
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8817
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8818
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8819
    new $P4, [ 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8820
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8821
    new $P4, [ 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8822
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8823
    new $P4, [ 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 8824
    $P5('Invalid class', $P1)
# }
.annotate 'line', 8825

.end # parseClassSpecifier

.namespace [ 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8837
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8838
    setattribute self, 'name', __ARG_2
.annotate 'line', 8839
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8840
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 8841
    setattribute self, 'classns', $P1
# }
.annotate 'line', 8842

.end # ClassBase


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 8845
.const 'Sub' $P1 = 'WSubId_47'
    getattribute $P2, self, 'classns'
    .tailcall $P1($P2)
# }
.annotate 'line', 8846

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassBase' ]
.annotate 'line', 8831
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8833
    addattribute $P0, 'name'
.annotate 'line', 8834
    addattribute $P0, 'classns'
.end
.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8859
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8860
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8861
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8862
    setattribute self, 'functions', $P1
.annotate 'line', 8863
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8864
    setattribute self, 'members', $P2
.annotate 'line', 8865
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8866
    setattribute self, 'constants', $P3
.annotate 'line', 8868
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8869
    $P9 = $P4.'isop'(':')
    if_null $P9, __label_1
    unless $P9 goto __label_1
# {
.const 'Sub' $P8 = "WSubId_48"
.annotate 'line', 8871
.const 'Sub' $P11 = 'WSubId_27'
    $P10 = $P11(__ARG_4, self, $P8)
    setattribute self, 'bases', $P10
.annotate 'line', 8872
    $P4 = __ARG_4.'get'()
# }
  __label_1: # endif
.const 'Sub' $P12 = 'WSubId_4'
.annotate 'line', 8874
    $P12('{', $P4)
# for loop
.annotate 'line', 8875
    $P4 = __ARG_4.'get'()
  __label_4: # for condition
    $P9 = $P4.'isop'('}')
    isfalse $I1, $P9
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 8876
    $P10 = $P4.'checkkeyword'()
    set $S1, $P10
    set $S2, 'function'
    if $S1 == $S2 goto __label_7
    set $S2, 'var'
    if $S1 == $S2 goto __label_8
    set $S2, 'const'
    if $S1 == $S2 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 8878
# var f: $P5
    new $P5, [ 'MethodStatement' ]
    $P5.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 8879
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 8882
# var name: $P6
    $P6 = __ARG_4.'get'()
.annotate 'line', 8883
    $P13 = $P6.'isidentifier'()
    isfalse $I2, $P13
    unless $I2 goto __label_10
.const 'Sub' $P14 = 'WSubId_29'
.annotate 'line', 8884
    $P14("member identifier", $P6)
  __label_10: # endif
.annotate 'line', 8885
# predefined push
    push $P2, $P6
.annotate 'line', 8886
    $P4 = __ARG_4.'get'()
.annotate 'line', 8887
    $P15 = $P4.'isop'(';')
    isfalse $I3, $P15
    unless $I3 goto __label_11
.const 'Sub' $P16 = 'WSubId_29'
.annotate 'line', 8888
    $P16("';' in member declaration", $P4)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 8891
# var cst: $P7
.const 'Sub' $P17 = 'WSubId_34'
    $P7 = $P17($P4, __ARG_4, self)
.annotate 'line', 8892
# predefined push
    push $P3, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 8893
.const 'Sub' $P18 = 'WSubId_31'
.annotate 'line', 8895
    $P18("item in class", $P4)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 8875
    $P4 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 8898

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8901
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8902

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8905
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8906

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8909
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8910

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8913
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8914

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8917
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8918

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8921
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8922

.end # use_predef


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 8925
    getattribute $P2, self, 'constants'
    $P1($P2)
.const 'Sub' $P3 = 'WSubId_28'
.annotate 'line', 8926
    getattribute $P2, self, 'functions'
    $P3($P2)
.annotate 'line', 8927
    .return(self)
# }
.annotate 'line', 8928

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8931
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8932
.const 'Sub' $P6 = 'WSubId_86'
    $P5 = $P6($P1)
    __ARG_1.'say'($P5)
.const 'Sub' $P7 = 'WSubId_42'
.annotate 'line', 8933
    getattribute $P5, self, 'functions'
    $P7(__ARG_1, $P5)
.annotate 'line', 8935
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8937
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8938
# n: $I1
    set $I1, 1
.annotate 'line', 8939
# var bases: $P2
    getattribute $P2, self, 'bases'
.annotate 'line', 8940
    if_null $P2, __label_1
# {
.annotate 'line', 8941
    getattribute $P5, self, 'bases'
    iter $P8, $P5
    set $P8, 0
  __label_2: # for iteration
    unless $P8 goto __label_3
    shift $P3, $P8
# {
.annotate 'line', 8942
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8943
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8944
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8945
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8946
    __ARG_1.'say'()
.annotate 'line', 8947
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8950
    getattribute $P5, self, 'members'
    iter $P9, $P5
    set $P9, 0
  __label_4: # for iteration
    unless $P9 goto __label_5
    shift $P4, $P9
# {
.annotate 'line', 8951
    __ARG_1.'annotate'($P4)
.annotate 'line', 8952
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8955
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8956

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8849
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8851
    addattribute $P0, 'parent'
.annotate 'line', 8852
    addattribute $P0, 'bases'
.annotate 'line', 8853
    addattribute $P0, 'constants'
.annotate 'line', 8854
    addattribute $P0, 'functions'
.annotate 'line', 8855
    addattribute $P0, 'members'
.end
.namespace [ 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8963
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8964

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8967
    .return(self)
# }
.annotate 'line', 8968

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareClassStatement' ]
.annotate 'line', 8959
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'parseClass' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8976
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8977
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8978
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('.')
  __label_3:
    unless $I1 goto __label_1
# {
# for loop
  __label_6: # for condition
.annotate 'line', 8979
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 8980
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 8981
    $P1 = __ARG_2.'get'()
# }
  __label_4: # for iteration
.annotate 'line', 8979
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # for end
.const 'Sub' $P4 = 'WSubId_4'
.annotate 'line', 8983
    $P4(';', $P2)
.annotate 'line', 8984
    new $P5, [ 'DeclareClassStatement' ]
    $P5.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P5
    __ARG_3.'declareclass'($P3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8987
    __ARG_2.'unget'($P2)
.annotate 'line', 8988
    new $P5, [ 'ClassStatement' ]
    $P5.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P5
    __ARG_3.'addclass'($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8990

.end # parseClass


.sub 'include_parrot' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8998
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8999
    $P7 = $P1.'isstring'()
    isfalse $I4, $P7
    unless $I4 goto __label_1
.const 'Sub' $P8 = 'WSubId_29'
.annotate 'line', 9000
    $P8('literal string', $P1)
  __label_1: # endif
.const 'Sub' $P9 = 'WSubId_43'
.annotate 'line', 9001
    $P9(';', __ARG_2)
.annotate 'line', 9002
# filename: $S1
    $P7 = $P1.'rawstring'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 9003
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9008
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 9009
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 9010
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 9011
    iter $P10, $P4
    set $P10, 0
  __label_3: # for iteration
    unless $P10 goto __label_4
    shift $S2, $P10
# {
.annotate 'line', 9012
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 9013
# try: create handler
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_5
    push_eh $P7
# try: begin
# {
.annotate 'line', 9014
    $P5.'open'($S3, 'r')
    goto __label_4 # break
.annotate 'line', 9015
# }
# try: end
    pop_eh
    goto __label_6
.annotate 'line', 9013
# catch
  __label_5:
    .get_results($P11)
    finalize $P11
    pop_eh
# catch end
  __label_6:
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9020
    $P7 = $P5.'is_closed'()
    if_null $P7, __label_7
    unless $P7 goto __label_7
.const 'Sub' $P12 = 'WSubId_1'
.annotate 'line', 9021
    $P12('File not found', $P1)
  __label_7: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9026
# line: $S4
    $P7 = $P5.'readline'()
    null $S4
    if_null $P7, __label_11
    set $S4, $P7
  __label_11:
  __label_10: # for condition
    $P11 = $P5.'eof'()
    isfalse $I4, $P11
    unless $I4 goto __label_9
# {
.annotate 'line', 9027
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_12
# {
.annotate 'line', 9028
# pos: $I1
    set $I1, 12
.annotate 'line', 9029
# c: $S5
    null $S5
  __label_14: # while
.annotate 'line', 9030
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_15
    iseq $I4, $S5, "\t"
  __label_15:
    unless $I4 goto __label_13
.annotate 'line', 9031
    inc $I1
    goto __label_14
  __label_13: # endwhile
.annotate 'line', 9032
# pos2: $I2
    set $I2, $I1
  __label_17: # while
.annotate 'line', 9033
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_21
    isne $I4, $S5, "\t"
  __label_21:
    unless $I4 goto __label_20
.annotate 'line', 9034
    isne $I4, $S5, "\n"
  __label_20:
    unless $I4 goto __label_19
    isne $I4, $S5, "\r"
  __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, ""
  __label_18:
    unless $I4 goto __label_16
.annotate 'line', 9035
    inc $I2
    goto __label_17
  __label_16: # endwhile
.annotate 'line', 9036
    ne $I2, $I1, __label_22
    goto __label_8 # continue
  __label_22: # endif
.annotate 'line', 9038
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
  __label_24: # while
.annotate 'line', 9039
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_25
    iseq $I4, $S5, "\t"
  __label_25:
    unless $I4 goto __label_23
.annotate 'line', 9040
    inc $I2
    goto __label_24
  __label_23: # endwhile
.annotate 'line', 9041
    set $I1, $I2
  __label_27: # while
.annotate 'line', 9042
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_31
    isne $I4, $S5, "\t"
  __label_31:
    unless $I4 goto __label_30
.annotate 'line', 9043
    isne $I4, $S5, "\n"
  __label_30:
    unless $I4 goto __label_29
    isne $I4, $S5, "\r"
  __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, ""
  __label_28:
    unless $I4 goto __label_26
.annotate 'line', 9044
    inc $I2
    goto __label_27
  __label_26: # endwhile
.annotate 'line', 9045
    ne $I2, $I1, __label_32
    goto __label_8 # continue
  __label_32: # endif
.annotate 'line', 9047
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 9049
# ivalue: $I3
    null $I3
.annotate 'line', 9050
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_35
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
  __label_35:
    unless $I4 goto __label_33
.annotate 'line', 9051
# predefined substr
    substr $S10, $S7, 2
    box $P11, $S10
    $P7 = $P11.'to_int'(16)
    set $I3, $P7
    goto __label_34
  __label_33: # else
.annotate 'line', 9053
    set $I3, $S7
  __label_34: # endif
.annotate 'line', 9054
# var cst: $P6
    $P6 = __ARG_3.'createconst'($S6, 'I', 4)
.annotate 'line', 9055
.const 'Sub' $P13 = 'WSubId_16'
.annotate 'line', 9056
    new $P14, [ 'TokenInteger' ]
    getattribute $P15, __ARG_1, 'file'
    getattribute $P16, __ARG_1, 'line'
    $P14.'TokenInteger'($P15, $P16, $S6)
    set $P11, $P14
.annotate 'line', 9055
    $P7 = $P13(__ARG_3, $P11, $I3)
    $P6.'setvalue'($P7)
# }
  __label_12: # endif
# }
  __label_8: # for iteration
.annotate 'line', 9026
    $P7 = $P5.'readline'()
    set $S4, $P7
    goto __label_10
  __label_9: # for end
.annotate 'line', 9060
    $P5.'close'()
# }
.annotate 'line', 9061

.end # include_parrot


.sub 'parsensUsing' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9067
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9068
    $P8 = $P1.'iskeyword'('namespace')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 9069
# var nskey: $P2
.const 'Sub' $P9 = 'WSubId_44'
    $P2 = $P9(__ARG_2)
.annotate 'line', 9070
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9071
    ge $I1, 1, __label_2
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 9072
    $P10('Unsupported', $P1)
  __label_2: # endif
.const 'Sub' $P11 = 'WSubId_43'
.annotate 'line', 9073
    $P11(';', __ARG_2)
.annotate 'line', 9074
# var nssym: $P3
    $P3 = __ARG_3.'findns'($P2)
.annotate 'line', 9075
    unless_null $P3, __label_3
.const 'Sub' $P12 = 'WSubId_1'
.annotate 'line', 9076
    $P12('unknown namespace', $P1)
  __label_3: # endif
.annotate 'line', 9077
    __ARG_3.'usenamespace'($P3)
.annotate 'line', 9078
    .return()
# }
  __label_1: # endif
.annotate 'line', 9080
    $P8 = $P1.'iskeyword'('extern')
    isfalse $I3, $P8
    unless $I3 goto __label_4
# {
.annotate 'line', 9081
    __ARG_2.'unget'($P1)
.annotate 'line', 9082
# var key: $P4
.const 'Sub' $P13 = 'WSubId_44'
    $P4 = $P13(__ARG_2)
.annotate 'line', 9083
# nelems: $I2
# predefined elements
    elements $I2, $P4
.annotate 'line', 9084
    ge $I2, 1, __label_5
.const 'Sub' $P14 = 'WSubId_1'
.annotate 'line', 9085
    $P14('Unsupported at namespace level', $P1)
  __label_5: # endif
.const 'Sub' $P15 = 'WSubId_43'
.annotate 'line', 9086
    $P15(';', __ARG_2)
.annotate 'line', 9087
    __ARG_3.'use'($P4)
.annotate 'line', 9088
    .return()
# }
  __label_4: # endif
.annotate 'line', 9090
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9092
    $I3 = $P1.'isstring'()
    if $I3 goto __label_8
.annotate 'line', 9098
    $I3 = $P1.'isidentifier'()
    if $I3 goto __label_9
    goto __label_7
  __label_8: # case
.annotate 'line', 9094
# reqlib: $S1
    set $P8, $P1
    null $S1
    if_null $P8, __label_10
    set $S1, $P8
  __label_10:
.annotate 'line', 9095
    __ARG_3.'addlib'($S1)
.const 'Sub' $P16 = 'WSubId_43'
.annotate 'line', 9096
    $P16(';', __ARG_2)
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 9099
    __ARG_2.'unget'($P1)
.annotate 'line', 9100
# var module: $P5
.const 'Sub' $P17 = 'WSubId_44'
    $P5 = $P17(__ARG_2)
.annotate 'line', 9101
    $P1 = __ARG_2.'get'()
.annotate 'line', 9102
    $P18 = $P1.'isop'(';')
    isfalse $I4, $P18
    unless $I4 goto __label_11
# {
.annotate 'line', 9103
    __ARG_2.'unget'($P1)
.const 'Sub' $P7 = "WSubId_46"
.annotate 'line', 9105
# var names: $P6
.const 'Sub' $P19 = 'WSubId_27'
    null $P8
    $P6 = $P19(__ARG_2, $P8, $P7, ';')
.annotate 'line', 9106
    __ARG_3.'addextern'($P5, $P6)
# }
  __label_11: # endif
.annotate 'line', 9108
# reqmodule: $S2
# predefined join
    join $S3, '/', $P5
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9109
    __ARG_3.'addload'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 9110
.const 'Sub' $P20 = 'WSubId_29'
.annotate 'line', 9112
    $P20('string literal or identifier', $P1)
  __label_6: # switch end
# }
.annotate 'line', 9114

.end # parsensUsing

.namespace [ 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9124
    setattribute self, 'module', __ARG_1
.annotate 'line', 9125
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9126

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9131
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9139
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9140
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9141
    __ARG_1.'say'("']")
.annotate 'line', 9142
    getattribute $P1, self, 'names'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9143
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9144
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9150

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'External' ]
.annotate 'line', 9120
    addattribute $P0, 'module'
.annotate 'line', 9121
    addattribute $P0, 'names'
.end
.namespace [ 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9169
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9170
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9171
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9172
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9173
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9174
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9177
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9178
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9179
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9180
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9181
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
# }
  __label_2: # endif
.annotate 'line', 9183
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9184

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9187
# var ns: $P1
    null $P1
.annotate 'line', 9188
    getattribute $P3, self, 'namespaces'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9189
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9190
    getattribute $P3, self, 'usednamespaces'
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9191
    getattribute $P6, $P1, 'usednamespaces'
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9192
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9193

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9196
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9197

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9200
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9201
    .return()
  __label_1: # endif
.annotate 'line', 9202
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9203
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9204
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9205
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9206
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9207

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9210
# var sym: $P1
    $P1 = self.'findsymbol'(__ARG_1)
.annotate 'line', 9211
    if_null $P1, __label_1
# {
.annotate 'line', 9212
    isa $I1, $P1, [ 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9213
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9216
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9217
# var ns: $P2
    $P2 = self.'findns'(__ARG_1)
.annotate 'line', 9218
    if_null $P2, __label_5
# {
.annotate 'line', 9219
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9220
    if_null $P1, __label_6
.annotate 'line', 9221
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9224

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9227
    getattribute $P2, self, 'usednamespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9228
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9229
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9230
    .return($P2)
# }
.annotate 'line', 9231

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9234
    getattribute $P2, self, 'namespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9235
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9236
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9237
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9238

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9242
# var ext: $P1
    new $P1, [ 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9243
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9244
    unless_null $P2, __label_1
.annotate 'line', 9245
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9247
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9248

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9252
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9253
    iter $P3, $P1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 9254
    getattribute $P4, $P2, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9255
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P4
.annotate 'line', 9256
    .return($P4)
# }
.annotate 'line', 9257

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9262
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9263
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9265
    .return($P3)
  __label_4: # case
.annotate 'line', 9268
    sub $I4, $I1, 1
    $P4 = __ARG_1[$I4]
    .tailcall self.'checkclass_base'($P4)
  __label_2: # default
.annotate 'line', 9273
# basename: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9274
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9275
    if_null $P1, __label_5
# {
.annotate 'line', 9276
# var found: $P2
    add $I5, __ARG_2, 1
    $P2 = $P1.'findclasskey'(__ARG_1, $I5)
.annotate 'line', 9277
    if_null $P2, __label_6
.annotate 'line', 9278
    .return($P2)
  __label_6: # endif
# }
  __label_5: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9281
    .return($P3)
# }
.annotate 'line', 9282

.end # findclasskey_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9285
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9286
    if_null $P1, __label_1
.annotate 'line', 9287
    .return($P1)
  __label_1: # endif
.annotate 'line', 9288
    getattribute $P2, self, 'functions'
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9289
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9290
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9291
    .return($P2)
# }
.annotate 'line', 9292

.end # findsymbolbyname


.sub 'findlocalsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9297
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9298
# name: $S1
    null $S1
.annotate 'line', 9299
# var sym: $P1
    null $P1
.annotate 'line', 9300
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9301
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9303
    .return($P3)
  __label_4: # case
.annotate 'line', 9305
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 9307
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_5
.annotate 'line', 9308
    .return($P1)
  __label_5: # endif
.annotate 'line', 9309
    getattribute $P4, self, 'usednamespaces'
    iter $P5, $P4
    set $P5, 0
  __label_6: # for iteration
    unless $P5 goto __label_7
    shift $P2, $P5
.annotate 'line', 9310
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_8
.annotate 'line', 9311
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9317
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9318
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9319
    isnull $I5, $P2
    not $I5
    unless $I5 goto __label_10
.annotate 'line', 9320
    add $I6, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I6)
    isnull $I5, $P1
    not $I5
  __label_10:
    unless $I5 goto __label_9
.annotate 'line', 9321
    .return($P1)
  __label_9: # endif
.annotate 'line', 9322
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9323
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_12
.annotate 'line', 9324
    add $I8, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I8)
    isnull $I7, $P1
    not $I7
  __label_12:
    unless $I7 goto __label_11
.annotate 'line', 9325
    .return($P1)
  __label_11: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9327
    .return($P3)
# }
.annotate 'line', 9328

.end # findlocalsymbol


.sub 'findlocalns' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9331
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9332
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
    null $P2
.annotate 'line', 9334
    .return($P2)
  __label_2: # default
.annotate 'line', 9336
# name: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9337
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9338
    if_null $P1, __label_4
# {
.annotate 'line', 9339
    sub $I4, $I1, __ARG_2
    ne $I4, 1, __label_5
.annotate 'line', 9340
    .return($P1)
    goto __label_6
  __label_5: # else
.annotate 'line', 9342
    add $I5, __ARG_2, 1
    .tailcall $P1.'findlocalns'(__ARG_1, $I5)
  __label_6: # endif
# }
  __label_4: # endif
  __label_1: # switch end
    null $P2
.annotate 'line', 9345
    .return($P2)
# }
.annotate 'line', 9346

.end # findlocalns


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9349
# var child: $P1
    new $P1, [ 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9350
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9351
    .return($P1)
# }
.annotate 'line', 9352

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9355
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9356
# var child: $P2
    new $P2, [ 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9357
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9358
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9359
    .return($P2)
# }
.annotate 'line', 9360

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9363
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9364

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9367
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9368
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9369

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9372
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9373
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9374
    $P1 = __ARG_2.'get'()
.annotate 'line', 9376
# var modifier: $P2
    null $P2
.annotate 'line', 9377
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9378
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9379
    $P1 = __ARG_2.'get'()
# }
  __label_2: # endif
.const 'Sub' $P6 = 'WSubId_4'
.annotate 'line', 9382
    $P6('{', $P1)
.annotate 'line', 9383
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9384
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9385

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9388
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9389
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9390
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9391
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9392
    $P4 = __ARG_1.'get'()
  __label_3: # for condition
    set $I1, $P4
    unless $I1 goto __label_4
    $P7 = $P4.'isop'('}')
    isfalse $I1, $P7
  __label_4:
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9394
    $P8 = $P4.'checkkeyword'()
    set $S1, $P8
    set $S2, 'namespace'
    if $S1 == $S2 goto __label_7
    set $S2, 'const'
    if $S1 == $S2 goto __label_8
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'class'
    if $S1 == $S2 goto __label_10
    set $S2, 'using'
    if $S1 == $S2 goto __label_11
    set $S2, '$include_const'
    if $S1 == $S2 goto __label_12
    set $S2, '$load'
    if $S1 == $S2 goto __label_13
    set $S2, '$loadlib'
    if $S1 == $S2 goto __label_14
    goto __label_6
  __label_7: # case
.annotate 'line', 9396
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9399
# var cst: $P5
.const 'Sub' $P9 = 'WSubId_34'
    $P5 = $P9($P4, __ARG_1, self)
.annotate 'line', 9400
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9403
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9404
# predefined push
    push $P2, $P6
.annotate 'line', 9405
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9406
.const 'Sub' $P10 = 'WSubId_87'
.annotate 'line', 9408
    $P10($P4, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9409
.const 'Sub' $P11 = 'WSubId_88'
.annotate 'line', 9411
    $P11($P4, __ARG_1, self)
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9412
.const 'Sub' $P12 = 'WSubId_89'
.annotate 'line', 9414
    $P12($P4, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9417
    $P4 = __ARG_1.'get'()
.annotate 'line', 9418
    $P13 = $P4.'isstring'()
    isfalse $I2, $P13
    unless $I2 goto __label_15
.const 'Sub' $P14 = 'WSubId_29'
.annotate 'line', 9419
    $P14('string literal', $P4)
  __label_15: # endif
.const 'Sub' $P15 = 'WSubId_43'
.annotate 'line', 9420
    $P15(';', __ARG_1)
.annotate 'line', 9421
    new $P18, [ 'StringLiteral' ]
    $P18.'StringLiteral'(self, $P4)
    set $P17, $P18
    $P16 = $P17.'getPirString'()
    self.'addload'($P16)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 9424
    $P4 = __ARG_1.'get'()
.annotate 'line', 9425
    $P19 = $P4.'isstring'()
    isfalse $I3, $P19
    unless $I3 goto __label_16
.const 'Sub' $P20 = 'WSubId_29'
.annotate 'line', 9426
    $P20('string literal', $P4)
  __label_16: # endif
.const 'Sub' $P21 = 'WSubId_43'
.annotate 'line', 9427
    $P21(';', __ARG_1)
.annotate 'line', 9428
    new $P24, [ 'StringLiteral' ]
    $P24.'StringLiteral'(self, $P4)
    set $P23, $P24
    $P22 = $P23.'getPirString'()
    self.'addlib'($P22)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9429
.const 'Sub' $P25 = 'WSubId_31'
.annotate 'line', 9431
    $P25("token", $P4)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9392
    $P4 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9434
    if_null $P4, __label_17
    unless $P4 goto __label_17
.annotate 'line', 9435
    self.'close_ns'($P4)
    goto __label_18
  __label_17: # else
.annotate 'line', 9437
    self.'unclosed_ns'()
  __label_18: # endif
# }
.annotate 'line', 9438

.end # parse


.sub 'optimize_base' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 9441
    getattribute $P2, self, 'items'
    $P1($P2)
# }
.annotate 'line', 9442

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9445
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9446
# s: $S1
.const 'Sub' $P5 = 'WSubId_86'
    $P4 = $P5($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9448
# activate: $I1
    set $I1, 1
.annotate 'line', 9450
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9451
    if_null $P2, __label_2
# {
.annotate 'line', 9452
    __ARG_1.'say'($S1)
.annotate 'line', 9453
    null $I1
.const 'Sub' $P6 = 'WSubId_42'
.annotate 'line', 9454
    $P6(__ARG_1, $P2)
# }
  __label_2: # endif
.annotate 'line', 9457
    getattribute $P4, self, 'items'
    iter $P7, $P4
    set $P7, 0
  __label_3: # for iteration
    unless $P7 goto __label_4
    shift $P3, $P7
# {
.annotate 'line', 9458
    isa $I2, $P3, [ 'NamespaceStatement' ]
    if $I2 goto __label_7
.annotate 'line', 9459
    isa $I2, $P3, [ 'ClassStatement' ]
  __label_7:
    unless $I2 goto __label_5
.annotate 'line', 9460
    set $I1, 1
    goto __label_6
  __label_5: # else
.annotate 'line', 9462
    unless $I1 goto __label_8
# {
.annotate 'line', 9463
    __ARG_1.'say'($S1)
.annotate 'line', 9464
    null $I1
# }
  __label_8: # endif
  __label_6: # endif
.annotate 'line', 9466
    $P3.'emit'(__ARG_1)
# }
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9468

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 9157
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9159
    addattribute $P0, 'nspath'
.annotate 'line', 9160
    addattribute $P0, 'externals'
.annotate 'line', 9161
    addattribute $P0, 'namespaces'
.annotate 'line', 9162
    addattribute $P0, 'classes'
.annotate 'line', 9163
    addattribute $P0, 'functions'
.annotate 'line', 9164
    addattribute $P0, 'items'
.annotate 'line', 9165
    addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 9486
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9487
# predefined push
    push $P1, __ARG_4
.annotate 'line', 9488
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 9490
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9491
    setattribute self, 'start', __ARG_2
.annotate 'line', 9492
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9493
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 9494
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 9495
    if_null __ARG_5, __label_1
# {
.annotate 'line', 9496
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 9497
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 9499

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9502
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9503

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9506
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9507

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9510
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9511

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9514
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9515

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9518
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9519

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9522
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9523
    unless_null $P1, __label_1
.annotate 'line', 9524
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9525
    .return($P1)
# }
.annotate 'line', 9526

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9531
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1, __ARG_2)
.annotate 'line', 9532
    isnull $I1, $P1
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9533
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findclasskey'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9534
    .return($P1)
# }
.annotate 'line', 9535

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9538
# var sym: $P1
    $P1 = self.'findlocalsymbol'(__ARG_1, __ARG_2)
.annotate 'line', 9539
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9540
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findsymbol'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9541
    .return($P1)
# }
.annotate 'line', 9542

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9545
# var ns: $P1
    $P1 = self.'findlocalns'(__ARG_1, __ARG_2)
.annotate 'line', 9546
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9547
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findns'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9548
    .return($P1)
# }
.annotate 'line', 9549

.end # findns


.sub 'unclosed_ns' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 9552
    getattribute $P2, self, 'start'
    $P1('unclosed namespace', $P2)
# }
.annotate 'line', 9553

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9560
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9561
    if_null $P1, __label_1
.annotate 'line', 9562
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 9563
    self.'optimize_base'()
.annotate 'line', 9564
    .return(self)
# }
.annotate 'line', 9565

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9568
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9569
    if_null $P1, __label_1
.annotate 'line', 9570
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 9572
    self.'emit_base'(__ARG_1)
.annotate 'line', 9574
    if_null $P1, __label_2
.annotate 'line', 9575
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 9576

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 9475
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9477
    addattribute $P0, 'parent'
.annotate 'line', 9478
    addattribute $P0, 'start'
.annotate 'line', 9479
    addattribute $P0, 'name'
.annotate 'line', 9480
    addattribute $P0, 'modifier'
.annotate 'line', 9481
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9593
    new $P1, ['ResizableStringArray']
.annotate 'line', 9594
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 9595
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9596
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9597
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9598

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9601
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9602
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9603

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9606
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9607
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9608

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9612
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9611
    set $S1, $I1
.annotate 'line', 9613
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 9614

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9618
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9619
    unless_null $P1, __label_1
.annotate 'line', 9620
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 9621
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9622

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9625
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9626
    unless_null $P1, __label_1
.annotate 'line', 9627
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 9628
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9629

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9632
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9633

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9637
    .tailcall self.'findclasskey_base'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9638

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9641
    .tailcall self.'findlocalsymbol'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9642

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9645
    .tailcall self.'findlocalns'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9646

.end # findns


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 9653
    $P1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9654

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9657
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9658

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9661
    self.'optimize_base'()
.annotate 'line', 9662
    .return(self)
# }
.annotate 'line', 9663

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9666
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9669
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 9670
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 9673
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
.annotate 'line', 9676
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 9677
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 9678
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 9679
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9682
# somelib: $I1
    null $I1
.annotate 'line', 9683
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9684
    if_null $P3, __label_5
# {
.annotate 'line', 9685
    set $I1, 1
.annotate 'line', 9686
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 9687
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 9690
# someload: $I2
    null $I2
.annotate 'line', 9691
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9692
    if_null $P4, __label_8
# {
.annotate 'line', 9693
    set $I2, 1
.annotate 'line', 9694
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9695
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 9696
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 9697
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 9699
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 9700
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 9702
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9703

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9706
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9707
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 9708
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9709
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 9710
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 9711
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 9713
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9714
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9716

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 9583
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9585
    addattribute $P0, 'unit'
.annotate 'line', 9586
    addattribute $P0, 'predefs_used'
.annotate 'line', 9587
    addattribute $P0, 'libs'
.annotate 'line', 9588
    addattribute $P0, 'loads'
.annotate 'line', 9589
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 9732
    box $P6, 1
    setattribute self, 'warnings', $P6
.annotate 'line', 9733
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9736
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9738
# var cfalse: $P3
    $P3 = $P1.'createconst'('false', 'I', 4)
.annotate 'line', 9739
.const 'Sub' $P7 = 'WSubId_16'
.annotate 'line', 9740
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9739
    $P6 = $P7($P1, $P8, 0)
    $P3.'setvalue'($P6)
.annotate 'line', 9741
# var ctrue: $P4
    $P4 = $P1.'createconst'('true', 'I', 4)
.annotate 'line', 9742
.const 'Sub' $P12 = 'WSubId_16'
.annotate 'line', 9743
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9742
    $P6 = $P12($P1, $P8, 1)
    $P4.'setvalue'($P6)
.annotate 'line', 9747
# var cstage: $P5
    $P5 = $P1.'createconst'('__STAGE__', 'S', 4)
.annotate 'line', 9748
    new $P8, [ 'StringLiteral' ]
.annotate 'line', 9749
    new $P10, [ 'TokenQuoted' ]
    getattribute $P11, $P2, 'file'
    getattribute $P13, $P2, 'line'
# predefined string
# predefined int
.annotate 'line', 9748
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
    $P10.'TokenQuoted'($P11, $P13, $S1)
    set $P9, $P10
    $P8.'StringLiteral'($P1, $P9)
    set $P6, $P8
    $P5.'setvalue'($P6)
.annotate 'line', 9751
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9752

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9755
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9756

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9759
    getattribute $P1, self, 'warnings'
.annotate 'line', 9758
    set $I1, $P1
.annotate 'line', 9759
    .return($I1)
# }
.annotate 'line', 9760

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9763
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 9764
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 9765

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9768
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9769

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9772
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9773
    __ARG_1.'say'('')
.annotate 'line', 9775
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9777
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9778

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9781
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9782
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9784
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9786
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9787

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 9727
    addattribute $P0, 'rootns'
.annotate 'line', 9728
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9796
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 9797
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 9798
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9799
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9800
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9801
    if_null __ARG_3, __label_2
    unless __ARG_3 goto __label_2
.annotate 'line', 9802
    $P2.'disable_annotations'()
  __label_2: # endif
.annotate 'line', 9803
    __ARG_1.'emit'($P2)
.annotate 'line', 9804
    $P2.'close'()
.annotate 'line', 9805
    $P1.'close'()
.annotate 'line', 9806
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9807
# var object: $P3
    null $P3
# switch
.annotate 'line', 9808
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_6
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_7
    set $S3, ''
    if $S2 == $S3 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 9810
    new $P3, [ 'String' ]
.annotate 'line', 9811
    assign $P3, $S1
    goto __label_4 # break
  __label_7: # case
  __label_8: # case
.annotate 'line', 9815
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9816
    $P3 = $P4($S1)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9817
# predefined string
.annotate 'line', 9819
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_4: # switch end
.annotate 'line', 9821
    .return($P3)
# }
.annotate 'line', 9822

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9825
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9826
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9827
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9828
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9829
    $P2.'close'()
.annotate 'line', 9830
    $P1.'close'()
.annotate 'line', 9831
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9832

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9838
    unless_null __ARG_2, __label_1
.annotate 'line', 9839
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9840
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9841
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9842
    $P1.'puts'(__ARG_1)
.annotate 'line', 9843
    $P1.'close'()
.annotate 'line', 9844
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9845
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9846
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9847
    unless __ARG_4 goto __label_2
.annotate 'line', 9848
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 9849
    $P3.'parse'($P2)
.annotate 'line', 9850
    $P1.'close'()
.annotate 'line', 9851
    $P3.'optimize'()
.annotate 'line', 9852
    ne __ARG_2, 'include', __label_3
.annotate 'line', 9853
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 9855
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_4: # endif
# }
.annotate 'line', 9856

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9862
    unless_null __ARG_2, __label_1
.annotate 'line', 9863
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9864
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9865
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9866
    $P1.'encoding'('utf8')
.annotate 'line', 9867
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9868
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9869
    unless __ARG_4 goto __label_2
.annotate 'line', 9870
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 9871
    $P3.'parse'($P2)
.annotate 'line', 9872
    $P1.'close'()
.annotate 'line', 9873
    $P3.'optimize'()
.annotate 'line', 9874
    ne __ARG_2, 'include', __label_3
.annotate 'line', 9875
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 9877
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_4: # endif
# }
.annotate 'line', 9878

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9887
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9888
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9889

.end # initializer

# End generated code
