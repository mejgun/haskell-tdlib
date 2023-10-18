module TD.Query.SetCommands
  (SetCommands(..)
  , defaultSetCommands
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BotCommandScope as BotCommandScope
import qualified Data.Text as T
import qualified TD.Data.BotCommand as BotCommand

-- | Sets the list of commands supported by the bot for the given user scope and language; for bots only. Returns 'TD.Data.Ok.Ok'
data SetCommands
  = SetCommands
    { scope         :: Maybe BotCommandScope.BotCommandScope -- ^ The scope to which the commands are relevant; pass null to change commands in the default bot command scope
    , language_code :: Maybe T.Text                          -- ^ A two-letter ISO 639-1 language code. If empty, the commands will be applied to all users from the given scope, for which language there are no dedicated commands
    , commands      :: Maybe [BotCommand.BotCommand]         -- ^ List of the bot's commands
    }
  deriving (Eq, Show)

instance I.ShortShow SetCommands where
  shortShow
    SetCommands
      { scope         = scope_
      , language_code = language_code_
      , commands      = commands_
      }
        = "SetCommands"
          ++ I.cc
          [ "scope"         `I.p` scope_
          , "language_code" `I.p` language_code_
          , "commands"      `I.p` commands_
          ]

instance AT.ToJSON SetCommands where
  toJSON
    SetCommands
      { scope         = scope_
      , language_code = language_code_
      , commands      = commands_
      }
        = A.object
          [ "@type"         A..= AT.String "setCommands"
          , "scope"         A..= scope_
          , "language_code" A..= language_code_
          , "commands"      A..= commands_
          ]

defaultSetCommands :: SetCommands
defaultSetCommands =
  SetCommands
    { scope         = Nothing
    , language_code = Nothing
    , commands      = Nothing
    }

