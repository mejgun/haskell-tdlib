{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CanBotSendMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks whether the specified bot can send messages to the user. Returns a 404 error if can't and the access can be granted by call to allowBotToSendMessages @bot_user_id Identifier of the target bot
data CanBotSendMessages = CanBotSendMessages
  { -- |
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show CanBotSendMessages where
  show
    CanBotSendMessages
      { bot_user_id = bot_user_id_
      } =
      "CanBotSendMessages"
        ++ U.cc
          [ U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON CanBotSendMessages where
  toJSON
    CanBotSendMessages
      { bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "canBotSendMessages",
          "bot_user_id" A..= bot_user_id_
        ]
