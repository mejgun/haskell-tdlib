{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetCommands where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BotCommand as BotCommand
import qualified TD.Data.BotCommandScope as BotCommandScope
import qualified Utils as U

-- |
-- Sets the list of commands supported by the bot for the given user scope and language; for bots only
data SetCommands = SetCommands
  { -- | List of the bot's commands
    commands :: Maybe [BotCommand.BotCommand],
    -- | A two-letter ISO 639-1 language code. If empty, the commands will be applied to all users from the given scope, for which language there are no dedicated commands
    language_code :: Maybe String,
    -- | The scope to which the commands are relevant; pass null to change commands in the default bot command scope
    scope :: Maybe BotCommandScope.BotCommandScope
  }
  deriving (Eq)

instance Show SetCommands where
  show
    SetCommands
      { commands = commands_,
        language_code = language_code_,
        scope = scope_
      } =
      "SetCommands"
        ++ U.cc
          [ U.p "commands" commands_,
            U.p "language_code" language_code_,
            U.p "scope" scope_
          ]

instance T.ToJSON SetCommands where
  toJSON
    SetCommands
      { commands = commands_,
        language_code = language_code_,
        scope = scope_
      } =
      A.object
        [ "@type" A..= T.String "setCommands",
          "commands" A..= commands_,
          "language_code" A..= language_code_,
          "scope" A..= scope_
        ]
