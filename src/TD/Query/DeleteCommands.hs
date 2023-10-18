module TD.Query.DeleteCommands
  (DeleteCommands(..)
  , defaultDeleteCommands
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BotCommandScope as BotCommandScope
import qualified Data.Text as T

-- | Deletes commands supported by the bot for the given user scope and language; for bots only. Returns 'TD.Data.Ok.Ok'
data DeleteCommands
  = DeleteCommands
    { scope         :: Maybe BotCommandScope.BotCommandScope -- ^ The scope to which the commands are relevant; pass null to delete commands in the default bot command scope
    , language_code :: Maybe T.Text                          -- ^ A two-letter ISO 639-1 language code or an empty string
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteCommands where
  shortShow
    DeleteCommands
      { scope         = scope_
      , language_code = language_code_
      }
        = "DeleteCommands"
          ++ I.cc
          [ "scope"         `I.p` scope_
          , "language_code" `I.p` language_code_
          ]

instance AT.ToJSON DeleteCommands where
  toJSON
    DeleteCommands
      { scope         = scope_
      , language_code = language_code_
      }
        = A.object
          [ "@type"         A..= AT.String "deleteCommands"
          , "scope"         A..= scope_
          , "language_code" A..= language_code_
          ]

defaultDeleteCommands :: DeleteCommands
defaultDeleteCommands =
  DeleteCommands
    { scope         = Nothing
    , language_code = Nothing
    }

