{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMessageLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a public or private message link. Can be called for any internal link of the type internalLinkTypeMessage @url The message link
data GetMessageLinkInfo = GetMessageLinkInfo
  { -- |
    url :: Maybe String
  }
  deriving (Eq)

instance Show GetMessageLinkInfo where
  show
    GetMessageLinkInfo
      { url = url_
      } =
      "GetMessageLinkInfo"
        ++ U.cc
          [ U.p "url" url_
          ]

instance T.ToJSON GetMessageLinkInfo where
  toJSON
    GetMessageLinkInfo
      { url = url_
      } =
      A.object
        [ "@type" A..= T.String "getMessageLinkInfo",
          "url" A..= url_
        ]
