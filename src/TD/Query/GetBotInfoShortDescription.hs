{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetBotInfoShortDescription where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the text shown on a bot's profile page and sent together with the link when users share the bot in the given language. Can be called only if userTypeBot.can_be_edited == true
data GetBotInfoShortDescription = GetBotInfoShortDescription
  { -- | A two-letter ISO 639-1 language code or an empty string
    language_code :: Maybe String,
    -- | Identifier of the target bot
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetBotInfoShortDescription where
  show
    GetBotInfoShortDescription
      { language_code = language_code_,
        bot_user_id = bot_user_id_
      } =
      "GetBotInfoShortDescription"
        ++ U.cc
          [ U.p "language_code" language_code_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON GetBotInfoShortDescription where
  toJSON
    GetBotInfoShortDescription
      { language_code = language_code_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "getBotInfoShortDescription",
          "language_code" A..= language_code_,
          "bot_user_id" A..= bot_user_id_
        ]
