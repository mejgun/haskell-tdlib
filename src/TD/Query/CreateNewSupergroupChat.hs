{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateNewSupergroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatLocation as ChatLocation
import qualified Utils as U

-- |
-- Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat
data CreateNewSupergroupChat = CreateNewSupergroupChat
  { -- | Pass true to create a supergroup for importing messages using importMessage
    for_import :: Maybe Bool,
    -- | Message TTL value, in seconds; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
    message_ttl :: Maybe Int,
    -- | Chat location if a location-based supergroup is being created; pass null to create an ordinary supergroup chat
    location :: Maybe ChatLocation.ChatLocation,
    -- |
    description :: Maybe String,
    -- | Pass true to create a channel chat
    is_channel :: Maybe Bool,
    -- | Title of the new chat; 1-128 characters
    title :: Maybe String
  }
  deriving (Eq)

instance Show CreateNewSupergroupChat where
  show
    CreateNewSupergroupChat
      { for_import = for_import_,
        message_ttl = message_ttl_,
        location = location_,
        description = description_,
        is_channel = is_channel_,
        title = title_
      } =
      "CreateNewSupergroupChat"
        ++ U.cc
          [ U.p "for_import" for_import_,
            U.p "message_ttl" message_ttl_,
            U.p "location" location_,
            U.p "description" description_,
            U.p "is_channel" is_channel_,
            U.p "title" title_
          ]

instance T.ToJSON CreateNewSupergroupChat where
  toJSON
    CreateNewSupergroupChat
      { for_import = for_import_,
        message_ttl = message_ttl_,
        location = location_,
        description = description_,
        is_channel = is_channel_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "createNewSupergroupChat",
          "for_import" A..= for_import_,
          "message_ttl" A..= message_ttl_,
          "location" A..= location_,
          "description" A..= description_,
          "is_channel" A..= is_channel_,
          "title" A..= title_
        ]
