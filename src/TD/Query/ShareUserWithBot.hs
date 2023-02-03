{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ShareUserWithBot where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Shares a user after pressing a keyboardButtonTypeRequestUser button with the bot
data ShareUserWithBot = ShareUserWithBot
  { -- | Pass true to check that the user can be shared by the button instead of actually sharing them
    only_check :: Maybe Bool,
    -- | Identifier of the shared user
    shared_user_id :: Maybe Int,
    -- | Identifier of the button
    button_id :: Maybe Int,
    -- | Identifier of the message with the button
    message_id :: Maybe Int,
    -- | Identifier of the chat with the bot
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ShareUserWithBot where
  show
    ShareUserWithBot
      { only_check = only_check_,
        shared_user_id = shared_user_id_,
        button_id = button_id_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "ShareUserWithBot"
        ++ U.cc
          [ U.p "only_check" only_check_,
            U.p "shared_user_id" shared_user_id_,
            U.p "button_id" button_id_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ShareUserWithBot where
  toJSON
    ShareUserWithBot
      { only_check = only_check_,
        shared_user_id = shared_user_id_,
        button_id = button_id_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "shareUserWithBot",
          "only_check" A..= only_check_,
          "shared_user_id" A..= shared_user_id_,
          "button_id" A..= button_id_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
