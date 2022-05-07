{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetExternalLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an HTTP URL which can be used to automatically authorize the current user on a website after clicking an HTTP link. Use the method getExternalLinkInfo to find whether a prior user confirmation is needed
data GetExternalLink = GetExternalLink
  { -- |
    allow_write_access :: Maybe Bool,
    -- | The HTTP link @allow_write_access Pass true if the current user allowed the bot, returned in getExternalLinkInfo, to send them messages
    link :: Maybe String
  }
  deriving (Eq)

instance Show GetExternalLink where
  show
    GetExternalLink
      { allow_write_access = allow_write_access,
        link = link
      } =
      "GetExternalLink"
        ++ U.cc
          [ U.p "allow_write_access" allow_write_access,
            U.p "link" link
          ]

instance T.ToJSON GetExternalLink where
  toJSON
    GetExternalLink
      { allow_write_access = allow_write_access,
        link = link
      } =
      A.object
        [ "@type" A..= T.String "getExternalLink",
          "allow_write_access" A..= allow_write_access,
          "link" A..= link
        ]
