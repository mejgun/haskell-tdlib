{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetBotInfoShortDescription where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets the text shown on the bot's profile page and sent together with the link when users share the bot; bots only
data SetBotInfoShortDescription = SetBotInfoShortDescription
  { -- | New bot's short description on the specified language
    short_description :: Maybe String,
    -- | A two-letter ISO 639-1 language code. If empty, the short description will be shown to all users, for which language there are no dedicated description
    language_code :: Maybe String
  }
  deriving (Eq)

instance Show SetBotInfoShortDescription where
  show
    SetBotInfoShortDescription
      { short_description = short_description_,
        language_code = language_code_
      } =
      "SetBotInfoShortDescription"
        ++ U.cc
          [ U.p "short_description" short_description_,
            U.p "language_code" language_code_
          ]

instance T.ToJSON SetBotInfoShortDescription where
  toJSON
    SetBotInfoShortDescription
      { short_description = short_description_,
        language_code = language_code_
      } =
      A.object
        [ "@type" A..= T.String "setBotInfoShortDescription",
          "short_description" A..= short_description_,
          "language_code" A..= language_code_
        ]
