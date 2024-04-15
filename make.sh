#!/bin/bash

clang++ -std=c++20 -o main launcher.cpp -Wl,-S -g0 -O3 -pedantic -pthread -W -W#pragma-messages -W#warnings -WCFString-literal -WCL4 -WIndependentClass-attribute -WNSObject-attribute -Wabi -Wabsolute-value -Wabstract-final-class -Wabstract-vbase-init -Waddress -Waddress-of-packed-member -Waddress-of-temporary -Waggregate-return -Waix-compat -Walign-mismatch -Wall -Walloca -Walloca-with-align-alignof -Walways-inline-coroutine -Wambiguous-delete -Wambiguous-ellipsis -Wambiguous-macro -Wambiguous-member-template -Wambiguous-reversed-operator -Wanalyzer-incompatible-plugin -Wanon-enum-enum-conversion -Wanonymous-pack-parens -Wapinotes -Warc -Warc-bridge-casts-disallowed-in-nonarc -Warc-maybe-repeated-use-of-weak -Warc-non-pod-memaccess -Warc-performSelector-leaks -Warc-repeated-use-of-weak -Warc-retain-cycles -Warc-unsafe-retained-assign -Wargument-outside-range -Wargument-undefined-behaviour -Warray-bounds -Warray-bounds-pointer-arithmetic -Warray-parameter -Wasm -Wasm-operand-widths -Wassign-enum -Wassume -Wat-protocol -Watimport-in-framework-header -Watomic-access -Watomic-alignment -Watomic-implicit-seq-cst -Watomic-memory-ordering -Watomic-properties -Watomic-property-with-user-defined-accessor -Wattribute-packed-for-bitfield -Wattribute-warning -Wattributes -Wauto-disable-vptr-sanitizer -Wauto-import -Wauto-storage-class -Wauto-var-id -Wavailability -Wavr-rtlib-linking-quirks -Wbackend-plugin -Wbackslash-newline-escape -Wbad-function-cast -Wbinary-literal -Wbind-to-temporary-copy -Wbinding-in-condition -Wbit-int-extension -Wbitfield-constant-conversion -Wbitfield-enum-conversion -Wbitfield-width -Wbitwise-conditional-parentheses -Wbitwise-instead-of-logical -Wbitwise-op-parentheses -Wblock-capture-autoreleasing -Wbool-conversion -Wbool-conversions -Wbool-operation -Wbraced-scalar-init -Wbranch-protection -Wbridge-cast -Wbuiltin-assume-aligned-alignment -Wbuiltin-macro-redefined -Wbuiltin-memcpy-chk-size -Wbuiltin-requires-header -Wc++-compat -Wc++0x-compat -Wc++0x-extensions -Wc++0x-narrowing -Wc++11-compat -Wc++11-compat-deprecated-writable-strings -Wc++11-compat-pedantic -Wc++11-compat-reserved-user-defined-literal -Wc++11-extensions -Wc++11-extra-semi -Wc++11-inline-namespace -Wc++11-long-long -Wc++11-narrowing -Wc++14-attribute-extensions -Wc++14-binary-literal -Wc++14-compat -Wc++14-compat-pedantic -Wc++14-extensions -Wc++17-attribute-extensions -Wc++17-compat -Wc++17-compat-mangling -Wc++17-compat-pedantic -Wc++17-extensions -Wc++1y-extensions -Wc++1z-compat -Wc++1z-compat-mangling -Wc++1z-extensions -Wc++20-attribute-extensions -Wc++20-compat -Wc++20-compat-pedantic -Wc++20-designator -Wc++20-extensions -Wc++2a-compat -Wc++2a-compat-pedantic -Wc++2a-extensions -Wc++2b-extensions -Wc++98-c++11-c++14-c++17-compat -Wc++98-c++11-c++14-c++17-compat-pedantic -Wc++98-c++11-c++14-compat -Wc++98-c++11-c++14-compat-pedantic -Wc++98-c++11-compat -Wc++98-c++11-compat-binary-literal -Wc++98-c++11-compat-pedantic -Wc11-extensions -Wc2x-compat -Wc2x-extensions -Wc99-compat -Wc99-designator -Wc99-extensions -Wcall-to-pure-virtual-from-ctor-dtor -Wcalled-once-parameter -Wcast-align -Wcast-calling-convention -Wcast-function-type -Wcast-of-sel-type -Wcast-qual -Wcast-qual-unrelated -Wchar-align -Wchar-subscripts -Wclang-cl-pch -Wclass-conversion -Wclass-varargs -Wcmse-union-leak -Wcomma -Wcomment -Wcomments -Wcompare-distinct-pointer-types -Wcompletion-handler -Wcomplex-component-init -Wcompound-token-split -Wcompound-token-split-by-macro -Wcompound-token-split-by-space -Wconditional-type-mismatch -Wconditional-uninitialized -Wconfig-macros -Wconstant-conversion -Wconstant-evaluated -Wconstant-logical-operand -Wconstexpr-not-const -Wconsumed -Wconversion -Wconversion-null -Wcoroutine -Wcoroutine-missing-unhandled-exception -Wcovered-switch-default -Wcpp -Wcstring-format-directive -Wctad-maybe-unsupported -Wctor-dtor-privacy -Wctu -Wcuda-compat -Wcustom-atomic-properties -Wcxx-attribute-extension -Wdangling -Wdangling-else -Wdangling-field -Wdangling-gsl -Wdangling-initializer-list -Wdarwin-sdk-settings -Wdate-time -Wdealloc-in-category -Wdebug-compression-unavailable -Wdeclaration-after-statement -Wdefaulted-function-deleted -Wdelegating-ctor-cycles -Wdelete-abstract-non-virtual-dtor -Wdelete-incomplete -Wdelete-non-abstract-non-virtual-dtor -Wdelete-non-virtual-dtor -Wdelimited-escape-sequence-extension -Wdeprecate-lax-vec-conv-all -Wdeprecated -Wdeprecated-altivec-src-compat -Wdeprecated-anon-enum-enum-conversion -Wdeprecated-array-compare -Wdeprecated-attributes -Wdeprecated-builtins -Wdeprecated-comma-subscript -Wdeprecated-copy -Wdeprecated-copy-dtor -Wdeprecated-copy-with-dtor -Wdeprecated-copy-with-user-provided-copy -Wdeprecated-copy-with-user-provided-dtor -Wdeprecated-coroutine -Wdeprecated-declarations -Wdeprecated-dynamic-exception-spec -Wdeprecated-enum-compare -Wdeprecated-enum-compare-conditional -Wdeprecated-enum-enum-conversion -Wdeprecated-enum-float-conversion -Wdeprecated-implementations -Wdeprecated-increment-bool -Wdeprecated-non-prototype -Wdeprecated-objc-isa-usage -Wdeprecated-objc-pointer-introspection -Wdeprecated-objc-pointer-introspection-performSelector -Wdeprecated-pragma -Wdeprecated-register -Wdeprecated-static-analyzer-flag -Wdeprecated-this-capture -Wdeprecated-type -Wdeprecated-volatile -Wdeprecated-writable-strings -Wdirect-ivar-access -Wdisabled-macro-expansion -Wdisabled-optimization -Wdiscard-qual -Wdistributed-object-modifiers -Wdiv-by-zero -Wdivision-by-zero -Wdll-attribute-on-redeclaration -Wdllexport-explicit-instantiation-decl -Wdllimport-static-field-def -Wdocumentation -Wdocumentation-deprecated-sync -Wdocumentation-html -Wdocumentation-pedantic -Wdocumentation-unknown-command -Wdollar-in-identifier-extension -Wdouble-promotion -Wdtor-name -Wdtor-typedef -Wduplicate-decl-specifier -Wduplicate-enum -Wduplicate-method-arg -Wduplicate-method-match -Wduplicate-protocol -Wdynamic-class-memaccess -Wdynamic-exception-spec -Weffc++ -Welaborated-enum-base -Welaborated-enum-class -Wembedded-directive -Wempty-body -Wempty-decomposition -Wempty-init-stmt -Wempty-translation-unit -Wencode-type -Wendif-labels -Wenum-compare -Wenum-compare-conditional -Wenum-compare-switch -Wenum-constexpr-conversion -Wenum-conversion -Wenum-enum-conversion -Wenum-float-conversion -Wenum-too-large -Wexceptions -Wexcess-initializers -Wexit-time-destructors -Wexpansion-to-defined -Wexplicit-initialize-call -Wexplicit-ownership-type -Wexport-unnamed -Wextern-c-compat -Wextern-initializer -Wextra -Wextra-qualification -Wextra-semi -Wextra-semi-stmt -Wextra-tokens -Wfinal-dtor-non-final-class -Wfinal-macro -Wfixed-enum-extension -Wfixed-point-overflow -Wflag-enum -Wflexible-array-extensions -Wfloat-conversion -Wfloat-equal -Wfloat-overflow-conversion -Wfloat-zero-conversion -Wfor-loop-analysis -Wformat -Wformat-extra-args -Wformat-insufficient-args -Wformat-invalid-specifier -Wformat-non-iso -Wformat-nonliteral -Wformat-pedantic -Wformat-security -Wformat-type-confusion -Wformat-y2k -Wformat-zero-length -Wformat=2 -Wfortify-source -Wfour-char-constants -Wframe-address -Wframework-include-private-from-public -Wfree-nonheap-object -Wfunction-def-in-objc-container -Wfunction-multiversion -Wfuse-ld-path -Wfuture-attribute-extensions -Wfuture-compat -Wgcc-compat -Wglobal-constructors -Wglobal-isel -Wgnu -Wgnu-alignof-expression -Wgnu-anonymous-struct -Wgnu-array-member-paren-init -Wgnu-auto-type -Wgnu-binary-literal -Wgnu-case-range -Wgnu-complex-integer -Wgnu-compound-literal-initializer -Wgnu-conditional-omitted-operand -Wgnu-designator -Wgnu-empty-initializer -Wgnu-empty-struct -Wgnu-flexible-array-initializer -Wgnu-flexible-array-union-member -Wgnu-folding-constant -Wgnu-imaginary-constant -Wgnu-include-next -Wgnu-inline-cpp-without-extern -Wgnu-label-as-value -Wgnu-line-marker -Wgnu-null-pointer-arithmetic -Wgnu-pointer-arith -Wgnu-redeclared-enum -Wgnu-statement-expression -Wgnu-statement-expression-from-macro-expansion -Wgnu-static-float-init -Wgnu-string-literal-operator-template -Wgnu-union-cast -Wgnu-variable-sized-type-not-at-end -Wgnu-zero-line-directive -Wgnu-zero-variadic-macro-arguments -Wgpu-maybe-wrong-side -Wheader-guard -Wheader-hygiene -Whip-only -Whlsl-extensions -Widiomatic-parentheses -Wignored-attributes -Wignored-availability-without-sdk-settings -Wignored-optimization-argument -Wignored-pragma-intrinsic -Wignored-pragma-optimize -Wignored-pragmas -Wignored-qualifiers -Wignored-reference-qualifiers -Wimplicit -Wimplicit-atomic-properties -Wimplicit-const-int-float-conversion -Wimplicit-conversion-floating-point-to-bool -Wimplicit-exception-spec-mismatch -Wimplicit-fallthrough -Wimplicit-fallthrough-per-function -Wimplicit-fixed-point-conversion -Wimplicit-float-conversion -Wimplicit-function-declaration -Wimplicit-int -Wimplicit-int-conversion -Wimplicit-int-float-conversion -Wimplicit-retain-self -Wimplicitly-unsigned-literal -Wimport -Wimport-preprocessor-directive-pedantic -Winaccessible-base -Winclude-next-absolute-path -Winclude-next-outside-header -Wincompatible-exception-spec -Wincompatible-function-pointer-types -Wincompatible-library-redeclaration -Wincompatible-ms-struct -Wincompatible-pointer-types -Wincompatible-pointer-types-discards-qualifiers -Wincompatible-property-type -Wincompatible-sysroot -Wincomplete-framework-module-declaration -Wincomplete-implementation -Wincomplete-module -Wincomplete-setjmp-declaration -Wincomplete-umbrella -Winconsistent-dllimport -Winconsistent-missing-destructor-override -Winconsistent-missing-override -Wincrement-bool -Winfinite-recursion -Winit-self -Winitializer-overrides -Winjected-class-name -Winline -Winline-asm -Winline-namespace-reopened-noninline -Winline-new-delete -Winstantiation-after-specialization -Wint-conversion -Wint-conversions -Wint-in-bool-context -Wint-to-pointer-cast -Wint-to-void-pointer-cast -Winteger-overflow -Winvalid-command-line-argument -Winvalid-constexpr -Winvalid-iboutlet -Winvalid-initializer-from-system-header -Winvalid-ios-deployment-target -Winvalid-no-builtin-names -Winvalid-noreturn -Winvalid-offsetof -Winvalid-or-nonexistent-directory -Winvalid-partial-specialization -Winvalid-pch -Winvalid-pp-token -Winvalid-source-encoding -Winvalid-token-paste -Winvalid-utf8 -Wjump-seh-finally -Wkeyword-compat -Wkeyword-macro -Wknr-promoted-parameter -Wlanguage-extension-token -Wlarge-by-value-copy -Wliblto -Wlinker-warnings -Wliteral-conversion -Wliteral-range -Wlocal-type-template-args -Wlogical-not-parentheses -Wlogical-op-parentheses -Wlong-long -Wloop-analysis -Wmacro-redefined -Wmain -Wmain-return-type -Wmalformed-warning-check -Wmany-braces-around-scalar-init -Wmax-tokens -Wmax-unsigned-zero -Wmemset-transposed-args -Wmemsize-comparison -Wmethod-signatures -Wmicrosoft -Wmicrosoft-abstract -Wmicrosoft-anon-tag -Wmicrosoft-cast -Wmicrosoft-charize -Wmicrosoft-comment-paste -Wmicrosoft-const-init -Wmicrosoft-cpp-macro -Wmicrosoft-default-arg-redefinition -Wmicrosoft-drectve-section -Wmicrosoft-end-of-file -Wmicrosoft-enum-forward-reference -Wmicrosoft-enum-value -Wmicrosoft-exception-spec -Wmicrosoft-exists -Wmicrosoft-explicit-constructor-call -Wmicrosoft-extra-qualification -Wmicrosoft-fixed-enum -Wmicrosoft-flexible-array -Wmicrosoft-goto -Wmicrosoft-inaccessible-base -Wmicrosoft-include -Wmicrosoft-mutable-reference -Wmicrosoft-pure-definition -Wmicrosoft-redeclare-static -Wmicrosoft-sealed -Wmicrosoft-static-assert -Wmicrosoft-template -Wmicrosoft-template-shadow -Wmicrosoft-union-member-reference -Wmicrosoft-unqualified-friend -Wmicrosoft-using-decl -Wmicrosoft-void-pseudo-dtor -Wmisexpect -Wmisleading-indentation -Wmismatched-new-delete -Wmismatched-parameter-types -Wmismatched-return-types -Wmismatched-tags -Wmissing-braces -Wmissing-constinit -Wmissing-declarations -Wmissing-exception-spec -Wmissing-field-initializers -Wmissing-format-attribute -Wmissing-include-dirs -Wmissing-method-return-type -Wmissing-noescape -Wmissing-noreturn -Wmissing-prototype-for-cc -Wmissing-prototypes -Wmissing-selector-name -Wmissing-sysroot -Wmissing-variable-declarations -Wmisspelled-assumption -Rmodule-build -Wmodule-conflict -Wmodule-file-config-mismatch -Wmodule-file-extension -Rmodule-import -Wmodule-import-in-extern-c -Rmodule-include-translation -Rmodule-lock -Wmodules-ambiguous-internal-linkage -Wmodules-import-nested-redundant -Wmost -Wmove -Wmsvc-include -Wmsvc-not-found -Wmultichar -Wmultiple-move-vbase -Wnarrowing -Wnested-anon-types -Wnested-externs -Wnew-returns-null -Wnoderef -Wnoexcept-type -Wnon-c-typedef-for-linkage -Wnon-gcc -Wnon-literal-null-conversion -Wnon-modular-include-in-framework-module -Wnon-modular-include-in-module -Wnon-pod-varargs -Wnon-power-of-two-alignment -Wnon-virtual-dtor -Wnonnull -Wnonportable-cfstrings -Wnonportable-include-path -Wnonportable-private-apinotes-path -Wnonportable-private-system-apinotes-path -Wnonportable-system-include-path -Wnonportable-vector-initialization -Wnontrivial-memaccess -Wnsconsumed-mismatch -Wnsreturns-mismatch -Wnull-arithmetic -Wnull-character -Wnull-conversion -Wnull-dereference -Wnull-pointer-arithmetic -Wnull-pointer-subtraction -Wnullability -Wnullability-completeness -Wnullability-completeness-on-arrays -Wnullability-declspec -Wnullability-extension -Wnullability-inferred-on-nested-type -Wnullable-to-nonnull-conversion -Wobjc-autosynthesis-property-ivar-name-match -Wobjc-bool-constant-conversion -Wobjc-boxing -Wobjc-circular-container -Wobjc-cocoa-api -Wobjc-designated-initializers -Wobjc-dictionary-duplicate-keys -Wobjc-duplicate-category-definition -Wobjc-flexible-array -Wobjc-forward-class-redefinition -Wobjc-interface-ivars -Wobjc-literal-compare -Wobjc-literal-conversion -Wobjc-macro-redefinition -Wobjc-messaging-id -Wobjc-method-access -Wobjc-missing-property-synthesis -Wobjc-missing-super-calls -Wobjc-multiple-method-names -Wobjc-noncopy-retain-block-property -Wobjc-nonunified-exceptions -Wobjc-property-assign-on-object-type -Wobjc-property-implementation -Wobjc-property-implicit-mismatch -Wobjc-property-matches-cocoa-ownership-rule -Wobjc-property-no-attribute -Wobjc-property-synthesis -Wobjc-protocol-method-implementation -Wobjc-protocol-property-synthesis -Wobjc-protocol-qualifiers -Wobjc-readonly-with-setter-property -Wobjc-redundant-api-use -Wobjc-redundant-literal-use -Wobjc-root-class -Wobjc-signed-char-bool -Wobjc-signed-char-bool-implicit-float-conversion -Wobjc-signed-char-bool-implicit-int-conversion -Wobjc-string-compare -Wobjc-string-concatenation -Wobjc-unsafe-perform-selector -Wodr -Wold-style-cast -Wold-style-definition -Wopencl-unsupported-rgba -Wopenmp -Wopenmp-51-extensions -Wopenmp-clauses -Wopenmp-loop-form -Wopenmp-mapping -Wopenmp-target -Woption-ignored -Wordered-compare-function-pointers -Wout-of-line-declaration -Wout-of-scope-function -Wover-aligned -Woverflow -Woverlength-strings -Woverloaded-shift-op-parentheses -Woverloaded-virtual -Woverride-init -Woverride-module -Woverriding-method-mismatch -Wpacked -Wpadded -Wparentheses -Wparentheses-equality -Wpartial-availability -Wpass-failed -Wpch-date-time -Wpedantic -Wpedantic-core-features -Wpedantic-macros -Wpessimizing-move -Wpointer-arith -Wpointer-bool-conversion -Wpointer-compare -Wpointer-integer-compare -Wpointer-sign -Wpointer-to-enum-cast -Wpointer-to-int-cast -Wpointer-type-mismatch -Wpotentially-direct-selector -Wpotentially-evaluated-expression -Wpragma-clang-attribute -Wpragma-once-outside-header -Wpragma-pack -Wpragma-pack-suspicious-include -Wpragma-system-header-outside-header -Wpragmas -Wpre-c++14-compat -Wpre-c++14-compat-pedantic -Wpre-c++17-compat -Wpre-c++17-compat-pedantic -Wpre-c++20-compat -Wpre-c++20-compat-pedantic -Wpre-c2x-compat -Wpre-c2x-compat-pedantic -Wpre-openmp-51-compat -Wpredefined-identifier-outside-function -Wprivate-extern -Wprivate-header -Wprivate-module -Wprofile-instr-missing -Wprofile-instr-out-of-date -Wprofile-instr-unprofiled -Wproperty-access-dot-syntax -Wproperty-attribute-mismatch -Wprotocol -Wprotocol-property-synthesis-ambiguity -Wpsabi -Wptrauth-null-pointers -Wqualified-void-return-type -Wquoted-include-in-framework-header -Wrange-loop-analysis -Wrange-loop-bind-reference -Wrange-loop-construct -Wread-only-types -Wreadonly-iboutlet-property -Wreceiver-expr -Wreceiver-forward-class -Wredeclared-class-member -Wredundant-consteval-if -Wredundant-decls -Wredundant-move -Wredundant-parens -Wregister -Wreinterpret-base-class -Rremark-backend-plugin -Wreorder -Wreorder-ctor -Wreorder-init-list -Wrequires-super-attribute -Wreserved-id-macro -Wreserved-identifier -Wreserved-macro-identifier -Wreserved-user-defined-literal -Wrestrict-expansion -Wretained-language-linkage -Wreturn-stack-address -Wreturn-std-move -Wreturn-type -Wreturn-type-c-linkage -Wrewrite-not-bool -Rround-trip-cc1-args -Wrtti -Rsanitize-address -Wsarif-format-unstable -Wsection -Wselector -Wselector-type-mismatch -Wself-assign -Wself-assign-field -Wself-assign-overloaded -Wself-move -Wsemicolon-before-method-body -Wsentinel -Wsequence-point -Wserialized-diagnostics -Wshadow -Wshadow-all -Wshadow-field -Wshadow-field-in-constructor -Wshadow-field-in-constructor-modified -Wshadow-ivar -Wshadow-uncaptured-local -Wshift-count-negative -Wshift-count-overflow -Wshift-negative-value -Wshift-op-parentheses -Wshift-overflow -Wshift-sign-overflow -Wshorten-64-to-32 -Wsign-compare -Wsign-conversion -Wsign-promo -Wsigned-enum-bitfield -Wsigned-unsigned-wchar -Wsingle-bit-bitfield-constant-conversion -Wsizeof-array-argument -Wsizeof-array-decay -Wsizeof-array-div -Wsizeof-pointer-div -Wsizeof-pointer-memaccess -Wslash-u-filename -Wslh-asm-goto -Wsometimes-uninitialized -Wsource-mgr -Wsource-uses-openmp -Wspir-compat -Wspirv-compat -Wstack-exhausted -Wstack-protector -Wstatic-float-init -Wstatic-in-inline -Wstatic-inline-explicit-instantiation -Wstatic-local-in-inline -Wstatic-self-init -Wstdlibcxx-not-found -Wstrict-aliasing -Wstrict-aliasing=0 -Wstrict-aliasing=1 -Wstrict-aliasing=2 -Wstrict-overflow -Wstrict-overflow=0 -Wstrict-overflow=1 -Wstrict-overflow=2 -Wstrict-overflow=3 -Wstrict-overflow=4 -Wstrict-overflow=5 -Wstrict-potentially-direct-selector -Wstrict-prototypes -Wstrict-selector-match -Wstring-compare -Wstring-concatenation -Wstring-conversion -Wstring-plus-char -Wstring-plus-int -Wstrlcpy-strlcat-size -Wstrncat-size -Wsuggest-destructor-override -Wsuggest-override -Wsuper-class-method-mismatch -Wsuspicious-bzero -Wsuspicious-memaccess -Wswift-name-attribute -Wswitch -Wswitch-bool -Wswitch-default -Wswitch-enum -Wsync-fetch-and-nand-semantics-changed -Wsynth -Wtarget-clones-mixed-specifiers -Wtautological-bitwise-compare -Wtautological-compare -Wtautological-constant-compare -Wtautological-constant-in-range-compare -Wtautological-constant-out-of-range-compare -Wtautological-objc-bool-compare -Wtautological-overlap-compare -Wtautological-pointer-compare -Wtautological-type-limit-compare -Wtautological-undefined-compare -Wtautological-unsigned-char-zero-compare -Wtautological-unsigned-enum-zero-compare -Wtautological-unsigned-zero-compare -Wtautological-value-range-compare -Wtcb-enforcement -Wtentative-definition-incomplete-type -Wthread-safety -Wthread-safety-analysis -Wthread-safety-attributes -Wthread-safety-beta -Wthread-safety-negative -Wthread-safety-precise -Wthread-safety-reference -Wthread-safety-verbose -Wtrigraphs -Wtype-limits -Wtype-safety -Wtypedef-redefinition -Wtypename-missing -Wunable-to-open-stats-file -Wunaligned-access -Wunaligned-qualifier-implicit-cast -Wunavailable-declarations -Wundeclared-selector -Wundef -Wundef-prefix -Wundefined-arm-streaming -Wundefined-arm-za -Wundefined-bool-conversion -Wundefined-func-template -Wundefined-inline -Wundefined-internal -Wundefined-internal-type -Wundefined-reinterpret-cast -Wundefined-var-template -Wunderaligned-exception-object -Wunevaluated-expression -Wunguarded-availability -Wunguarded-availability-new -Wunicode -Wunicode-homoglyph -Wunicode-whitespace -Wunicode-zero-width -Wuninitialized -Wuninitialized-const-reference -Wunknown-argument -Wunknown-assumption -Wunknown-attributes -Wunknown-cuda-version -Wunknown-directives -Wunknown-escape-sequence -Wunknown-pragmas -Wunknown-sanitizers -Wunknown-warning-option -Wunnamed-type-template-args -Wunneeded-internal-declaration -Wunneeded-member-function -Wunqualified-std-cast-call -Wunreachable-code -Wunreachable-code-aggressive -Wunreachable-code-break -Wunreachable-code-fallthrough -Wunreachable-code-generic-assoc -Wunreachable-code-loop-increment -Wunreachable-code-return -Wunsequenced -Wunsupported-abi -Wunsupported-abs -Wunsupported-availability-guard -Wunsupported-cb -Wunsupported-dll-base-class-template -Wunsupported-floating-point-opt -Wunsupported-friend -Wunsupported-gpopt -Wunsupported-nan -Wunsupported-target-opt -Wunsupported-visibility -Wunusable-partial-specialization -Wunused -Wunused-argument -Wunused-but-set-parameter -Wunused-but-set-variable -Wunused-command-line-argument -Wunused-comparison -Wunused-const-variable -Wunused-exception-parameter -Wunused-function -Wunused-getter-return-value -Wunused-label -Wunused-lambda-capture -Wunused-local-typedef -Wunused-local-typedefs -Wunused-macros -Wunused-member-function -Wunused-parameter -Wunused-private-field -Wunused-property-ivar -Wunused-result -Wunused-template -Wunused-value -Wunused-variable -Wunused-volatile-lvalue -Wused-but-marked-unused -Wuser-defined-literals -Wuser-defined-warnings -Wvarargs -Wvariadic-macros -Wvec-elem-size -Wvector-conversion -Wvector-conversions -Wvexing-parse -Wvisibility -Wvla -Wvla-extension -Wvoid-pointer-to-enum-cast -Wvoid-pointer-to-int-cast -Wvoid-ptr-dereference -Wvolatile-register-var -Wwasm-exception-spec -Wweak-template-vtables -Wweak-vtables -Wwritable-strings -Wwrite-strings -Wxor-used-as-pow -Wzero-as-null-pointer-constant -Wzero-length-array -fsafe-buffer-usage-suggestions

./main

rm main