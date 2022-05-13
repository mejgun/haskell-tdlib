{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetDeepLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a tg:// deep link. Use "tg://need_update_for_some_feature" or "tg:some_unsupported_feature" for testing. Returns a 404 error for unknown links. Can be called before authorization @link The link
data GetDeepLinkInfo = GetDeepLinkInfo
  { -- |
    link :: Maybe String
  }
  deriving (Eq)

instance Show GetDeepLinkInfo where
  show
    GetDeepLinkInfo
      { link = link_
      } =
      "GetDeepLinkInfo"
        ++ U.cc
          [ U.p "link" link_
          ]

instance T.ToJSON GetDeepLinkInfo where
  toJSON
    GetDeepLinkInfo
      { link = link_
      } =
      A.object
        [ "@type" A..= T.String "getDeepLinkInfo",
          "link" A..= link_
        ]
