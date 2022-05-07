{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetChatLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatLocation as ChatLocation
import qualified Utils as U

-- |
-- Changes the location of a chat. Available only for some location-based supergroups, use supergroupFullInfo.can_set_location to check whether the method is allowed to use @chat_id Chat identifier @location New location for the chat; must be valid and not null
data SetChatLocation = SetChatLocation
  { -- |
    location :: Maybe ChatLocation.ChatLocation,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatLocation where
  show
    SetChatLocation
      { location = location,
        chat_id = chat_id
      } =
      "SetChatLocation"
        ++ U.cc
          [ U.p "location" location,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetChatLocation where
  toJSON
    SetChatLocation
      { location = location,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setChatLocation",
          "location" A..= location,
          "chat_id" A..= chat_id
        ]
