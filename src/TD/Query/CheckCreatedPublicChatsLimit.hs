{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CheckCreatedPublicChatsLimit where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.PublicChatType as PublicChatType
import qualified Utils as U

-- |
-- Checks whether the maximum number of owned public chats has been reached. Returns corresponding error if the limit was reached @type Type of the public chats, for which to check the limit
data CheckCreatedPublicChatsLimit = CheckCreatedPublicChatsLimit
  { -- |
    _type :: Maybe PublicChatType.PublicChatType
  }
  deriving (Eq)

instance Show CheckCreatedPublicChatsLimit where
  show
    CheckCreatedPublicChatsLimit
      { _type = _type
      } =
      "CheckCreatedPublicChatsLimit"
        ++ U.cc
          [ U.p "_type" _type
          ]

instance T.ToJSON CheckCreatedPublicChatsLimit where
  toJSON
    CheckCreatedPublicChatsLimit
      { _type = _type
      } =
      A.object
        [ "@type" A..= T.String "checkCreatedPublicChatsLimit",
          "type" A..= _type
        ]
