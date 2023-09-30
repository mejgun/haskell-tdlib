{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatBoosts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns list of boosts applied to a chat. The user must be an administrator in the channel chat to get the list of boosts
data GetChatBoosts = GetChatBoosts
  { -- | The maximum number of boosts to be returned; up to 100. For optimal performance, the number of returned boosts can be smaller than the specified limit
    limit :: Maybe Int,
    -- | Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    offset :: Maybe String,
    -- | Identifier of the chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatBoosts where
  show
    GetChatBoosts
      { limit = limit_,
        offset = offset_,
        chat_id = chat_id_
      } =
      "GetChatBoosts"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset" offset_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatBoosts where
  toJSON
    GetChatBoosts
      { limit = limit_,
        offset = offset_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatBoosts",
          "limit" A..= limit_,
          "offset" A..= offset_,
          "chat_id" A..= chat_id_
        ]
