{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetVideoChatAvailableParticipants where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns list of participant identifiers, on whose behalf a video chat in the chat can be joined @chat_id Chat identifier
data GetVideoChatAvailableParticipants = GetVideoChatAvailableParticipants
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetVideoChatAvailableParticipants where
  show
    GetVideoChatAvailableParticipants
      { chat_id = chat_id_
      } =
      "GetVideoChatAvailableParticipants"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetVideoChatAvailableParticipants where
  toJSON
    GetVideoChatAvailableParticipants
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getVideoChatAvailableParticipants",
          "chat_id" A..= chat_id_
        ]
