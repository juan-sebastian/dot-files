return {
  {
    "w0rp/ale",
    config = function()
      vim.g.ale_linters = {
        ['python'] = {'flake8'},
        ['javascript'] = {'eslint'},
        ['typescript'] = {'eslint'},
        ['go'] = {'gopls'},
        ['yaml'] = {'yamllint'},
        ['cpp'] = {'clang', 'clangtidy'},
        ['sh'] = {'language_server'},
        ['clojure'] = {'clj-kondo'},
        ['proto'] = {'protoc-gen-lint'},
        ['dockerfile'] = {'hadolint'},
        ['java'] = {'checkstyle'}
      }
      vim.g.ale_echo_msg_format = '[%linter%] %code: %%s'
      vim.g.ale_cpp_clang_options = '-std=c++17 -Wall'
      vim.g.ale_proto_protoc_gen_lint_options = '-I /usr/local/include'
    end,
  },
}
