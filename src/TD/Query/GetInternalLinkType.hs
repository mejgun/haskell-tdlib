{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetInternalLinkType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about the type of an internal link. Returns a 404 error if the link is not internal. Can be called before authorization @link The link
data GetInternalLinkType = GetInternalLinkType
  { -- |
    link :: Maybe String
  }
  deriving (Eq)

instance Show GetInternalLinkType where
  show
    GetInternalLinkType
      { link = link_
      } =
      "GetInternalLinkType"
        ++ U.cc
          [ U.p "link" link_
          ]

instance T.ToJSON GetInternalLinkType where
  toJSON
    GetInternalLinkType
      { link = link_
      } =
      A.object
        [ "@type" A..= T.String "getInternalLinkType",
          "link" A..= link_
        ]
