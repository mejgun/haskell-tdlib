{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetBotInfoShortDescription where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets the text shown on a bot's profile page and sent together with the link when users share the bot. Can be called only if userTypeBot.can_be_edited == true
data SetBotInfoShortDescription = SetBotInfoShortDescription
  { -- | New bot's short description on the specified language
    short_description :: Maybe String,
    -- | A two-letter ISO 639-1 language code. If empty, the short description will be shown to all users, for which language there are no dedicated description
    language_code :: Maybe String,
    -- | Identifier of the target bot
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetBotInfoShortDescription where
  show
    SetBotInfoShortDescription
      { short_description = short_description_,
        language_code = language_code_,
        bot_user_id = bot_user_id_
      } =
      "SetBotInfoShortDescription"
        ++ U.cc
          [ U.p "short_description" short_description_,
            U.p "language_code" language_code_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON SetBotInfoShortDescription where
  toJSON
    SetBotInfoShortDescription
      { short_description = short_description_,
        language_code = language_code_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "setBotInfoShortDescription",
          "short_description" A..= short_description_,
          "language_code" A..= language_code_,
          "bot_user_id" A..= bot_user_id_
        ]
