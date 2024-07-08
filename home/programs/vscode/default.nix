{pkgs, ...}:

{
    programs.vscode = {
      enable = true;
      extensions = with pkgs; [
        vscode-extensions.ms-python.python
        vscode-extensions.ms-azuretools.vscode-docker
        vscode-extensions.golang.go
        vscode-extensions.rust-lang.rust-analyzer
        vscode-extensions.christian-kohler.path-intellisense
        vscode-extensions.mskelton.one-dark-theme
        vscode-extensions.pkief.material-product-icons
        vscode-extensions.pkief.material-icon-theme
        vscode-extensions.hashicorp.terraform
        vscode-extensions.ms-kubernetes-tools.vscode-kubernetes-tools
        vscode-extensions.redhat.ansible
        vscode-extensions.hashicorp.hcl
      ];
      userSettings = {
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "terminal.integrated.copyOnSelection" = true;
        "terminal.integrated.cursorStyle" = "line";
        "terminal.integrated.fontFamily" = "Hack Nerd Font";
        "window.titleBarStyle" = "custom";
        "workbench.colorTheme" = "One Dark";
        "workbench.productIconTheme" = "material-product-icons";
        "workbench.iconTheme" = "material-icon-theme";
        "docker.languageserver.formatter.ignoreMultilineInstructions" = true;
        "editor.tokenColorCustomizations" = {
          textMateRules = [
            {
              name = "One Dark italic";
              scope = [
                "comment"
                "entity.other.attribute-name"
                "keyword"
                "markup.underline.link"
                "storage.modifier"
                "storage.type"
                "string.url"
                "variable.language.super"
                "variable.language.this"
              ];
              settings = { fontStyle = "italic"; };
            }
            {
              name = "One Dark italic reset";
              scope = [
                "keyword.operator"
                "keyword.other.type"
                "storage.modifier.import"
                "storage.modifier.package"
                "storage.type.built-in"
                "storage.type.function.arrow"
                "storage.type.generic"
                "storage.type.java"
                "storage.type.primitive"
              ];
              settings = { fontStyle = ""; };
            }
          ];
        };
      };
    };
}