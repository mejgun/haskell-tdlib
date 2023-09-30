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
  { -- | Pass true to create a supergroup for importing messages using importMessages
    for_import :: Maybe Bool,
    -- | Message auto-delete time value, in seconds; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
    message_auto_delete_time :: Maybe Int,
    -- | Chat location if a location-based supergroup is being created; pass null to create an ordinary supergroup chat
    location :: Maybe ChatLocation.ChatLocation,
    -- |
    description :: Maybe String,
    -- | Pass true to create a channel chat; ignored if a forum is created
    is_channel :: Maybe Bool,
    -- | Pass true to create a forum supergroup chat
    is_forum :: Maybe Bool,
    -- | Title of the new chat; 1-128 characters
    title :: Maybe String
  }
  deriving (Eq)

instance Show CreateNewSupergroupChat where
  show
    CreateNewSupergroupChat
      { for_import = for_import_,
        message_auto_delete_time = message_auto_delete_time_,
        location = location_,
        description = description_,
        is_channel = is_channel_,
        is_forum = is_forum_,
        title = title_
      } =
      "CreateNewSupergroupChat"
        ++ U.cc
          [ U.p "for_import" for_import_,
            U.p "message_auto_delete_time" message_auto_delete_time_,
            U.p "location" location_,
            U.p "description" description_,
            U.p "is_channel" is_channel_,
            U.p "is_forum" is_forum_,
            U.p "title" title_
          ]

instance T.ToJSON CreateNewSupergroupChat where
  toJSON
    CreateNewSupergroupChat
      { for_import = for_import_,
        message_auto_delete_time = message_auto_delete_time_,
        location = location_,
        description = description_,
        is_channel = is_channel_,
        is_forum = is_forum_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "createNewSupergroupChat",
          "for_import" A..= for_import_,
          "message_auto_delete_time" A..= message_auto_delete_time_,
          "location" A..= location_,
          "description" A..= description_,
          "is_channel" A..= is_channel_,
          "is_forum" A..= is_forum_,
          "title" A..= title_
        ]
