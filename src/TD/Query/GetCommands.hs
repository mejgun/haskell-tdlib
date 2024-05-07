module TD.Query.GetCommands
  (GetCommands(..)
  , defaultGetCommands
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BotCommandScope as BotCommandScope
import qualified Data.Text as T

-- | Returns the list of commands supported by the bot for the given user scope and language; for bots only. Returns 'TD.Data.BotCommands.BotCommands'
data GetCommands
  = GetCommands
    { scope         :: Maybe BotCommandScope.BotCommandScope -- ^ The scope to which the commands are relevant; pass null to get commands in the default bot command scope
    , language_code :: Maybe T.Text                          -- ^ A two-letter ISO 639-1 language code or an empty string
    }
  deriving (Eq, Show)

instance I.ShortShow GetCommands where
  shortShow
    GetCommands
      { scope         = scope_
      , language_code = language_code_
      }
        = "GetCommands"
          ++ I.cc
          [ "scope"         `I.p` scope_
          , "language_code" `I.p` language_code_
          ]

instance AT.ToJSON GetCommands where
  toJSON
    GetCommands
      { scope         = scope_
      , language_code = language_code_
      }
        = A.object
          [ "@type"         A..= AT.String "getCommands"
          , "scope"         A..= scope_
          , "language_code" A..= language_code_
          ]

defaultGetCommands :: GetCommands
defaultGetCommands =
  GetCommands
    { scope         = Nothing
    , language_code = Nothing
    }

