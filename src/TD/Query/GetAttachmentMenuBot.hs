{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetAttachmentMenuBot where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a bot that can be added to attachment menu @bot_user_id Bot's user identifier
data GetAttachmentMenuBot = GetAttachmentMenuBot
  { -- |
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetAttachmentMenuBot where
  show
    GetAttachmentMenuBot
      { bot_user_id = bot_user_id
      } =
      "GetAttachmentMenuBot"
        ++ U.cc
          [ U.p "bot_user_id" bot_user_id
          ]

instance T.ToJSON GetAttachmentMenuBot where
  toJSON
    GetAttachmentMenuBot
      { bot_user_id = bot_user_id
      } =
      A.object
        [ "@type" A..= T.String "getAttachmentMenuBot",
          "bot_user_id" A..= bot_user_id
        ]
