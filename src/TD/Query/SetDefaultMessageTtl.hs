{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetDefaultMessageTtl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageTtl as MessageTtl
import qualified Utils as U

-- |
-- Changes the default message Time To Live setting (self-destruct timer) for new chats @ttl New message TTL; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
data SetDefaultMessageTtl = SetDefaultMessageTtl
  { -- |
    ttl :: Maybe MessageTtl.MessageTtl
  }
  deriving (Eq)

instance Show SetDefaultMessageTtl where
  show
    SetDefaultMessageTtl
      { ttl = ttl_
      } =
      "SetDefaultMessageTtl"
        ++ U.cc
          [ U.p "ttl" ttl_
          ]

instance T.ToJSON SetDefaultMessageTtl where
  toJSON
    SetDefaultMessageTtl
      { ttl = ttl_
      } =
      A.object
        [ "@type" A..= T.String "setDefaultMessageTtl",
          "ttl" A..= ttl_
        ]
