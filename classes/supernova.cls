\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classes/supernova}[2023/08/15 supernova]

% (u)pLaTeX非互換パッケージに対して互換させるパッチを読み込む命令
% \RequirePackage{plautopatch}

% クラスファイルの作成の参考ｰ>https://qiita.com/takahashim/items/5fcc68fbc8a3eca42f07
\LoadClass[%
  lualatex , %エンジン
  paper=a4 , %用紙サイズ(a4paperがdefault)
  book , %文書クラス(articleがdefault)
  openany, % 章が奇数ページから始まる指定の無効化
  fontsize=10pt , %フォントサイズ(10ptがdefault)
  jafontsize=10pt, % 日本語フォントサイズを10pt
  gutter=25.6mm, % のどの余白を25.6mm
  head_space=20mm, % 余白(上)を20mm
  foot_space=20mm, % 余白(下)を20mm
  line_length=165mm, %一行の文字数（本文部分の幅）の設定
  %number_of_lines=30, % 行数の指定
  jlreq_warnings , %日本語組版処理の要件に反する設定が行われた場合に警告
  %sidenote_length={4zw}, %sidenoteの脚注幅設定
]{jlreq} %今一番モダンな日本語クラスファイル

% \PassOptionsToPackage{hyphens}{url} % これいるかは怪しい
\usepackage{luatexja} % LuaLaTeXに移行
\usepackage{subfiles} % 大規模な文章を分割して記述して、統合するためのパッケージ
\usepackage{afterpage} % 次のセクションへ図や表が流れていかないように改ページ
\usepackage{fancyhdr} % 柱とノンブルの制御
\usepackage{setspace} % 行間設定用パッケージ
\usepackage{nextpage} % \cleartooddpage, \cleartoevenpageを有効に

\usepackage{grffile} %ファイル名にドットやスペースが入っていても許容できるようにする。
\usepackage[dvipsnames]{xcolor} % 色関連
\usepackage{graphicx, colorinfo} % 図関連
\usepackage{tikz} %tikZ環境
\usepackage{float} % 画像や表を指定した場所に表示する[H]が使える
\usepackage{wrapfig} % 図の回り込み表示が可能

\usepackage{tabularx} % 表の幅を指定できる

%\usepackage{amsmath,amssymb} % 数式関連
\usepackage{mathtools} % amsmathの拡張
\usepackage{latexsym} % 数学用記号拡張

\usepackage{newtxmath} %lxfontsなど可 数式フォントについて
\usepackage{textcomp} % 特殊文字
%\usepackage{mathcomp} % 数学用フォント

\usepackage{luatexja-otf} % LuaLaTeXにおけるOpen Type Fontの有効化
\usepackage{luatexja-ruby} % ルビを振る \ruby{漢字}{ふりがな}

\usepackage[stable]{footmisc} % 脚注表示形式の制御
\usepackage[final]{pdfpages} %pdfを挿入することが可能
\usepackage{pdfoverlay}

\usepackage{tcolorbox} % テキストのコラムボックスを作成したりいろいろ
\tcbuselibrary{raster,skins,breakable}

\usepackage{minted} % ソースコード表示の用パッケージ
% \usepackage{listings} % \lstlistingなどコードの掲載に必要

%\usepackage[hyphens]{xurl} % URLを表示するためのパッケージ、ハイフンでの改行を許可

\usepackage[
  luatex,
  pdfencoding=auto,
  unicode,
  hidelinks,
  colorlinks=true,
  linkcolor=darkgray, 
  citecolor=darkgray,
  urlcolor=Blue, 
  hyperfootnotes=false
  ]{hyperref}%urlやハイパーリンクを可能にする。colorlinks=true,allcolors=blueでリンク部分が青くなる。
\urlstyle{same} % URLの表示形式を本文と同じにする
\usepackage{bookmark} % しおりつきPDFを作る
\usepackage[T1]{fontenc} % フォントエンコーディングをT1にする。
\usepackage{lmodern} % Latin Modern フォントを使う
\usepackage[delux, haranoaji]{luatexja-preset} % フォントの指定
\setmainjfont{Noto Sans JP}[BoldFont=Noto Sans JP Bold] %日本語入力でのフォントを「Noto Sans JP」（太字：「Noto Sans JP Bold）にする。
\setmainfont{Noto Sans JP}[BoldFont=Noto Sans JP Bold]%英語入力でのフォントを「Noto Sans JP」（太字：「NOto Sans JP Bold）にする。
\usepackage{emoji}
\setemojifont{TwemojiMozilla} % または\setemojifont{EmojiOneMozilla}
\newjfontfamily{\jMplus}[ % {\jMplus hoge}で指定した箇所(hoge)のみを「M PLUS 2」フォントで出力させる命令
  YokoFeatures={JFM=jlreq},
  TateFeatures={JFM=jlreqv},
]{M PLUS 2}
\newfontfamily{\Mplus}{M PLUS 2}
% \newjfontfamily{\jCine}[ % {\jCine hoge}で指定した箇所(hoge)のみを「しねきゃぷしょん」フォントで出力させる命令
%   YokoFeatures={JFM=jlreq},
%   TateFeatures={JFM=jlreqv},
% ]{cinecaption}

%%% OPTIONAL PACKAGE %%%
% \usepackage{bm} % ベクトル
% 
\usepackage{siunitx} % SI単位系入力のマクロ
% \usepackage{physics2} % 物理計算式の簡便化マクロ physics -> physics2 https://qiita.com/Yarakashi_Kikohshi/items/131e2324f401c3effb84
% \usepackage{circuitikz} % 回路系の描画用マクロ
% 
% \usepackage[version=4]{mhchem}
% 
% \usepackage{ulem} % 下線・波線・打ち消し線をつける
% 
% \usepackage{framed} % 囲み付き文章を出すためのパッケージ
% \usepackage{type1cm} % 文字の大きさを自由に変えるためのパッケージ
% \usepackage{caption} % キャプションとサブキャプションのパッケージ
% \usepackage{subcaption}
% \usepackage{enumitem} %箇条書きのカスタマイズが可能
% \usepackage{enumerate} % 高機能番号付き箇条書きのパッケージ
% \usepackage{paralist} % インラインリストのパッケージ
%%%%%%%%%%%%%%%%%%%%%%%%%

\parindent = 1\zw % 段落ごとに1文字分(全角スペース)のインデント
\NewPageStyle{astrobook}{ % 生TeX原稿での柱とノンブルの設定
  yoko,
  odd_running_head=_section,
  even_running_head=_chapter,
  running_head_position=top-fore-edge,
  nombre_position=bottom-fore-edge
}
\pagestyle{astrobook} % 上の設定を適用
\newcommand{\article}[4][-]{ % PDF原稿の読込みマクロの設定
    \markboth{#2}{#3}
    \phantomsection % hyperrefおよびPDFのブックマークに表示させる
    \addcontentsline{toc}{chapter}{#2}% 個々のタイトルなどは目次ではchapter扱い
    \includepdf[pages=#1, noautoscale=true, fitpaper, pagecommand={}]{#4}
}
% \article{題名}{著者}{ファイル名} で使う

%%%   別行見出し(setionとか)の出力設定（jlreq仕様）  %%%
\SaveHeading{chapter}{\restorechapter}
\ModifyHeading{chapter}{
  font={\Large\bfseries\jMplus\Mplus},
  %label_format={\includegraphics[width=2\zw]{small_star2_skyblue.png}\raisebox{0.5\zw}{\hspace{-1.3\zw}\thechapter}},
  format={
    \centering
    {\color[gray]{0}#1}{#2}
  },
  before_space=1.5ex,
  after_space=1.5ex,
}
\SaveHeading{section}{\restoresection} % \sectionの中身を\restoresectionに待避．

\RenewBlockHeading{section}{1}{
font={\fontsize{10pt}{0}\bfseries\jMplus\Mplus},
format={%
  \begin{tikzpicture}
    \useasboundingbox (0,0) rectangle (0,0);
    \fill[black!50] (0,-4pt) rectangle (8pt, 12pt);
    \draw[black!50,line width=1pt] (0,-4pt) -- (\linewidth,-4pt);
  \end{tikzpicture}%
  \hspace{1\zw}#1#2\hspace{1\zw}#3},
after_label_space=1\zw ,
before_space=2.5ex,
after_space=1.5ex,
} % \sectionを新しく定義する．
%\restoresection % \sectionの中身を元に戻す．

\SaveHeading{subsection}{\restoresubsection} % \subsectionの中身を\restoresubsectionに待避．
\RenewBlockHeading{subsection}{1}{
font={\fontsize{10pt}{0}\bfseries\jMplus\Mplus},
format={%
  \begin{tikzpicture}
    \useasboundingbox (0,0) rectangle (0,0);
    \draw[black!50,line width=1pt] (0,-4pt) -- (.5\linewidth,-4pt);
  \end{tikzpicture}%
  #1#2},
after_label_space=1\zw ,
before_space=2.5ex,
after_space=1.5ex,
} % \subsectionを新しく定義する．

\SaveHeading{subsubsection}{\restoresubsubsection} % \subsectionの中身を\restoresubsectionに待避．
\RenewBlockHeading{subsubsection}{1}{
font={\fontsize{10pt}{0}\bfseries},
format={#1#2},
after_label_space=1\zw ,
before_space=2.5ex,
after_space=1.5ex,
} % \subsubsectionを新しく定義する．
%\restoresubsubsection % \subsubsectionの中身を元に戻す．

\SetBlockHeadingSpaces{ %別行見出しが連続するときの行間の制御
  {_part{lines=3,before_lines=1},_section{lines=2},_subsection{lines=2}}
  [lines=3]{_section,16pt,_subsection,8pt}
}

% 図表番号を参照するときに図\ref{hoge}とかしなくて言いようにするマクロ
\newcommand{\figref}[1]{図\ref{fig:#1}}
\newcommand{\tabref}[1]{表\ref{tab:#1}}
\renewcommand{\eqref}[1]{式(\ref{eq:#1})}
