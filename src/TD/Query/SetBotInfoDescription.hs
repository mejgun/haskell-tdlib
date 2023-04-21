{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetBotInfoDescription where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets the text shown in the chat with a bot if the chat is empty. Can be called only if userTypeBot.can_be_edited == true
data SetBotInfoDescription = SetBotInfoDescription
  { -- |
    description :: Maybe String,
    -- | A two-letter ISO 639-1 language code. If empty, the description will be shown to all users, for which language there are no dedicated description
    language_code :: Maybe String,
    -- | Identifier of the target bot
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetBotInfoDescription where
  show
    SetBotInfoDescription
      { description = description_,
        language_code = language_code_,
        bot_user_id = bot_user_id_
      } =
      "SetBotInfoDescription"
        ++ U.cc
          [ U.p "description" description_,
            U.p "language_code" language_code_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON SetBotInfoDescription where
  toJSON
    SetBotInfoDescription
      { description = description_,
        language_code = language_code_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "setBotInfoDescription",
          "description" A..= description_,
          "language_code" A..= language_code_,
          "bot_user_id" A..= bot_user_id_
        ]
