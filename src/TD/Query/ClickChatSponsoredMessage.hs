{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ClickChatSponsoredMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib that the user opened the sponsored chat via the button, the name, the photo, or a mention in the sponsored message
data ClickChatSponsoredMessage = ClickChatSponsoredMessage
  { -- | Identifier of the sponsored message
    message_id :: Maybe Int,
    -- | Chat identifier of the sponsored message
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ClickChatSponsoredMessage where
  show
    ClickChatSponsoredMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "ClickChatSponsoredMessage"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ClickChatSponsoredMessage where
  toJSON
    ClickChatSponsoredMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "clickChatSponsoredMessage",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
