{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetBotInfoDescription where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the text shown in the chat with the bot if the chat is empty in the given language; bots only
data GetBotInfoDescription = GetBotInfoDescription
  { -- | A two-letter ISO 639-1 language code or an empty string
    language_code :: Maybe String
  }
  deriving (Eq)

instance Show GetBotInfoDescription where
  show
    GetBotInfoDescription
      { language_code = language_code_
      } =
      "GetBotInfoDescription"
        ++ U.cc
          [ U.p "language_code" language_code_
          ]

instance T.ToJSON GetBotInfoDescription where
  toJSON
    GetBotInfoDescription
      { language_code = language_code_
      } =
      A.object
        [ "@type" A..= T.String "getBotInfoDescription",
          "language_code" A..= language_code_
        ]
