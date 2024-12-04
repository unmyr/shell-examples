#!/bin/bash
ICONV_ERROR_FILE='iconv_errors.txt'
trap "rm -f ${ICONV_ERROR_FILE}" 0

while read WORDS_UTF8_WITH_COMMENT; do
    WORDS_UTF8=$(echo -n "${WORDS_UTF8_WITH_COMMENT}" | sed -e 's/^\s*//; s/\s*#.*$//; s/\s*$//')
    COMMENT=$(echo -n "${WORDS_UTF8_WITH_COMMENT}" | sed -e 's/^\s*[^#]*//; s/\s*#\s*//')

    test -n "${WORDS_UTF8}" && echo "# ${COMMENT}"
    i=0
    while IFS= read -r -n1 CHR; do
            test -z "${CHR}" && continue
            HEX_CP932=$(echo -n $CHR | iconv -f UTF8 -t CP932 2> ${ICONV_ERROR_FILE} | od -tx1 -An |  sed 's/[[:blank:]]*//g')
            SEP=" "
            test $(($i % 8)) -eq 7 && SEP="\n"
            if [ -s ${ICONV_ERROR_FILE} ]; then
                printf "${CHR}(?)${SEP}"
            else
                printf "${CHR}(${HEX_CP932})${SEP}"
            fi
            ((i += 1))
    done <<< "${WORDS_UTF8}"
    echo
done <<EOF
髙﨑
草彅
𩸽 # ほっけ
飛驒
㐂
咩哿喆﨏埇埈塚增奝妤                            # 1-15
弌                                                      # 1-48 JIS X 0208
丐丕个丱丶丼丿乂乖乘亂亅豫亊舒弍          # 1-48 JIS X 0208
于亞亟亠亢亰亳亶从仍仄仆仂仗仞仭          # 1-48 JIS X 0208
仟价伉佚估佛佝佗佇佶侈侏侘佻佩佰          # 1-48 JIS X 0208
侑佯來侖儘俔俟俎俘俛俑俚俐俤俥倚          # 1-48 JIS X 0208
倨倔倪倥倅伜俶倡倩倬俾俯們倆偃假          # 1-48 JIS X 0208
會偕偐偈做偖偬偸傀傚傅傴傲                   # 1-48 JIS X 0208
訷詹誧諟諶諸賴贒郞都鄕鄧釗釤                # 1-92
釥釭鈐鈹鈺鈼鉀銈鋓鋠鋿錡鍈鍰鏆隆隝霳霻 # 1-93
顗馞驎魵鮏鵰黑                                    # 1-94
侒侚倞倢偂偆偰                                    # 2-1
荿蓜蕓 # 2-86
EOF

JIS_X_0213_PLANE_2="fa6f fa71 fa77 fa75 fa7a fa78 fa79"
while read HEX_CODES_CP932_WITH_COMMENT; do
    WORDS_UTF8=()
    HEX_CODES_CP932=$(echo ${HEX_CODES_CP932_WITH_COMMENT} | sed -e 's/\s*#.*$//')
    COMMENT=$(echo -n "${HEX_CODES_CP932_WITH_COMMENT}" | sed -e 's/^\s*[^#]*//; s/\s*#\s*//')
    test -n "${COMMENT}" && echo "# ${COMMENT}"
    for HEX_CP932 in $HEX_CODES_CP932; do
        rm -f ${ICONV_ERROR_FILE}
        WORD_UTF8=$(echo -n ${HEX_CP932} | xxd -r -p | iconv -f CP932 -t UTF8 2> ${ICONV_ERROR_FILE})
        if [ -s ${ICONV_ERROR_FILE} ]; then
            WORDS_UTF8+=("(${HEX_CP932})")
        else
            WORDS_UTF8+=("${WORD_UTF8}(${HEX_CP932})")
        fi
    done
    test  ${#WORDS_UTF8[@]} -ne 0 && echo "${WORDS_UTF8[*]}"
done <<EOF
82a0 82a1 82a2 82a3 82a4 82a5 82a6 82a7 82a8  # JIS X 0208: HIRAGANA LETTER
82a9 82aa 82ab 82ac 82ad 82ae 82af 82b0 82b1   # JIS X 0208: HIRAGANA LETTER
${JIS_X_0213_PLANE_2} # JIS X 0213 2面
# misc
f0f0 f0f1 f0f2 f0f3 f0f4 f0f5 f0f6 f0f7 f0f8 f0f9 f0fa f0fb f0fc f0fd f0fe f0ff
fa40 fa41 fa42 fa43 fa44 fa45 fa46 fa47 fa48 fa49 fa4a fa4b fa4c fa4d fa4e fa4f
fa50 fa51 fa52 fa53 fa54 fa55 fa56 fa57 fa58 fa59 fa5a fa5b fa5c fa5d fa5e fa5f
fa60 fa61 fa62 fa63 fa64 fa65 fa66 fa67 fa68 fa69 fa6a fa6b fa6c fa6d fa6e fa6f
fa70 fa71 fa72 fa73 fa74 fa75 fa76 fa77 fa78 fa79 fa7a fa7b fa7c fa7d fa7e fa7f
fa80 fa81 fa82 fa83 fa84 fa85 fa86 fa87 fa88 fa89 fa8a fa8b fa8c fa8d fa8e fa8f
fa90 fa91 fa92 fa93 fa94 fa95 fa96 fa97 fa98 fa99 fa9a fa9b fa9c fa9d fa9e fa9f
faa0 faa1 faa2 faa3 faa4 faa5 faa6 faa7 faa8 faa9 faaa faab faac faad faae faaf
fab0 fab1 fab2 fab3 fab4 fab5 fab6 fab7 fab8 fab9 faba fabb fabc fabd fabe fabf
fac0 fac1 fac2 fac3 fac4 fac5 fac6 fac7 fac8 fac9 faca facb facc facd face facf
fad0 fad1 fad2 fad3 fad4 fad5 fad6 fad7 fad8 fad9 fada fadb fadc fadd fade fadf
fae0 fae1 fae2 fae3 fae4 fae5 fae6 fae7 fae8 fae9 faea faeb faec faed faee faef
faf0 faf1 faf2 faf3 faf4 faf5 faf6 faf7 faf8 faf9 fafa fafb fafc fafd fafe faff
fb40 fb41 fb42 fb43 fb44 fb45 fb46 fb47 fb48 fb49 fb4a fb4b fb4c fb4d fb4e fb4f
fb50 fb51 fb52 fb53 fb54 fb55 fb56 fb57 fb58 fb59 fb5a fb5b fb5c fb5d fb5e fb5f
fb60 fb61 fb62 fb63 fb64 fb65 fb66 fb67 fb68 fb69 fb6a fb6b fb6c fb6d fb6e fb6f
fb80 fb81 fb82 fb83 fb84 fb85 fb86 fb87 fb88 fb89 fb8a fb8b fb8c fb8d fb8e fb8f
fb90 fb91 fb92 fb93 fb94 fb95 fb96 fb97 fb98 fb99 fb9a fb9b fb9c fb9d fb9e fb9f
fba0 fba1 fba2 fba3 fba4 fba5 fba6 fba7 fba8 fba9 fbaa fbab fbac fbad fbae fbaf
fbb0 fbb1 fbb2 fbb3 fbb4 fbb5 fbb6 fbb7 fbb8 fbb9 fbba fbbb fbbc fbbd fbbe fbbf
fbc0 fbc1 fbc2 fbc3 fbc4 fbc5 fbc6 fbc7 fbc8 fbc9 fbca fbcb fbcc fbcd fbce fbcf
fbd0 fbd1 fbd2 fbd3 fbd4 fbd5 fbd6 fbd7 fbd8 fbd9 fbda fbdb fbdc fbdd fbde fbdf
fbe0 fbe1 fbe2 fbe3 fbe4 fbe5 fbe6 fbe7 fbe8 fbe9 fbea fbeb fbec fbed fbee fbef
fbf0 fbf1 fbf2 fbf3 fbf4 fbf5 fbf6 fbf7 fbf8 fbf9 fbfa fbfb fbfc fbfd fbfe fbff
fc40 fc41 fc42 fc43 fc44 fc45 fc46 fc47 fc48 fc49 fc4a fc4b fc4c fc4d fc4e fc4f
EOF
