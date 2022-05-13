{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateNewSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Creates a new secret chat. Returns the newly created chat @user_id Identifier of the target user
data CreateNewSecretChat = CreateNewSecretChat
  { -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show CreateNewSecretChat where
  show
    CreateNewSecretChat
      { user_id = user_id_
      } =
      "CreateNewSecretChat"
        ++ U.cc
          [ U.p "user_id" user_id_
          ]

instance T.ToJSON CreateNewSecretChat where
  toJSON
    CreateNewSecretChat
      { user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "createNewSecretChat",
          "user_id" A..= user_id_
        ]
