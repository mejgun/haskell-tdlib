{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetExternalLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an HTTP URL which can be used to automatically authorize the current user on a website after clicking an HTTP link. Use the method getExternalLinkInfo to find whether a prior user confirmation is needed
data GetExternalLink = GetExternalLink
  { -- | Pass true if the current user allowed the bot, returned in getExternalLinkInfo, to send them messages
    allow_write_access :: Maybe Bool,
    -- | The HTTP link
    link :: Maybe String
  }
  deriving (Eq)

instance Show GetExternalLink where
  show
    GetExternalLink
      { allow_write_access = allow_write_access_,
        link = link_
      } =
      "GetExternalLink"
        ++ U.cc
          [ U.p "allow_write_access" allow_write_access_,
            U.p "link" link_
          ]

instance T.ToJSON GetExternalLink where
  toJSON
    GetExternalLink
      { allow_write_access = allow_write_access_,
        link = link_
      } =
      A.object
        [ "@type" A..= T.String "getExternalLink",
          "allow_write_access" A..= allow_write_access_,
          "link" A..= link_
        ]
