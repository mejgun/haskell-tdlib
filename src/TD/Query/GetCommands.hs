{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetCommands where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BotCommandScope as BotCommandScope
import qualified Utils as U

-- |
-- Returns the list of commands supported by the bot for the given user scope and language; for bots only
data GetCommands = GetCommands
  { -- | A two-letter ISO 639-1 language code or an empty string
    language_code :: Maybe String,
    -- | The scope to which the commands are relevant; pass null to get commands in the default bot command scope
    scope :: Maybe BotCommandScope.BotCommandScope
  }
  deriving (Eq)

instance Show GetCommands where
  show
    GetCommands
      { language_code = language_code_,
        scope = scope_
      } =
      "GetCommands"
        ++ U.cc
          [ U.p "language_code" language_code_,
            U.p "scope" scope_
          ]

instance T.ToJSON GetCommands where
  toJSON
    GetCommands
      { language_code = language_code_,
        scope = scope_
      } =
      A.object
        [ "@type" A..= T.String "getCommands",
          "language_code" A..= language_code_,
          "scope" A..= scope_
        ]
