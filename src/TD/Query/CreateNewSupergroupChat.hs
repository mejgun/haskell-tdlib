{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CreateNewSupergroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatLocation as ChatLocation
import qualified Utils as U

-- |
-- Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat
data CreateNewSupergroupChat = CreateNewSupergroupChat
  { -- | Pass true to create a supergroup for importing messages using importMessage
    for_import :: Maybe Bool,
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
      { for_import = for_import,
        location = location,
        description = description,
        is_channel = is_channel,
        title = title
      } =
      "CreateNewSupergroupChat"
        ++ U.cc
          [ U.p "for_import" for_import,
            U.p "location" location,
            U.p "description" description,
            U.p "is_channel" is_channel,
            U.p "title" title
          ]

instance T.ToJSON CreateNewSupergroupChat where
  toJSON
    CreateNewSupergroupChat
      { for_import = for_import,
        location = location,
        description = description,
        is_channel = is_channel,
        title = title
      } =
      A.object
        [ "@type" A..= T.String "createNewSupergroupChat",
          "for_import" A..= for_import,
          "location" A..= location,
          "description" A..= description,
          "is_channel" A..= is_channel,
          "title" A..= title
        ]
