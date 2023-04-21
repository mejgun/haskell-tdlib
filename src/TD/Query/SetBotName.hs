{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetBotName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets the name of a bot. Can be called only if userTypeBot.can_be_edited == true
data SetBotName = SetBotName
  { -- | New bot's name on the specified language; 0-64 characters; must be non-empty if language code is empty
    name :: Maybe String,
    -- | A two-letter ISO 639-1 language code. If empty, the description will be shown to all users, for which language there are no dedicated description
    language_code :: Maybe String,
    -- | Identifier of the target bot
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetBotName where
  show
    SetBotName
      { name = name_,
        language_code = language_code_,
        bot_user_id = bot_user_id_
      } =
      "SetBotName"
        ++ U.cc
          [ U.p "name" name_,
            U.p "language_code" language_code_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON SetBotName where
  toJSON
    SetBotName
      { name = name_,
        language_code = language_code_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "setBotName",
          "name" A..= name_,
          "language_code" A..= language_code_,
          "bot_user_id" A..= bot_user_id_
        ]
