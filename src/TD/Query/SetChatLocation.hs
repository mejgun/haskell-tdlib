{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatLocation as ChatLocation
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
      { location = location_,
        chat_id = chat_id_
      } =
      "SetChatLocation"
        ++ U.cc
          [ U.p "location" location_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatLocation where
  toJSON
    SetChatLocation
      { location = location_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatLocation",
          "location" A..= location_,
          "chat_id" A..= chat_id_
        ]
