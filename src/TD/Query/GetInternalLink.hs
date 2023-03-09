{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetInternalLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InternalLinkType as InternalLinkType
import qualified Utils as U

-- |
-- Returns an HTTPS or a tg: link with the given type. Can be called before authorization @type Expected type of the link @is_http Pass true to create an HTTPS link (only available for some link types); pass false to create a tg: link
data GetInternalLink = GetInternalLink
  { -- |
    is_http :: Maybe Bool,
    -- |
    _type :: Maybe InternalLinkType.InternalLinkType
  }
  deriving (Eq)

instance Show GetInternalLink where
  show
    GetInternalLink
      { is_http = is_http_,
        _type = _type_
      } =
      "GetInternalLink"
        ++ U.cc
          [ U.p "is_http" is_http_,
            U.p "_type" _type_
          ]

instance T.ToJSON GetInternalLink where
  toJSON
    GetInternalLink
      { is_http = is_http_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "getInternalLink",
          "is_http" A..= is_http_,
          "type" A..= _type_
        ]
