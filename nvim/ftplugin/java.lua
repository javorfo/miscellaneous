local config = {
  capabilities = capabilities,
  cmd = {
    'java', 
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
	  '-javaagent:/usr/local/share/lombok/lombok.jar',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', '/path/to/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', '/path/to/jdtls/config_linux',
    '-data', '/path/to/workspace'
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw'}),
  settings = {
    java = {
    }
  },
  init_options = {
    bundles = {
		vim.fn.glob("/path/to/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
	}
  }
}

config['on_attach'] = function(client, bufnr)
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

local dap = require('dap')

dap.configurations.java = {
  {
    type = 'java';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 8787;
  },
}

require('jdtls').start_or_attach(config)
