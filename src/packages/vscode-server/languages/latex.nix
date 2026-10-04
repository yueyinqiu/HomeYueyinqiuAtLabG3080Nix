{ pkgs, ... }:
let
  tex = "${pkgs.texliveFull}/bin";
in
{
  home-manager-vscode-server-machine-settings.settings = {
    "latex-workshop.latex.tools" = [
      {
        name = "latexmk";
        command = "${tex}/latexmk";
        args = [
          "-synctex=1"
          "-interaction=nonstopmode"
          "-file-line-error"
          "-pdf"
          "-outdir=%OUTDIR%"
          "-auxdir=%AUXDIR%"
          "%DOC%"
        ];
      }
      {
        name = "lualatexmk";
        command = "${tex}/latexmk";
        args = [
          "-synctex=1"
          "-interaction=nonstopmode"
          "-file-line-error"
          "-lualatex"
          "-outdir=%OUTDIR%"
          "-auxdir=%AUXDIR%"
          "%DOC%"
        ];
      }
      {
        name = "xelatexmk";
        command = "${tex}/latexmk";
        args = [
          "-synctex=1"
          "-interaction=nonstopmode"
          "-file-line-error"
          "-xelatex"
          "-outdir=%OUTDIR%"
          "-auxdir=%AUXDIR%"
          "%DOC%"
        ];
      }
      {
        name = "latexmk_rconly";
        command = "${tex}/latexmk";
        args = [ "%DOC%" ];
      }
      {
        name = "pdflatex";
        command = "${tex}/pdflatex";
        args = [
          "-synctex=1"
          "-interaction=nonstopmode"
          "-file-line-error"
          "%DOC%"
        ];
      }
      {
        name = "bibtex";
        command = "${tex}/bibtex";
        args = [ "%DOCFILE%" ];
      }
    ];

    "latex-workshop.latex.recipes" = [
      {
        name = "latexmk";
        tools = [ "latexmk" ];
      }
      {
        name = "latexmk (latexmkrc)";
        tools = [ "latexmk_rconly" ];
      }
      {
        name = "latexmk (lualatex)";
        tools = [ "lualatexmk" ];
      }
      {
        name = "latexmk (xelatex)";
        tools = [ "xelatexmk" ];
      }
      {
        name = "pdflatex -> bibtex -> pdflatex * 2";
        tools = [
          "pdflatex"
          "bibtex"
          "pdflatex"
          "pdflatex"
        ];
      }
    ];

    # 辅助工具
    "latex-workshop.kpsewhich.path" = "${tex}/kpsewhich";
    "latex-workshop.synctex.path" = "${tex}/synctex";
    "latex-workshop.texdoc.path" = "${tex}/texdoc";
    "latex-workshop.texcount.path" = "${tex}/texcount";

    # 清理（clean.method 默认 "command"，即 latexmk -c）
    "latex-workshop.latex.clean.command" = "${tex}/latexmk";

    # 格式化
    "latex-workshop.formatting.latexindent.path" = "${tex}/latexindent";
    "latex-workshop.formatting.tex-fmt.path" = "${pkgs.tex-fmt}/bin/tex-fmt";
    "latex-workshop.formatting.badness.path" = "${pkgs.badness}/bin/badness";

    # 代码检查
    "latex-workshop.linting.chktex.exec.path" = "${tex}/chktex";
    "latex-workshop.linting.lacheck.exec.path" = "${tex}/lacheck";
    "latex-workshop.linting.badness.exec.path" = "${pkgs.badness}/bin/badness";
  };
}
