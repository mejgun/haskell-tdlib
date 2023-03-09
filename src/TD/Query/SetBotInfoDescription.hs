{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetBotInfoDescription where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets the text shown in the chat with the bot if the chat is empty; bots only
data SetBotInfoDescription = SetBotInfoDescription
  { -- |
    description :: Maybe String,
    -- | A two-letter ISO 639-1 language code. If empty, the description will be shown to all users, for which language there are no dedicated description
    language_code :: Maybe String
  }
  deriving (Eq)

instance Show SetBotInfoDescription where
  show
    SetBotInfoDescription
      { description = description_,
        language_code = language_code_
      } =
      "SetBotInfoDescription"
        ++ U.cc
          [ U.p "description" description_,
            U.p "language_code" language_code_
          ]

instance T.ToJSON SetBotInfoDescription where
  toJSON
    SetBotInfoDescription
      { description = description_,
        language_code = language_code_
      } =
      A.object
        [ "@type" A..= T.String "setBotInfoDescription",
          "description" A..= description_,
          "language_code" A..= language_code_
        ]
