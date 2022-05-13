{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DisconnectWebsite where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Disconnects website from the current user's Telegram account @website_id Website identifier
data DisconnectWebsite = DisconnectWebsite
  { -- |
    website_id :: Maybe Int
  }
  deriving (Eq)

instance Show DisconnectWebsite where
  show
    DisconnectWebsite
      { website_id = website_id_
      } =
      "DisconnectWebsite"
        ++ U.cc
          [ U.p "website_id" website_id_
          ]

instance T.ToJSON DisconnectWebsite where
  toJSON
    DisconnectWebsite
      { website_id = website_id_
      } =
      A.object
        [ "@type" A..= T.String "disconnectWebsite",
          "website_id" A..= website_id_
        ]
