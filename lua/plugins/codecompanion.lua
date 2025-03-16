return {
  'olimorris/codecompanion.nvim',
  event = { 'InsertEnter', 'CmdlineEnter' },
  config = true,
  opts = {
    adapters = {
      copilot = function()
        return require('codecompanion.adapters').extend('copilot', {
          schema = {
            model = {
              default = 'claude-3.7-sonnet',
            },
          },
        })
      end,
    },
    strategies = {
      --NOTE: Change the adapter as required
      chat = { adapter = 'copilot' },
      inline = { adapter = 'copilot' },
      agent = { adapter = 'copilot' },
    },
    display = {
      action_palette = {
        width = 95,
        height = 10,
        prompt = 'Prompt ', -- Prompt used for interactive LLM calls
        provider = 'telescope', -- default|telescope|mini_pick
        opts = {
          show_default_actions = true, -- Show the default actions in the action palette?
          show_default_prompt_library = true, -- Show the default prompt library in the action palette?
        },
      },
    },
    strategies = {
      chat = {
        slash_commands = {
          ['file'] = {
            -- Location to the slash command in CodeCompanion
            callback = 'strategies.chat.slash_commands.file',
            description = 'Select a file using Telescope',
            opts = {
              provider = 'telescope', -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
              contains_code = true,
            },
          },
        },
      },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
