{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetExternalLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about an action to be done when the current user clicks an external link. Don't use this method for links from secret chats if web page preview is disabled in secret chats @link The link
data GetExternalLinkInfo = GetExternalLinkInfo
  { -- |
    link :: Maybe String
  }
  deriving (Eq)

instance Show GetExternalLinkInfo where
  show
    GetExternalLinkInfo
      { link = link_
      } =
      "GetExternalLinkInfo"
        ++ U.cc
          [ U.p "link" link_
          ]

instance T.ToJSON GetExternalLinkInfo where
  toJSON
    GetExternalLinkInfo
      { link = link_
      } =
      A.object
        [ "@type" A..= T.String "getExternalLinkInfo",
          "link" A..= link_
        ]
