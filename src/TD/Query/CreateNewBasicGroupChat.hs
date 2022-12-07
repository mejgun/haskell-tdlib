{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateNewBasicGroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns the newly created chat
data CreateNewBasicGroupChat = CreateNewBasicGroupChat
  { -- | Message TTL value, in seconds; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
    message_ttl :: Maybe Int,
    -- | Title of the new basic group; 1-128 characters
    title :: Maybe String,
    -- | Identifiers of users to be added to the basic group
    user_ids :: Maybe [Int]
  }
  deriving (Eq)

instance Show CreateNewBasicGroupChat where
  show
    CreateNewBasicGroupChat
      { message_ttl = message_ttl_,
        title = title_,
        user_ids = user_ids_
      } =
      "CreateNewBasicGroupChat"
        ++ U.cc
          [ U.p "message_ttl" message_ttl_,
            U.p "title" title_,
            U.p "user_ids" user_ids_
          ]

instance T.ToJSON CreateNewBasicGroupChat where
  toJSON
    CreateNewBasicGroupChat
      { message_ttl = message_ttl_,
        title = title_,
        user_ids = user_ids_
      } =
      A.object
        [ "@type" A..= T.String "createNewBasicGroupChat",
          "message_ttl" A..= message_ttl_,
          "title" A..= title_,
          "user_ids" A..= user_ids_
        ]
