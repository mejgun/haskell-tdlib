{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatBoostLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a link to boost a chat. Can be called for any internal link of the type internalLinkTypeChatBoost @url The link to boost a chat
data GetChatBoostLinkInfo = GetChatBoostLinkInfo
  { -- |
    url :: Maybe String
  }
  deriving (Eq)

instance Show GetChatBoostLinkInfo where
  show
    GetChatBoostLinkInfo
      { url = url_
      } =
      "GetChatBoostLinkInfo"
        ++ U.cc
          [ U.p "url" url_
          ]

instance T.ToJSON GetChatBoostLinkInfo where
  toJSON
    GetChatBoostLinkInfo
      { url = url_
      } =
      A.object
        [ "@type" A..= T.String "getChatBoostLinkInfo",
          "url" A..= url_
        ]
