{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AllowBotToSendMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Allows the specified bot to send messages to the user @bot_user_id Identifier of the target bot
data AllowBotToSendMessages = AllowBotToSendMessages
  { -- |
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show AllowBotToSendMessages where
  show
    AllowBotToSendMessages
      { bot_user_id = bot_user_id_
      } =
      "AllowBotToSendMessages"
        ++ U.cc
          [ U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON AllowBotToSendMessages where
  toJSON
    AllowBotToSendMessages
      { bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "allowBotToSendMessages",
          "bot_user_id" A..= bot_user_id_
        ]
