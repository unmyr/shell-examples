#!/usr/bin/env bash
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
槇遙瑤凜熙                                          # 1-84
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
# 1面 83区 第2水準
ea40 ea41 ea42 ea43 ea44 ea45 ea46 ea47 ea48 ea49 ea4a ea4b ea4c ea4d ea4e ea4f
ea50 ea51 ea52 ea53 ea54 ea55 ea56 ea57 ea58 ea59 ea5a ea5b ea5c ea5d ea5e ea5f
ea60 ea61 ea62 ea63 ea64 ea65 ea66 ea67 ea68 ea69 ea6a ea6b ea6c ea6d ea6e ea6f
ea70 ea71 ea72 ea73 ea74 ea75 ea76 ea77 ea78 ea79 ea7a ea7b ea7c ea7d ea7e
ea80 ea81 ea82 ea83 ea84 ea85 ea86 ea87 ea88 ea89 ea8a ea8b ea8c ea8d ea8e ea8f
ea90 ea91 ea92 ea93 ea94 ea95 ea96 ea97 ea98 ea99 ea9a ea9b ea9c ea9d ea9e
# 1面 84区 第2水準
ea9f
eaa0 eaa1 eaa2 eaa3 eaa4 eaa5 eaa6 eaa7 eaa8 eaa9 eaaa eaab eaac eaad eaae eaaf
eab0 eab1 eab2 eab3 eab4 eab5 eab6 eab7 eab8 eab9 eaba eabb eabc eabd eabe eabf
eac0 eac1 eac2 eac3 eac4 eac5 eac6 eac7 eac8 eac9 eaca eacb eacc eacd eace eacf
ead0 ead1 ead2 ead3 ead4 ead5 ead6 ead7 ead8 ead9 eada eadb eadc eadd eade eadf
eae0 eae1 eae2 eae3 eae4 eae5 eae6 eae7 eae8 eae9 eaea eaeb eaec eaed eaee eaef
eaf0 eaf1 eaf2 eaf3 eaf4 eaf5 eaf6 eaf7 eaf8 eaf9 eafa eafb eafc
${JIS_X_0213_PLANE_2} # JIS X 0213 2面
# IBM extension
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
faf0 faf1 faf2 faf3 faf4 faf5 faf6 faf7 faf8 faf9 fafa fafb fafc
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
fbf0 fbf1 fbf2 fbf3 fbf4 fbf5 fbf6 fbf7 fbf8 fbf9 fbfa fbfb fbfc
fc40 fc41 fc42 fc43 fc44 fc45 fc46 fc47 fc48 fc49 fc4a fc4b
# NEC selection of IBM extensions
ed40 ed41 ed42 ed43 ed44 ed45 ed46 ed47 ed48 ed49 ed4a ed4b ed4c ed4d ed4e ed4f
ed50 ed51 ed52 ed53 ed54 ed55 ed56 ed57 ed58 ed59 ed5a ed5b ed5c ed5d ed5e ed5f
ed60 ed61 ed62 ed63 ed64 ed65 ed66 ed67 ed68 ed69 ed6a ed6b ed6c ed6d ed6e ed6f
ed70 ed71 ed72 ed73 ed74 ed75 ed76 ed77 ed78 ed79 ed7a ed7b ed7c ed7d ed7e ed7f
ed80 ed81 ed82 ed83 ed84 ed85 ed86 ed87 ed88 ed89 ed8a ed8b ed8c ed8d ed8e ed8f
ed90 ed91 ed92 ed93 ed94 ed95 ed96 ed97 ed98 ed99 ed9a ed9b ed9c ed9d ed9e ed9f
eda0 eda1 eda2 eda3 eda4 eda5 eda6 eda7 eda8 eda9 edaa edab edac edad edae edaf
edb0 edb1 edb2 edb3 edb4 edb5 edb6 edb7 edb8 edb9 edba edbb edbc edbd edbe edbf
edc0 edc1 edc2 edc3 edc4 edc5 edc6 edc7 edc8 edc9 edca edcb edcc edcd edce edcf
edd0 edd1 edd2 edd3 edd4 edd5 edd6 edd7 edd8 edd9 edda eddb eddc eddd edde eddf
ede0 ede1 ede2 ede3 ede4 ede5 ede6 ede7 ede8 ede9 edea edeb edec eded edee edef
edf0 edf1 edf2 edf3 edf4 edf5 edf6 edf7 edf8 edf9 edfa edfb edfc
ee40 ee41 ee42 ee43 ee44 ee45 ee46 ee47 ee48 ee49 ee4a ee4b ee4c ee4d ee4e ee4f
ee50 ee51 ee52 ee53 ee54 ee55 ee56 ee57 ee58 ee59 ee5a ee5b ee5c ee5d ee5e ee5f
ee60 ee61 ee62 ee63 ee64 ee65 ee66 ee67 ee68 ee69 ee6a ee6b ee6c ee6d ee6e ee6f
ee70 ee71 ee72 ee73 ee74 ee75 ee76 ee77 ee78 ee79 ee7a ee7b ee7c ee7d ee7e
ee80 ee81 ee82 ee83 ee84 ee85 ee86 ee87 ee88 ee89 ee8a ee8b ee8c ee8d ee8e ee8f
ee90 ee91 ee92 ee93 ee94 ee95 ee96 ee97 ee98 ee99 ee9a ee9b ee9c ee9d ee9e ee9f
eea0 eea1 eea2 eea3 eea4 eea5 eea6 eea7 eea8 eea9 eeaa eeab eeac eead eeae eeaf
eeb0 eeb1 eeb2 eeb3 eeb4 eeb5 eeb6 eeb7 eeb8 eeb9 eeba eebb eebc eebd eebe eebf
eec0 eec1 eec2 eec3 eec4 eec5 eec6 eec7 eec8 eec9 eeca eecb eecc eecd eece eecf
eed0 eed1 eed2 eed3 eed4 eed5 eed6 eed7 eed8 eed9 eeda eedb eedc eedd eede eedf
eee0 eee1 eee2 eee3 eee4 eee5 eee6 eee7 eee8 eee9 eeea eeeb eeec
eeef eef0 eef1 eef2 eef3 eef4 eef5 eef6 eef7 eef8 eef9 eefa eefb eefc
# NEC special characters (NEC特殊文字)
8740 8741 8742 8743 8744 8745 8746 8747 8748 8749 874a 874b 874c 874d 874e 874f
8750 8751 8752 8753 8754 8755 8756 8757 8758 8759 875a 875b 875c 875d         875f
8760 8761 8762 8763 8764 8765 8766 8767 8768 8769 876a 876b 876c 876d 876e 876f
8770 8771 8772 8773 8774 8775                                                                   877e
8780 8781 8782 8783 8784 8785 8786 8787 8788 8789 878a 878b 878c 878d 878e 878f
8790 8791 8792 8793 8794 8795 8796 8797 8798 8799 879a 879b 879c
EOF
