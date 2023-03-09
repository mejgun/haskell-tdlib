{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetBotInfoShortDescription where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the text shown on the bot's profile page and sent together with the link when users share the bot in the given language; bots only
data GetBotInfoShortDescription = GetBotInfoShortDescription
  { -- | A two-letter ISO 639-1 language code or an empty string
    language_code :: Maybe String
  }
  deriving (Eq)

instance Show GetBotInfoShortDescription where
  show
    GetBotInfoShortDescription
      { language_code = language_code_
      } =
      "GetBotInfoShortDescription"
        ++ U.cc
          [ U.p "language_code" language_code_
          ]

instance T.ToJSON GetBotInfoShortDescription where
  toJSON
    GetBotInfoShortDescription
      { language_code = language_code_
      } =
      A.object
        [ "@type" A..= T.String "getBotInfoShortDescription",
          "language_code" A..= language_code_
        ]
