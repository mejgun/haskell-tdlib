{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CreatePrivateChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an existing chat corresponding to a given user @user_id User identifier @force Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
data CreatePrivateChat = CreatePrivateChat
  { -- |
    force :: Maybe Bool,
    -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show CreatePrivateChat where
  show
    CreatePrivateChat
      { force = force,
        user_id = user_id
      } =
      "CreatePrivateChat"
        ++ U.cc
          [ U.p "force" force,
            U.p "user_id" user_id
          ]

instance T.ToJSON CreatePrivateChat where
  toJSON
    CreatePrivateChat
      { force = force,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "createPrivateChat",
          "force" A..= force,
          "user_id" A..= user_id
        ]
