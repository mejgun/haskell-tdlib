{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetCreatedPublicChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PublicChatType as PublicChatType
import qualified Utils as U

-- |
-- Returns a list of public chats of the specified type, owned by the user @type Type of the public chats to return
data GetCreatedPublicChats = GetCreatedPublicChats
  { -- |
    _type :: Maybe PublicChatType.PublicChatType
  }
  deriving (Eq)

instance Show GetCreatedPublicChats where
  show
    GetCreatedPublicChats
      { _type = _type
      } =
      "GetCreatedPublicChats"
        ++ U.cc
          [ U.p "_type" _type
          ]

instance T.ToJSON GetCreatedPublicChats where
  toJSON
    GetCreatedPublicChats
      { _type = _type
      } =
      A.object
        [ "@type" A..= T.String "getCreatedPublicChats",
          "type" A..= _type
        ]
