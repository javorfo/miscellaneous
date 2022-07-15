## Neovim Configuration for Java, Kotlin, Lua, VimScript...
- Java LSP
- Kotlin LSP
- VimScript LSP
- Lua LSP
- Folder explorer
- File and String search
- Autocompletion
- Wildfly, Tomcat, JBoss plugin
- Java Main Runner
- Dev tools: comments, bracket completion, etc
- Status Line with Git info
- Debugger configuration (Java)

## Vim Plug installation
- Install [Vim Plug](https://github.com/junegunn/vim-plug)

## Install in Linux
`Ubuntu/Debian`
```console
[user@host ~]$ sudo apt install xclip ripgrep fzf ctags nodejs npm
```
`Arch Linux`
```console
[user@host ~]$ sudo pacman -S install xclip ripgrep fzf ctags nodejs npm
```
`Fedora/CentOS/RHEL`
```console
[user@host ~]$ sudo dnf xclip ripgrep fzf ctags nodejs npm
```

## Clone
```console
[user@host ~]$ git clone https://github.com/javorfo/miscellaneous.git
[user@host ~]$ cp -r miscellaneous/nvim .config/
```

## Open init.vim and wait for plugin installation
```console
[user@host ~]$ nvim ~/.config/nvim/init +PlugInstall
```
</br>

# JAVA
- Download the latest version of [JDTLS server](https://download.eclipse.org/jdtls/milestones/?d)
- Decompress the downloaded file in any place you want (root folder preferable)
- Setup line 15 and 16 in [ftplugin/java.lua](https://github.com/javorfo/miscellaneous/nvim/blob/master/ftplugin/java.lua) with the path of `jdtls`:
```lua
'-jar', '/path/to/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
'-configuration', '/path/to/jdtls/config_linux', 
```
- Setup workspace, line 17 in [ftplugin/java.lua](https://github.com/javorfo/miscellaneous/nvim/blob/master/ftplugin/java.lua):
```lua
'-data', '/path/to/workspace'
```
- If you use Lombok. You have to download [lombok.jar](https://projectlombok.org/download). Place it in somewhere in your filesystem and set it up in line 10 from [ftplugin/java.lua](https://github.com/javorfo/miscellaneous/nvim/blob/master/ftplugin/java.lua):
```lua
'-javaagent:/usr/local/share/lombok/lombok.jar',
```

## Java Debug setup
- Download [Java Debug Server](https://github.com/microsoft/java-debug) and build it:
```console
[user@host ~]$ ./mvnw clean install
```
- Once built it, setup line 24 in [ftplugin/java.lua](https://github.com/javorfo/miscellaneous/nvim/blob/master/ftplugin/java.lua) with the path of `java-debug`:
```lua
init_options = {
    bundles = {
		vim.fn.glob("/path/to/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
	}
}
```
- Configure your app host and port where is going to expose debug session. [Here](https://github.com/javorfo/miscellaneous/nvim/blob/master/ftplugin/java.lua) the example with 8787 (JBoss default) but you can change it:
```lua
dap.configurations.java = {
  {
    type = 'java';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 8787;
  },
}
```
- To use it start your app and start debugging executing in command line mode `:DapContinue`

</br>

# KOTLIN
- Download [Kotlin Language Server](https://github.com/fwcd/kotlin-language-server)
- Decompress and execute inside **kotlin-language-server-main** to generate the server:
```console
[user@host ~]$ ./gradlew :server:installDist
```
- Set the path in **init.vim**
```lua
require'lspconfig'.kotlin_language_server.setup{
	cmd = {
		"/path/to/kotlin-language-server-main/server/build/install/server/bin/kotlin-language-server"
	}
}
```

</br>

# VIMSCRIPT
`Linux`
```console
[user@host ~]$ sudo npm install -g vim-language-server
```

</br>

# LUA
- Configure [Lua Server](https://github.com/sumneko/lua-language-server/wiki/Build-and-Run)
