module TD.Query.SetNetworkType
  (SetNetworkType(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.NetworkType as NetworkType

-- | Sets the current network type. Can be called before authorization. Calling this method forces all network connections to reopen, mitigating the delay in switching between different networks, so it must be called whenever the network is changed, even if the network type remains the same. Network type is used to check whether the library can use the network at all and also for collecting detailed network data usage statistics. Returns 'TD.Data.Ok.Ok'
data SetNetworkType
  = SetNetworkType
    { _type :: Maybe NetworkType.NetworkType -- ^ The new network type; pass null to set network type to networkTypeOther
    }
  deriving (Eq, Show)

instance I.ShortShow SetNetworkType where
  shortShow
    SetNetworkType
      { _type = _type_
      }
        = "SetNetworkType"
          ++ I.cc
          [ "_type" `I.p` _type_
          ]

instance AT.ToJSON SetNetworkType where
  toJSON
    SetNetworkType
      { _type = _type_
      }
        = A.object
          [ "@type" A..= AT.String "setNetworkType"
          , "type"  A..= _type_
          ]

