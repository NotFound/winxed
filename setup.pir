# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code


.sub initial_load_bytecode :anon :load :init
    load_bytecode 'Getopt/Obj.pbc'
.end

# end libs
.namespace [ ]

.sub 'loadData' :subid('WSubId_1')
        .param string __ARG_1
# Body
# {
.annotate 'file', 'setup.winxed'
.annotate 'line', 28
# var json: $P1
# predefined load_language
    load_language 'data_json'
    compreg $P1, 'data_json'
.annotate 'line', 29
# var file: $P2
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'(__ARG_1)
.annotate 'line', 30
    isnull $I1, $P2
    if $I1 goto __label_2
    $I1 = $P2.'is_closed'()
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 31
    concat $S2, "Can't open ", __ARG_1
# predefined Error
    root_new $P4, ['parrot';'Exception']
    $P4['message'] = $S2
    throw $P4
  __label_1: # endif
.annotate 'line', 32
    $P2.'encoding'('utf8')
.annotate 'line', 33
# jsondata: $S1
    $P4 = $P2.'readall'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 34
    $P2.'close'()
.annotate 'line', 35
# var code: $P3
    $P3 = $P1.'compile'($S1)
.annotate 'line', 36
    .tailcall $P3()
# }
.annotate 'line', 37

.end # loadData


.sub 'main' :main
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 44
# var getopts: $P1
    new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 45
    $P1.'notOptStop'(1)
.annotate 'line', 46
    $P1.'push_string'('file=s')
.annotate 'line', 47
    $P1.'push_string'('v')
.annotate 'line', 48
# progname: $S1
    $P5 = __ARG_1.'shift'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 49
# var opts: $P2
    $P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 50
# verbose: $I1
    $P5 = $P2['v']
    isnull $I1, $P5
    not $I1
.annotate 'line', 51
# var file: $P3
    $P3 = $P2['file']
.annotate 'line', 55
# filename: $S2
    set $S2, 'setup.json'
.annotate 'line', 56
    if_null $P3, __label_2
.annotate 'line', 57
    set $S2, $P3
  __label_2: # endif
.annotate 'line', 58
# var data: $P4
.const 'Sub' $P6 = 'WSubId_1'
    $P4 = $P6($S2)
.annotate 'line', 60
    unless $I1 goto __label_3
# {
.annotate 'line', 61
# description: $S3
    $S3 = $P4['description']
.annotate 'line', 62
# predefined say
    print "\tFile: "
    say $S2
.annotate 'line', 63
    $P5 = $P4['name']
# predefined say
    print "\tName: "
    say $P5
.annotate 'line', 64
# predefined say
    print "\tDescription: "
    say $S3
.annotate 'line', 65
    $P5 = $P4['copyright_holder']
# predefined say
    print "\t(C) "
    say $P5
# predefined say
.annotate 'line', 66
    say ''
# }
  __label_3: # endif
.annotate 'line', 69
    load_bytecode 'distutils.pbc'
.annotate 'line', 70
    'setup'(__ARG_1 :flat, $P4 :flat :named)
# }
.annotate 'line', 71

.end # main

# End generated code
