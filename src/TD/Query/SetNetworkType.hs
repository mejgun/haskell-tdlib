{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetNetworkType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.NetworkType as NetworkType
import qualified Utils as U

-- |
-- Sets the current network type. Can be called before authorization. Calling this method forces all network connections to reopen, mitigating the delay in switching between different networks,
-- so it must be called whenever the network is changed, even if the network type remains the same. Network type is used to check whether the library can use the network at all and also for collecting detailed network data usage statistics
data SetNetworkType = SetNetworkType
  { -- | The new network type; pass null to set network type to networkTypeOther
    _type :: Maybe NetworkType.NetworkType
  }
  deriving (Eq)

instance Show SetNetworkType where
  show
    SetNetworkType
      { _type = _type_
      } =
      "SetNetworkType"
        ++ U.cc
          [ U.p "_type" _type_
          ]

instance T.ToJSON SetNetworkType where
  toJSON
    SetNetworkType
      { _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "setNetworkType",
          "type" A..= _type_
        ]
