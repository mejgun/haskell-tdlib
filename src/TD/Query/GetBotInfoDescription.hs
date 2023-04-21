{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetBotInfoDescription where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the text shown in the chat with a bot if the chat is empty in the given language. Can be called only if userTypeBot.can_be_edited == true
data GetBotInfoDescription = GetBotInfoDescription
  { -- | A two-letter ISO 639-1 language code or an empty string
    language_code :: Maybe String,
    -- | Identifier of the target bot
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetBotInfoDescription where
  show
    GetBotInfoDescription
      { language_code = language_code_,
        bot_user_id = bot_user_id_
      } =
      "GetBotInfoDescription"
        ++ U.cc
          [ U.p "language_code" language_code_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON GetBotInfoDescription where
  toJSON
    GetBotInfoDescription
      { language_code = language_code_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "getBotInfoDescription",
          "language_code" A..= language_code_,
          "bot_user_id" A..= bot_user_id_
        ]
