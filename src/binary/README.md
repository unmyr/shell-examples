## Character encoding

* NEC special characters (NEC特殊文字)
* IBM extension (IBM拡張文字)
* NEC selection of IBM extensions (NEC選定IBM拡張文字)

### cp932.sh

```
$ ./cp932.sh 
# 
髙(fbfc) 﨑(fab1) 
# 
草(9190) 彅(fa67) 
# ほっけ
𩸽(?) 
# 
飛(94f2) 驒(?) 
# 
㐂(?) 
# 1-15
咩(fa93) 哿(fa94) 喆(fa95) 﨏(fa9b) 埇(fa9a) 埈(fa99) 塚(fa9c) 增(fa9d)
奝(faa2) 妤(faa4) 
# 1-48 JIS X 0208
弌(989f) 
# 1-48 JIS X 0208
丐(98a0) 丕(98a1) 个(98a2) 丱(98a3) 丶(98a4) 丼(98a5) 丿(98a6) 乂(98a7)
乖(98a8) 乘(98a9) 亂(98aa) 亅(98ab) 豫(98ac) 亊(98ad) 舒(98ae) 弍(98af)

# 1-48 JIS X 0208
于(98b0) 亞(98b1) 亟(98b2) 亠(98b3) 亢(98b4) 亰(98b5) 亳(98b6) 亶(98b7)
从(98b8) 仍(98b9) 仄(98ba) 仆(98bb) 仂(98bc) 仗(98bd) 仞(98be) 仭(98bf)

# 1-48 JIS X 0208
仟(98c0) 价(98c1) 伉(98c2) 佚(98c3) 估(98c4) 佛(98c5) 佝(98c6) 佗(98c7)
佇(98c8) 佶(98c9) 侈(98ca) 侏(98cb) 侘(98cc) 佻(98cd) 佩(98ce) 佰(98cf)

# 1-48 JIS X 0208
侑(98d0) 佯(98d1) 來(98d2) 侖(98d3) 儘(98d4) 俔(98d5) 俟(98d6) 俎(98d7)
俘(98d8) 俛(98d9) 俑(98da) 俚(98db) 俐(98dc) 俤(98dd) 俥(98de) 倚(98df)

# 1-48 JIS X 0208
倨(98e0) 倔(98e1) 倪(98e2) 倥(98e3) 倅(98e4) 伜(98e5) 俶(98e6) 倡(98e7)
倩(98e8) 倬(98e9) 俾(98ea) 俯(98eb) 們(98ec) 倆(98ed) 偃(98ee) 假(98ef)

# 1-48 JIS X 0208
會(98f0) 偕(98f1) 偐(98f2) 偈(98f3) 做(98f4) 偖(98f5) 偬(98f6) 偸(98f7)
傀(98f8) 傚(98f9) 傅(98fa) 傴(98fb) 傲(98fc) 
# 1-84
槇(eaa0) 遙(eaa1) 瑤(eaa2) 凜(eaa3) 熙(eaa4) 
# 1-92
訷(fba4) 詹(fba5) 誧(fba6) 諟(fba8) 諶(fbaa) 諸(fba9) 賴(fbae) 贒(fbaf)
郞(fbb6) 都(fbb7) 鄕(fbb8) 鄧(fbb9) 釗(fbbb) 釤(fbbf) 
# 1-93
釥(fbc0) 釭(fbbd) 鈐(fbc2) 鈹(fbca) 鈺(fbc4) 鈼(fbc6) 鉀(fbc5) 銈(fa5f)
鋓(fbd6) 鋠(fbd5) 鋿(fbdc) 錡(fbd8) 鍈(fa5e) 鍰(fbdf) 鏆(fbe2) 隆(fbe9)
隝(fbeb) 霳(fbed) 霻(fbee) 
# 1-94
顗(fbf4) 馞(fbfa) 驎(fbfb) 魵(fc41) 鮏(fc43) 鵰(fc47) 黑(fc4b) 
# 2-1
侒(fa6f) 侚(fa71) 倞(fa77) 倢(fa75) 偂(fa7a) 偆(fa78) 偰(fa79) 
# 2-86
荿(fb95) 蓜(fa60) 蕓(fb9a) 
# JIS X 0208: HIRAGANA LETTER
あ(82a0) ぃ(82a1) い(82a2) ぅ(82a3) う(82a4) ぇ(82a5) え(82a6) ぉ(82a7) お(82a8)
# JIS X 0208: HIRAGANA LETTER
か(82a9) が(82aa) き(82ab) ぎ(82ac) く(82ad) ぐ(82ae) け(82af) げ(82b0) こ(82b1)
# 1面 83区 第2水準
鵝(ea40) 鵞(ea41) 鵤(ea42) 鵑(ea43) 鵐(ea44) 鵙(ea45) 鵲(ea46) 鶉(ea47) 鶇(ea48) 鶫(ea49) 鵯(ea4a) 鵺(ea4b) 鶚(ea4c) 鶤(ea4d) 鶩(ea4e) 鶲(ea4f)
鷄(ea50) 鷁(ea51) 鶻(ea52) 鶸(ea53) 鶺(ea54) 鷆(ea55) 鷏(ea56) 鷂(ea57) 鷙(ea58) 鷓(ea59) 鷸(ea5a) 鷦(ea5b) 鷭(ea5c) 鷯(ea5d) 鷽(ea5e) 鸚(ea5f)
鸛(ea60) 鸞(ea61) 鹵(ea62) 鹹(ea63) 鹽(ea64) 麁(ea65) 麈(ea66) 麋(ea67) 麌(ea68) 麒(ea69) 麕(ea6a) 麑(ea6b) 麝(ea6c) 麥(ea6d) 麩(ea6e) 麸(ea6f)
麪(ea70) 麭(ea71) 靡(ea72) 黌(ea73) 黎(ea74) 黏(ea75) 黐(ea76) 黔(ea77) 黜(ea78) 點(ea79) 黝(ea7a) 黠(ea7b) 黥(ea7c) 黨(ea7d) 黯(ea7e)
黴(ea80) 黶(ea81) 黷(ea82) 黹(ea83) 黻(ea84) 黼(ea85) 黽(ea86) 鼇(ea87) 鼈(ea88) 皷(ea89) 鼕(ea8a) 鼡(ea8b) 鼬(ea8c) 鼾(ea8d) 齊(ea8e) 齒(ea8f)
齔(ea90) 齣(ea91) 齟(ea92) 齠(ea93) 齡(ea94) 齦(ea95) 齧(ea96) 齬(ea97) 齪(ea98) 齷(ea99) 齲(ea9a) 齶(ea9b) 龕(ea9c) 龜(ea9d) 龠(ea9e)
# 1面 84区 第2水準
堯(ea9f)
槇(eaa0) 遙(eaa1) 瑤(eaa2) 凜(eaa3) 熙(eaa4) (eaa5) (eaa6) (eaa7) (eaa8) (eaa9) (eaaa) (eaab) (eaac) (eaad) (eaae) (eaaf)
(eab0) (eab1) (eab2) (eab3) (eab4) (eab5) (eab6) (eab7) (eab8) (eab9) (eaba) (eabb) (eabc) (eabd) (eabe) (eabf)
(eac0) (eac1) (eac2) (eac3) (eac4) (eac5) (eac6) (eac7) (eac8) (eac9) (eaca) (eacb) (eacc) (eacd) (eace) (eacf)
(ead0) (ead1) (ead2) (ead3) (ead4) (ead5) (ead6) (ead7) (ead8) (ead9) (eada) (eadb) (eadc) (eadd) (eade) (eadf)
(eae0) (eae1) (eae2) (eae3) (eae4) (eae5) (eae6) (eae7) (eae8) (eae9) (eaea) (eaeb) (eaec) (eaed) (eaee) (eaef)
(eaf0) (eaf1) (eaf2) (eaf3) (eaf4) (eaf5) (eaf6) (eaf7) (eaf8) (eaf9) (eafa) (eafb) (eafc)
# JIS X 0213 2面
侒(fa6f) 侚(fa71) 倞(fa77) 倢(fa75) 偂(fa7a) 偆(fa78) 偰(fa79)
# IBM extension
ⅰ(fa40) ⅱ(fa41) ⅲ(fa42) ⅳ(fa43) ⅴ(fa44) ⅵ(fa45) ⅶ(fa46) ⅷ(fa47) ⅸ(fa48) ⅹ(fa49) Ⅰ(fa4a) Ⅱ(fa4b) Ⅲ(fa4c) Ⅳ(fa4d) Ⅴ(fa4e) Ⅵ(fa4f)
Ⅶ(fa50) Ⅷ(fa51) Ⅸ(fa52) Ⅹ(fa53) ￢(fa54) ￤(fa55) ＇(fa56) ＂(fa57) ㈱(fa58) №(fa59) ℡(fa5a) ∵(fa5b) 纊(fa5c) 褜(fa5d) 鍈(fa5e) 銈(fa5f)
蓜(fa60) 俉(fa61) 炻(fa62) 昱(fa63) 棈(fa64) 鋹(fa65) 曻(fa66) 彅(fa67) 丨(fa68) 仡(fa69) 仼(fa6a) 伀(fa6b) 伃(fa6c) 伹(fa6d) 佖(fa6e) 侒(fa6f)
侊(fa70) 侚(fa71) 侔(fa72) 俍(fa73) 偀(fa74) 倢(fa75) 俿(fa76) 倞(fa77) 偆(fa78) 偰(fa79) 偂(fa7a) 傔(fa7b) 僴(fa7c) 僘(fa7d) 兊(fa7e) (fa7f)
兤(fa80) 冝(fa81) 冾(fa82) 凬(fa83) 刕(fa84) 劜(fa85) 劦(fa86) 勀(fa87) 勛(fa88) 匀(fa89) 匇(fa8a) 匤(fa8b) 卲(fa8c) 厓(fa8d) 厲(fa8e) 叝(fa8f)
﨎(fa90) 咜(fa91) 咊(fa92) 咩(fa93) 哿(fa94) 喆(fa95) 坙(fa96) 坥(fa97) 垬(fa98) 埈(fa99) 埇(fa9a) 﨏(fa9b) 塚(fa9c) 增(fa9d) 墲(fa9e) 夋(fa9f)
奓(faa0) 奛(faa1) 奝(faa2) 奣(faa3) 妤(faa4) 妺(faa5) 孖(faa6) 寀(faa7) 甯(faa8) 寘(faa9) 寬(faaa) 尞(faab) 岦(faac) 岺(faad) 峵(faae) 崧(faaf)
嵓(fab0) 﨑(fab1) 嵂(fab2) 嵭(fab3) 嶸(fab4) 嶹(fab5) 巐(fab6) 弡(fab7) 弴(fab8) 彧(fab9) 德(faba) 忞(fabb) 恝(fabc) 悅(fabd) 悊(fabe) 惞(fabf)
惕(fac0) 愠(fac1) 惲(fac2) 愑(fac3) 愷(fac4) 愰(fac5) 憘(fac6) 戓(fac7) 抦(fac8) 揵(fac9) 摠(faca) 撝(facb) 擎(facc) 敎(facd) 昀(face) 昕(facf)
昻(fad0) 昉(fad1) 昮(fad2) 昞(fad3) 昤(fad4) 晥(fad5) 晗(fad6) 晙(fad7) 晴(fad8) 晳(fad9) 暙(fada) 暠(fadb) 暲(fadc) 暿(fadd) 曺(fade) 朎(fadf)
朗(fae0) 杦(fae1) 枻(fae2) 桒(fae3) 柀(fae4) 栁(fae5) 桄(fae6) 棏(fae7) 﨓(fae8) 楨(fae9) 﨔(faea) 榘(faeb) 槢(faec) 樰(faed) 橫(faee) 橆(faef)
橳(faf0) 橾(faf1) 櫢(faf2) 櫤(faf3) 毖(faf4) 氿(faf5) 汜(faf6) 沆(faf7) 汯(faf8) 泚(faf9) 洄(fafa) 涇(fafb) 浯(fafc)
涖(fb40) 涬(fb41) 淏(fb42) 淸(fb43) 淲(fb44) 淼(fb45) 渹(fb46) 湜(fb47) 渧(fb48) 渼(fb49) 溿(fb4a) 澈(fb4b) 澵(fb4c) 濵(fb4d) 瀅(fb4e) 瀇(fb4f)
瀨(fb50) 炅(fb51) 炫(fb52) 焏(fb53) 焄(fb54) 煜(fb55) 煆(fb56) 煇(fb57) 凞(fb58) 燁(fb59) 燾(fb5a) 犱(fb5b) 犾(fb5c) 猤(fb5d) 猪(fb5e) 獷(fb5f)
玽(fb60) 珉(fb61) 珖(fb62) 珣(fb63) 珒(fb64) 琇(fb65) 珵(fb66) 琦(fb67) 琪(fb68) 琩(fb69) 琮(fb6a) 瑢(fb6b) 璉(fb6c) 璟(fb6d) 甁(fb6e) 畯(fb6f)
祥(fb80) 禔(fb81) 福(fb82) 禛(fb83) 竑(fb84) 竧(fb85) 靖(fb86) 竫(fb87) 箞(fb88) 精(fb89) 絈(fb8a) 絜(fb8b) 綷(fb8c) 綠(fb8d) 緖(fb8e) 繒(fb8f)
罇(fb90) 羡(fb91) 羽(fb92) 茁(fb93) 荢(fb94) 荿(fb95) 菇(fb96) 菶(fb97) 葈(fb98) 蒴(fb99) 蕓(fb9a) 蕙(fb9b) 蕫(fb9c) 﨟(fb9d) 薰(fb9e) 蘒(fb9f)
﨡(fba0) 蠇(fba1) 裵(fba2) 訒(fba3) 訷(fba4) 詹(fba5) 誧(fba6) 誾(fba7) 諟(fba8) 諸(fba9) 諶(fbaa) 譓(fbab) 譿(fbac) 賰(fbad) 賴(fbae) 贒(fbaf)
赶(fbb0) 﨣(fbb1) 軏(fbb2) 﨤(fbb3) 逸(fbb4) 遧(fbb5) 郞(fbb6) 都(fbb7) 鄕(fbb8) 鄧(fbb9) 釚(fbba) 釗(fbbb) 釞(fbbc) 釭(fbbd) 釮(fbbe) 釤(fbbf)
釥(fbc0) 鈆(fbc1) 鈐(fbc2) 鈊(fbc3) 鈺(fbc4) 鉀(fbc5) 鈼(fbc6) 鉎(fbc7) 鉙(fbc8) 鉑(fbc9) 鈹(fbca) 鉧(fbcb) 銧(fbcc) 鉷(fbcd) 鉸(fbce) 鋧(fbcf)
鋗(fbd0) 鋙(fbd1) 鋐(fbd2) 﨧(fbd3) 鋕(fbd4) 鋠(fbd5) 鋓(fbd6) 錥(fbd7) 錡(fbd8) 鋻(fbd9) 﨨(fbda) 錞(fbdb) 鋿(fbdc) 錝(fbdd) 錂(fbde) 鍰(fbdf)
鍗(fbe0) 鎤(fbe1) 鏆(fbe2) 鏞(fbe3) 鏸(fbe4) 鐱(fbe5) 鑅(fbe6) 鑈(fbe7) 閒(fbe8) 隆(fbe9) 﨩(fbea) 隝(fbeb) 隯(fbec) 霳(fbed) 霻(fbee) 靃(fbef)
靍(fbf0) 靏(fbf1) 靑(fbf2) 靕(fbf3) 顗(fbf4) 顥(fbf5) 飯(fbf6) 飼(fbf7) 餧(fbf8) 館(fbf9) 馞(fbfa) 驎(fbfb) 髙(fbfc)
髜(fc40) 魵(fc41) 魲(fc42) 鮏(fc43) 鮱(fc44) 鮻(fc45) 鰀(fc46) 鵰(fc47) 鵫(fc48) 鶴(fc49) 鸙(fc4a) 黑(fc4b)
# NEC selection of IBM extensions
纊(ed40) 褜(ed41) 鍈(ed42) 銈(ed43) 蓜(ed44) 俉(ed45) 炻(ed46) 昱(ed47) 棈(ed48) 鋹(ed49) 曻(ed4a) 彅(ed4b) 丨(ed4c) 仡(ed4d) 仼(ed4e) 伀(ed4f)
伃(ed50) 伹(ed51) 佖(ed52) 侒(ed53) 侊(ed54) 侚(ed55) 侔(ed56) 俍(ed57) 偀(ed58) 倢(ed59) 俿(ed5a) 倞(ed5b) 偆(ed5c) 偰(ed5d) 偂(ed5e) 傔(ed5f)
僴(ed60) 僘(ed61) 兊(ed62) 兤(ed63) 冝(ed64) 冾(ed65) 凬(ed66) 刕(ed67) 劜(ed68) 劦(ed69) 勀(ed6a) 勛(ed6b) 匀(ed6c) 匇(ed6d) 匤(ed6e) 卲(ed6f)
厓(ed70) 厲(ed71) 叝(ed72) 﨎(ed73) 咜(ed74) 咊(ed75) 咩(ed76) 哿(ed77) 喆(ed78) 坙(ed79) 坥(ed7a) 垬(ed7b) 埈(ed7c) 埇(ed7d) 﨏(ed7e) (ed7f)
塚(ed80) 增(ed81) 墲(ed82) 夋(ed83) 奓(ed84) 奛(ed85) 奝(ed86) 奣(ed87) 妤(ed88) 妺(ed89) 孖(ed8a) 寀(ed8b) 甯(ed8c) 寘(ed8d) 寬(ed8e) 尞(ed8f)
岦(ed90) 岺(ed91) 峵(ed92) 崧(ed93) 嵓(ed94) 﨑(ed95) 嵂(ed96) 嵭(ed97) 嶸(ed98) 嶹(ed99) 巐(ed9a) 弡(ed9b) 弴(ed9c) 彧(ed9d) 德(ed9e) 忞(ed9f)
恝(eda0) 悅(eda1) 悊(eda2) 惞(eda3) 惕(eda4) 愠(eda5) 惲(eda6) 愑(eda7) 愷(eda8) 愰(eda9) 憘(edaa) 戓(edab) 抦(edac) 揵(edad) 摠(edae) 撝(edaf)
擎(edb0) 敎(edb1) 昀(edb2) 昕(edb3) 昻(edb4) 昉(edb5) 昮(edb6) 昞(edb7) 昤(edb8) 晥(edb9) 晗(edba) 晙(edbb) 晴(edbc) 晳(edbd) 暙(edbe) 暠(edbf)
暲(edc0) 暿(edc1) 曺(edc2) 朎(edc3) 朗(edc4) 杦(edc5) 枻(edc6) 桒(edc7) 柀(edc8) 栁(edc9) 桄(edca) 棏(edcb) 﨓(edcc) 楨(edcd) 﨔(edce) 榘(edcf)
槢(edd0) 樰(edd1) 橫(edd2) 橆(edd3) 橳(edd4) 橾(edd5) 櫢(edd6) 櫤(edd7) 毖(edd8) 氿(edd9) 汜(edda) 沆(eddb) 汯(eddc) 泚(eddd) 洄(edde) 涇(eddf)
浯(ede0) 涖(ede1) 涬(ede2) 淏(ede3) 淸(ede4) 淲(ede5) 淼(ede6) 渹(ede7) 湜(ede8) 渧(ede9) 渼(edea) 溿(edeb) 澈(edec) 澵(eded) 濵(edee) 瀅(edef)
瀇(edf0) 瀨(edf1) 炅(edf2) 炫(edf3) 焏(edf4) 焄(edf5) 煜(edf6) 煆(edf7) 煇(edf8) 凞(edf9) 燁(edfa) 燾(edfb) 犱(edfc)
犾(ee40) 猤(ee41) 猪(ee42) 獷(ee43) 玽(ee44) 珉(ee45) 珖(ee46) 珣(ee47) 珒(ee48) 琇(ee49) 珵(ee4a) 琦(ee4b) 琪(ee4c) 琩(ee4d) 琮(ee4e) 瑢(ee4f)
璉(ee50) 璟(ee51) 甁(ee52) 畯(ee53) 皂(ee54) 皜(ee55) 皞(ee56) 皛(ee57) 皦(ee58) 益(ee59) 睆(ee5a) 劯(ee5b) 砡(ee5c) 硎(ee5d) 硤(ee5e) 硺(ee5f)
礰(ee60) 礼(ee61) 神(ee62) 祥(ee63) 禔(ee64) 福(ee65) 禛(ee66) 竑(ee67) 竧(ee68) 靖(ee69) 竫(ee6a) 箞(ee6b) 精(ee6c) 絈(ee6d) 絜(ee6e) 綷(ee6f)
綠(ee70) 緖(ee71) 繒(ee72) 罇(ee73) 羡(ee74) 羽(ee75) 茁(ee76) 荢(ee77) 荿(ee78) 菇(ee79) 菶(ee7a) 葈(ee7b) 蒴(ee7c) 蕓(ee7d) 蕙(ee7e)
蕫(ee80) 﨟(ee81) 薰(ee82) 蘒(ee83) 﨡(ee84) 蠇(ee85) 裵(ee86) 訒(ee87) 訷(ee88) 詹(ee89) 誧(ee8a) 誾(ee8b) 諟(ee8c) 諸(ee8d) 諶(ee8e) 譓(ee8f)
譿(ee90) 賰(ee91) 賴(ee92) 贒(ee93) 赶(ee94) 﨣(ee95) 軏(ee96) 﨤(ee97) 逸(ee98) 遧(ee99) 郞(ee9a) 都(ee9b) 鄕(ee9c) 鄧(ee9d) 釚(ee9e) 釗(ee9f)
釞(eea0) 釭(eea1) 釮(eea2) 釤(eea3) 釥(eea4) 鈆(eea5) 鈐(eea6) 鈊(eea7) 鈺(eea8) 鉀(eea9) 鈼(eeaa) 鉎(eeab) 鉙(eeac) 鉑(eead) 鈹(eeae) 鉧(eeaf)
銧(eeb0) 鉷(eeb1) 鉸(eeb2) 鋧(eeb3) 鋗(eeb4) 鋙(eeb5) 鋐(eeb6) 﨧(eeb7) 鋕(eeb8) 鋠(eeb9) 鋓(eeba) 錥(eebb) 錡(eebc) 鋻(eebd) 﨨(eebe) 錞(eebf)
鋿(eec0) 錝(eec1) 錂(eec2) 鍰(eec3) 鍗(eec4) 鎤(eec5) 鏆(eec6) 鏞(eec7) 鏸(eec8) 鐱(eec9) 鑅(eeca) 鑈(eecb) 閒(eecc) 隆(eecd) 﨩(eece) 隝(eecf)
隯(eed0) 霳(eed1) 霻(eed2) 靃(eed3) 靍(eed4) 靏(eed5) 靑(eed6) 靕(eed7) 顗(eed8) 顥(eed9) 飯(eeda) 飼(eedb) 餧(eedc) 館(eedd) 馞(eede) 驎(eedf)
髙(eee0) 髜(eee1) 魵(eee2) 魲(eee3) 鮏(eee4) 鮱(eee5) 鮻(eee6) 鰀(eee7) 鵰(eee8) 鵫(eee9) 鶴(eeea) 鸙(eeeb) 黑(eeec)
ⅰ(eeef) ⅱ(eef0) ⅲ(eef1) ⅳ(eef2) ⅴ(eef3) ⅵ(eef4) ⅶ(eef5) ⅷ(eef6) ⅸ(eef7) ⅹ(eef8) ￢(eef9) ￤(eefa) ＇(eefb) ＂(eefc)
# NEC special characters (NEC特殊文字)
①(8740) ②(8741) ③(8742) ④(8743) ⑤(8744) ⑥(8745) ⑦(8746) ⑧(8747) ⑨(8748) ⑩(8749) ⑪(874a) ⑫(874b) ⑬(874c) ⑭(874d) ⑮(874e) ⑯(874f)
⑰(8750) ⑱(8751) ⑲(8752) ⑳(8753) Ⅰ(8754) Ⅱ(8755) Ⅲ(8756) Ⅳ(8757) Ⅴ(8758) Ⅵ(8759) Ⅶ(875a) Ⅷ(875b) Ⅸ(875c) Ⅹ(875d) ㍉(875f)
㌔(8760) ㌢(8761) ㍍(8762) ㌘(8763) ㌧(8764) ㌃(8765) ㌶(8766) ㍑(8767) ㍗(8768) ㌍(8769) ㌦(876a) ㌣(876b) ㌫(876c) ㍊(876d) ㌻(876e) ㎜(876f)
㎝(8770) ㎞(8771) ㎎(8772) ㎏(8773) ㏄(8774) ㎡(8775) ㍻(877e)
〝(8780) 〟(8781) №(8782) ㏍(8783) ℡(8784) ㊤(8785) ㊥(8786) ㊦(8787) ㊧(8788) ㊨(8789) ㈱(878a) ㈲(878b) ㈹(878c) ㍾(878d) ㍽(878e) ㍼(878f)
≒(8790) ≡(8791) ∫(8792) ∮(8793) ∑(8794) √(8795) ⊥(8796) ∠(8797) ∟(8798) ⊿(8799) ∵(879a) ∩(879b) ∪(879c)
```
