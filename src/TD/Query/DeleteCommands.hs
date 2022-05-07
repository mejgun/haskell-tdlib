{-# LANGUAGE OverloadedStrings #-}

module TD.Query.DeleteCommands where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BotCommandScope as BotCommandScope
import qualified Utils as U

-- |
-- Deletes commands supported by the bot for the given user scope and language; for bots only
data DeleteCommands = DeleteCommands
  { -- | A two-letter ISO 639-1 language code or an empty string
    language_code :: Maybe String,
    -- | The scope to which the commands are relevant; pass null to delete commands in the default bot command scope
    scope :: Maybe BotCommandScope.BotCommandScope
  }
  deriving (Eq)

instance Show DeleteCommands where
  show
    DeleteCommands
      { language_code = language_code,
        scope = scope
      } =
      "DeleteCommands"
        ++ U.cc
          [ U.p "language_code" language_code,
            U.p "scope" scope
          ]

instance T.ToJSON DeleteCommands where
  toJSON
    DeleteCommands
      { language_code = language_code,
        scope = scope
      } =
      A.object
        [ "@type" A..= T.String "deleteCommands",
          "language_code" A..= language_code,
          "scope" A..= scope
        ]
