{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetInactiveSessionTtl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the period of inactivity after which sessions will automatically be terminated @inactive_session_ttl_days New number of days of inactivity before sessions will be automatically terminated; 1-366 days
data SetInactiveSessionTtl = SetInactiveSessionTtl
  { -- |
    inactive_session_ttl_days :: Maybe Int
  }
  deriving (Eq)

instance Show SetInactiveSessionTtl where
  show
    SetInactiveSessionTtl
      { inactive_session_ttl_days = inactive_session_ttl_days
      } =
      "SetInactiveSessionTtl"
        ++ U.cc
          [ U.p "inactive_session_ttl_days" inactive_session_ttl_days
          ]

instance T.ToJSON SetInactiveSessionTtl where
  toJSON
    SetInactiveSessionTtl
      { inactive_session_ttl_days = inactive_session_ttl_days
      } =
      A.object
        [ "@type" A..= T.String "setInactiveSessionTtl",
          "inactive_session_ttl_days" A..= inactive_session_ttl_days
        ]
