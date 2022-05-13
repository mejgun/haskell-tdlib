{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateNewBasicGroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns the newly created chat @user_ids Identifiers of users to be added to the basic group @title Title of the new basic group; 1-128 characters
data CreateNewBasicGroupChat = CreateNewBasicGroupChat
  { -- |
    title :: Maybe String,
    -- |
    user_ids :: Maybe [Int]
  }
  deriving (Eq)

instance Show CreateNewBasicGroupChat where
  show
    CreateNewBasicGroupChat
      { title = title_,
        user_ids = user_ids_
      } =
      "CreateNewBasicGroupChat"
        ++ U.cc
          [ U.p "title" title_,
            U.p "user_ids" user_ids_
          ]

instance T.ToJSON CreateNewBasicGroupChat where
  toJSON
    CreateNewBasicGroupChat
      { title = title_,
        user_ids = user_ids_
      } =
      A.object
        [ "@type" A..= T.String "createNewBasicGroupChat",
          "title" A..= title_,
          "user_ids" A..= user_ids_
        ]
